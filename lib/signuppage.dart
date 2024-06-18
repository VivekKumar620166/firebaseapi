 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignupPage {
  static CustomTextfiled(
      TextEditingController controller,String text,IconData  iconData, bool toHide){
     return
       Padding(
         padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 15),
         child: TextField(
         controller: controller,
         obscureText: toHide,
         decoration: InputDecoration(
           hintText: text,
           suffixIcon: Icon(iconData),
           border: OutlineInputBorder(
             borderRadius: BorderRadius.circular(25)

           )

         ),

              ),
       );

  }
  static CustomButton(VoidCallback voidCallback,String text){
return
  SizedBox(height: 50,width: 200,
    child:
    ElevatedButton(onPressed: (){
  voidCallback();
  },style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(50),


)),

child:
Text(text,style: TextStyle(color: Colors.black,fontSize: 25),)),);
  }
  static CustomAlertBox(BuildContext context,String text){
    return showDialog(context: context, builder:(BuildContext context){
      return AlertDialog(
        title: Text(text),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);

          },
              child: Text("ok"))
        ],
      );
    });
  }


 }
