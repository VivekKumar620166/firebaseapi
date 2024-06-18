
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseapi/loginpage.dart';
import 'package:firebaseapi/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class OtpScreen extends StatefulWidget {
  String  verificationid;
 OtpScreen({super. key,required this.verificationid}) ;


  @override
  _OtpScreen createState() => _OtpScreen();
}

class _OtpScreen extends State<OtpScreen> {

  TextEditingController otpController = TextEditingController();





  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          leading:    InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios_new,color:Colors.white,)),
          backgroundColor: Colors.deepPurple,
          centerTitle: true,
          title: Center(
              child:
              Text("OTP SCREEN",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),

        ),
        body:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              controller: otpController,
              keyboardType:TextInputType.phone ,
              decoration: InputDecoration(
                hintText: "Enter the OTP",
                prefixIcon: Icon(Icons.phone),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25)
                )
              ),

            ),
          ),
          SizedBox( height:30),
          Container(
            width: 170,
            height: 50,
           decoration: BoxDecoration(
             color: Colors.deepPurple,
             borderRadius: BorderRadius.circular(25)
           ),
            child:
            InkWell(
                onTap: () async {
                  try {
                    PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: widget.verificationid, smsCode: otpController.text.trim());
                    await FirebaseAuth.instance.signInWithCredential(credential);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(title: "hello")));
                  } catch (ex) {
                    print(ex.toString());
                  }
                },
            
                child: Center(child: Text(" Confirm OTP",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),))),
          )
        ],
      )


    );
  }
}
