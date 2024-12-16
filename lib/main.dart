import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_test/add/cart.dart';
import 'package:first_test/auth/login.dart';
import 'package:first_test/homepage.dart';
import 'package:first_test/signup.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  get index => null;


  @override
  void initState() {
    FirebaseAuth.instance
  .authStateChanges()
  .listen((User? user) {
    if (user == null) {
      print('========================User is currently signed out!');
    } else {
      print('=========================User is signed in!');
    }
  });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      debugShowCheckedModeBanner: false,
      home:( FirebaseAuth.instance.currentUser != null && FirebaseAuth.instance.currentUser!.emailVerified ) ? Homepage () : const Login(),
       routes: {  
      "signup"  : (context)  =>   Signup(),
      "login"   : (context)  =>   Login(), 
      "homepage":  (context) =>  Homepage()  , 


        }
    ));
  }
}
