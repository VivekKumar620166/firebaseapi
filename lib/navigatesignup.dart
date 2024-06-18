
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseapi/main.dart';
import 'package:firebaseapi/signuppage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyySignPage extends StatefulWidget {
  const MyySignPage({Key? key}) : super(key: key);


  @override
  _MyySignPage createState() => _MyySignPage();

}

class _MyySignPage extends State<MyySignPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  signUp(String name, mobile, email, password) async {
    if (name == "" || mobile == "" || email == "" || password == "") {
      SignupPage.CustomAlertBox(context, "Enter required fields");
    } else {
      UserCredential? userCredential;
      try {
        userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: email, password: password);
        Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(title: "HOMEPAGE",)));
      } on FirebaseAuthException catch (ex) {
        return SignupPage.CustomAlertBox(context, ex.code.toString());
      }
    }
  }




  @override
  Widget build(BuildContext context) {


    return Scaffold(

        appBar: AppBar(

          backgroundColor: Colors.deepPurple,
          centerTitle: true,
          leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
              child: Icon(Icons.arrow_back_ios_new,color: Colors.white,)),
          title: Center(child:

          Text("Sign Up Page     ",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),

          ),

          ),


        ),
        body:
        Center(
          child: SingleChildScrollView(

            child: Column(

              children: [
                SignupPage.CustomTextfiled(nameController, " Name", Icons.person, false),
                SignupPage.CustomTextfiled(mobileController, "Mobile/No", Icons.phone, false),
                SignupPage.CustomTextfiled(emailController, "Email", Icons.email, false),
                SignupPage.CustomTextfiled(passwordController, "Password", Icons.lock, false),
                SizedBox(height:30),
                SignupPage.CustomButton(() {

                  signUp(nameController.text.toString(),mobileController.text.toString(),emailController.text.toString(),passwordController.text.toString());
                },"SignUp",),




              ],
            ),
          ),
        ),


    );
  }
}
