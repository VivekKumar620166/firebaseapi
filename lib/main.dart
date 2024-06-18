import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebaseapi/phoneauth.dart';
import 'package:flutter/material.dart';
import 'package:firebaseapi/checkuser.dart';
import 'checkuser.dart';
import 'loginpage.dart';

void main()  async{
  WidgetsFlutterBinding.ensureInitialized ();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyByeqtjcwutFoSsZA4YzbyMvT8b9EzDarw",
        appId: "flutter-series-6f257",
        messagingSenderId:"151439557932",
        projectId: "flutter-series-6f257",
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const PhoneAuth(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  logout()async{
    FirebaseAuth.instance.signOut().then((value) =>Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>LoginPage())));

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        leading: InkWell(
            onTap: logout,

            child: Icon(Icons.logout,color: Colors.white,)),


        title: Center(child: Text("HOMESCREEN",style: TextStyle(color: Colors.white,fontSize:28,fontWeight: FontWeight.bold),)),
      ),
      body:

      Center(


      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},


        child: const Icon(Icons.add),

      ));

    }
}
