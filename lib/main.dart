import 'package:flutter/material.dart';
import 'package:code_glider/screens/loginscreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(NaviPage());
}

class NaviPage extends StatefulWidget {
  const NaviPage({Key? key}) : super(key: key);

  @override
  State<NaviPage> createState() => _NaviPageState();
}

class _NaviPageState extends State<NaviPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // navigator
      initialRoute: LoginScreen.id,
      routes: {
        LoginScreen.id :(context)=> LoginScreen(),
      },
    );
  }
}
