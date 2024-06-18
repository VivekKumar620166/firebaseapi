
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseapi/empty.dart';
import 'package:firebaseapi/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'datafromdatabase.dart';
import 'mufirebase folder/MyNoteBook.dart';
import 'otp.dart';
class PhoneAuth extends StatefulWidget {
  const PhoneAuth({Key? key}) : super(key: key);
  @override _PhoneAuth createState() => _PhoneAuth();
}
class _PhoneAuth extends State<PhoneAuth> {
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage(),));
              },
              child: Icon(Icons.home,color: Colors.white,)),
          backgroundColor: Colors.deepPurple,
          centerTitle: true,
          title: Center(
              child:
              Text("Phone Auth",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),

        ),
        body:
      SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 30),
              child: TextField(
                    controller:phoneController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Enter your Phone Number",
                  suffixIcon: Icon(Icons.phone_iphone_rounded),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
        
        
                  )
                ),
              ),
            ),
            SizedBox(height: 50),
            Container(
             height: 55,
              width: 230,
        
             decoration: BoxDecoration(
        
               borderRadius: BorderRadius.circular(25)
             ),
              child:
              // InkWell(
              //   onTap: (){
              //
              //   },
              //   child: Center(child: Text("Verify Phone Number",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),)),
              // ),
             Container(child:
        
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
              children: [
        
                ElevatedButton(
        
                onPressed: () async{
                  String phoneNumber = "+91-" + phoneController.text.trim();
                  if (phoneNumber.isNotEmpty) {
                    await FirebaseAuth.instance.verifyPhoneNumber(
                      phoneNumber: phoneNumber,
                      verificationCompleted:(PhoneAuthCredential credential ){},
                      verificationFailed:(FirebaseAuthException ex){},
                      codeSent:(String verificationid, int? resendtoken){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => OtpScreen(verificationid: verificationid,)));
                      },
                      codeAutoRetrievalTimeout: (String verificationId){},
                    );
                  } else {
                    // Handle empty phone number input
                  }
                },
        
                child:
                Text("Verify Phone Number"),
              )],
             ),
        
        
             ),
        
            ),
            SizedBox(height: 25,),
            Container(
        
              height: 40,
        
              child:
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => EmptyStatefulWidget(),));
                },
                child: Text("get data from firebase",style: TextStyle(color: Colors.deepPurple,fontSize: 20,fontWeight: FontWeight.bold),),
              ),
        
            ),
            Container(
        
              height: 40,
        
              child:
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => FirebaseDatabase(),));
                },
                child: Text("data from firebase",style: TextStyle(color: Colors.deepPurple,fontSize: 20,fontWeight: FontWeight.bold),),
              ),
        
            ),
            SizedBox(height: 50,),
            Container(
        
              height: 40,
              width: 200,
              decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(25)       ),
              child: GestureDetector(
        
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MyNoteBook(),));
        
                },
                child: Center(
                  child: (
                      Text("Employee ID Generate",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),)
                  ),
                ),
              ),
            ),
          ],
        ),
      )

    );
  }
}
