import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseapi/main.dart';
import 'package:flutter/material.dart';
import 'loginpage.dart';
class CheckUser extends StatefulWidget {
  const CheckUser({Key? key}) : super(key: key);

  @override
  _CheckUserState createState() => _CheckUserState();
}

class _CheckUserState extends State<CheckUser> {
  late Widget _screen;

  @override
  void initState() {
    super.initState();
    checkUser();
  }

  void checkUser() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        _screen = MyHomePage(title: "HOMESCREEN");
      });
    } else {
      setState(() {
        _screen = const LoginPage();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _screen != null ? _screen : const CircularProgressIndicator(),
      ),
    );
  }
}
