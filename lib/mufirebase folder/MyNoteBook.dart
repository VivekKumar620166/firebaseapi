import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'database.dart';
import 'employee.dart';

class MyNoteBook extends StatefulWidget {
  @override
  _MyNoteBookState createState() => _MyNoteBookState();
}

class _MyNoteBookState extends State<MyNoteBook> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  Stream<QuerySnapshot>? employeeStream;

  getOnLoad() async {
    employeeStream = await DatabaseMethods().getEmployeeDetails();
    setState(() {});
  }

  @override
  void initState() {
    getOnLoad();
    super.initState();
  }

  Widget allEmployeeDetails() {
    return StreamBuilder<QuerySnapshot>(
      stream: employeeStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              DocumentSnapshot ds = snapshot.data!.docs[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Name: " + ds["Name"],
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    nameController.text = ds["Name"];
                                    ageController.text = ds["Age"];
                                    locationController.text = ds["Location"];
                                    editEmployeeDetails(context, ds);
                                  },
                                  child: Icon(Icons.edit, color: Colors.orange),
                                ),
                                SizedBox(width: 5,),
                                GestureDetector(
                                  onTap: () async {
                                    await DatabaseMethods().deleteEmployeeDetails(ds.id);
                                    getOnLoad(); // Refresh the list after deletion
                                  },
                                  child: Icon(Icons.delete, color: Colors.orange),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Text("Age: " + ds["Age"],
                            style: TextStyle(
                                color: Colors.orange,
                                fontSize: 25,
                                fontWeight: FontWeight.bold)),
                        Text("Location: " + ds["Location"],
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        } else {
          return Center(child: CircularProgressIndicator()); // Show a loading indicator while fetching data
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Employee()),
          );
        },
        child: Icon(Icons.add, color: Colors.orange),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios_new, color: Colors.orange),
        ),
        title: Text("Firebase ID Generate", style: TextStyle(color: Colors.orange)),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          children: [
            Expanded(child: allEmployeeDetails()),
          ],
        ),
      ),
    );
  }

  Future<void> editEmployeeDetails(BuildContext context, DocumentSnapshot ds) async {
    await showDialog(
      context: context,
      builder: (context) =>
         SingleChildScrollView(
           child: AlertDialog(

             content: Container(
               height: 400,
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Row(
                     children: [
                       GestureDetector(
                         onTap: () {
                           Navigator.pop(context);
                         },
                         child: Icon(Icons.cancel),
                       ),
                       Text(
                         "Edit",
                         style: TextStyle(
                             color: Colors.blue,
                             fontSize: 25,
                             fontWeight: FontWeight.bold),
                       ),
                       Text(
                         "Details",
                         style: TextStyle(
                             color: Colors.blue,
                             fontSize: 25,
                             fontWeight: FontWeight.bold),
                       )
                     ],
                   ),
                   SizedBox(
                     height: 20,
                   ),
                   Text(
                     "Name",
                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                   ),
                   SizedBox(height: 10),
                   Container(
                     padding: EdgeInsets.only(left: 10),
                     height: 40,
                     decoration: BoxDecoration(
                       border: Border.all(),
                       borderRadius: BorderRadius.circular(10),
                     ),
                     child: TextField(
                       controller: nameController,
                       decoration: InputDecoration(border: InputBorder.none),
                     ),
                   ),
                   SizedBox(height: 10),
                   Text(
                     "Age",
                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                   ),
                   SizedBox(height: 10),
                   Container(
                     padding: EdgeInsets.only(left: 10),
                     height: 40,
                     decoration: BoxDecoration(
                       border: Border.all(),
                       borderRadius: BorderRadius.circular(10),
                     ),
                     child: TextField(
                       controller: ageController,
                       decoration: InputDecoration(border: InputBorder.none),
                     ),
                   ),
                   SizedBox(height: 10),
                   Text(
                     "Location",
                     style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                   ),
                   SizedBox(height: 10),
                   Container(
                     padding: EdgeInsets.only(left: 10),
                     height: 40,
                     decoration: BoxDecoration(
                       border: Border.all(),
                       borderRadius: BorderRadius.circular(10),
                     ),
                     child: TextField(
                       controller: locationController,
                       decoration: InputDecoration(border: InputBorder.none),
                     ),
                   ),
                   SizedBox(height: 10,),
                   Center(
                     child: ElevatedButton(
                       onPressed: () async {
                         Map<String, dynamic> updateInfo = {
                           "Name": nameController.text,
                           "Age": ageController.text,
                           "Location": locationController.text,
                         };

                         await DatabaseMethods().updateEmployeeDetails(ds.id, updateInfo).then((value) {
                           getOnLoad(); // Refresh the list after update
                           Navigator.pop(context);
                         });
                       },
                       child: Text(
                         "Update",
                         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                       ),
                     ),
                   )
                 ],
               ),
             ),
           ),
         )
    );
  }
}
