import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

import 'mufirebase folder/MyNoteBook.dart';
import 'mufirebase folder/postfirebase.dart';

class FirebaseDatabase extends StatefulWidget {

  @override
  _FirebaseDatabaseState createState() => _FirebaseDatabaseState();

}

class _FirebaseDatabaseState extends State<FirebaseDatabase> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
         backgroundColor: Colors.white,
      appBar:
      AppBar(
        backgroundColor: Colors.deepPurple,
        leading:
        GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
            child: Icon(Icons.arrow_back_ios_new,color: Colors.white,)),

        title:
      Row(
        mainAxisAlignment:MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child:
            Row(
              children:
              [
                Container(
                  child:  Text("Post",style: TextStyle(color: Colors.white),
                  ),
                ),

              ],
            ),


          ),
        ],
      )




      ),


      floatingActionButton:FloatingActionButton(onPressed:(){

      },
          child:
          GestureDetector(
            onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) =>firebasepost(),));
            },
              child: Icon(Icons.add)) ,),
      // Your widget's UI code here
    );
  }
}
