import 'package:firebase_database/firebase_database.dart';
import 'package:firebaseapi/mufirebase%20folder/MyNoteBook.dart';
import 'package:flutter/material.dart';

class firebasepost extends StatefulWidget {
  @override
  _firebasepostState createState() => _firebasepostState();
}

class _firebasepostState extends State<firebasepost> {
  final postController = TextEditingController();
  bool loading = false;
  final databaseRef = FirebaseDatabase.instance.ref('Post');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);          },
            child: Icon(Icons.arrow_back_ios_new, color: Colors.white)),
        title: Text(
          "Posting database from here",
          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(height: 30),
            TextFormField(
              controller: postController,
              maxLines: 4,
              decoration: InputDecoration( hintText: "What is in your mind",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(onPressed: (){

              databaseRef.child('1').set({'name': postController.text});
            }, child: Text("ADD"))

          ],
        ),
      ),
    );
  }
}


// databaseRef.child('1').set({'id': 1});