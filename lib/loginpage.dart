import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseapi/main.dart';
import 'package:firebaseapi/phoneauth.dart';
import 'package:firebaseapi/signuppage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'navigatesignup.dart';

class LoginPage extends StatefulWidget {
  
  const LoginPage({Key? key}) : super(key: key);


  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  loginPage(String email, password)async{
    if(email=="" && password=="") {
      return SignupPage.CustomAlertBox(context, "Enter required fields");
    }
    else{
      UserCredential? userCredential;
      try{
        userCredential= await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((value) => Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage(title:"ok" ,))));
      }
      on FirebaseAuthException catch(ex){
        return
          SignupPage.CustomAlertBox(context, ex.code.toString());
      }

    }
  }



  @override
  Widget build(BuildContext context) {

    return 
Scaffold(
       appBar: AppBar(
         backgroundColor: Colors.deepPurple,
         title: Center(child: Text("LoginPage",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),

       ),
      body:
      // Column(
      //   children: [
      //     Row(
      //       children: [
      //         Text("login"),
      //       ],
      //     ),
      //     Row(
      //       children: [
      //         Text("already have an account"),
      //
      //       ],
      //     ),
      //     Row(
      //       children: [
      //         InkWell(
      //           onTap: (){
      //             print("hello");
      //
      //           },
      //             child: Text("already have an account")),
      //
      //       ],
      //     )
      //
      //   ],
      // )
      Container(

        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SignupPage.CustomTextfiled(emailController, "Email", Icons.email, false),
            SignupPage.CustomTextfiled(passwordController, "Password", Icons.lock, true),
            SizedBox(height:30),
            SignupPage.CustomButton(() {
              loginPage(emailController.text.toString(),passwordController.text.toString());},"Login",),
            SizedBox(height: 20,),
            Row(
mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account",style: TextStyle(fontSize: 16),),
                TextButton(onPressed: (){
        Navigator.push(context,MaterialPageRoute(builder: (context)=>MyySignPage()));
                },
                    child:
                Text("SignUp",style: TextStyle(fontSize: 16),))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context) => PhoneAuth(),));

                  },
                  child:
                  Text("Login with mobile number ", style: TextStyle(color:Colors.deepPurple,fontSize: 21,fontWeight: FontWeight.bold),),


                )
              ],
            )


          ],
        ),
      )

    );
  }
}
