
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods{
  Future addEmployeeDetails(Map<String,dynamic>employeeInfoMap, String id) async{
    return await FirebaseFirestore.instance
        .collection("Employee")
        .doc(id)
        .set(employeeInfoMap);
  }

  Future<Stream<QuerySnapshot>>getEmployeeDetails()async{
    return await FirebaseFirestore.instance.collection("Employee").snapshots();

  }

  Future updateEmployeeDetails(String id,Map<String,dynamic>updateInfo ) async{
    return await FirebaseFirestore.instance.collection("Employee").doc(id)
        .update(updateInfo);
  }


  // Future deleteEmployeeDetails(String id) async{
  //   return await FirebaseFirestore.instance.collection("Employee").doc(id);
  // }

  Future<void> deleteEmployeeDetails(String id) async {
    await FirebaseFirestore.instance.collection("Employee").doc(id).delete();
  }

}






















//
//
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
//
//
// class Employee extends StatelessWidget {
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController ageController = TextEditingController();
//   final TextEditingController locationController = TextEditingController();
//
//   void addEmployee(BuildContext context) {
//     // Save employee details to Firestore
//     DatabaseMethods().addEmployeeDetails({
//       'Name': nameController.text,
//       'Age': ageController.text,
//       'Location': locationController.text,
//     }, 'employee_id');
//
//     // Navigate back to MyNoteBook screen
//     Navigator.pop(context);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Add Employee'),
//       ),
//       body: Container(
//         padding: EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             TextField(
//               controller: nameController,
//               decoration: InputDecoration(
//                 labelText: 'Name',
//               ),
//             ),
//             SizedBox(height: 20),
//             TextField(
//               controller: ageController,
//               decoration: InputDecoration(
//                 labelText: 'Age',
//               ),
//             ),
//             SizedBox(height: 20),
//             TextField(
//               controller: locationController,
//               decoration: InputDecoration(
//                 labelText: 'Location',
//               ),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () => addEmployee(context),
//               child: Text('Add Employee'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
