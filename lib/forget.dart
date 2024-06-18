
// import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseapi/loginpage.dart';
import 'package:firebaseapi/signuppage.dart';
import 'package:flutter/material.dart';



class forgetpassword extends StatefulWidget {
  const forgetpassword({Key? key}) : super(key: key);

  @override
  State<forgetpassword> createState() => _forgetpasswordState();
}

class _forgetpasswordState extends State<forgetpassword> {
  TextEditingController emailController=TextEditingController();
  forgetpassword(String email) async{
    if(email==""){
      return SignupPage.CustomAlertBox(context, "Enter an Email to Reset Password");
    }
    else{
      FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forget Paswword"),
        centerTitle: true,
      ),
      body:
     
     Column(
       children: [
         SignupPage.CustomTextfiled(emailController, "Email", Icons.email, false),
         SizedBox(height: 30),
         
         SignupPage.CustomButton((){
           forgetpassword(emailController.text.toString());

         } ,"Reset "),
         Padding(
           padding: const EdgeInsets.only(top: 50),
           child: Container(
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(20),

             ),


             child:
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [

                 ElevatedButton(

                     onPressed: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),));

                     },
                     child:
                     Text("Login " ,style: TextStyle(fontSize: 30,color: Colors.black),))
               ],
             ),
           ),
         )
       ],
                  
       
     ),
      
      
      
    );
  }
}
