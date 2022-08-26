import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernamecontrol = TextEditingController();
  TextEditingController passwordcontrol = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.green.shade300,
      ),
      home: Scaffold(
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            padding: EdgeInsets.symmetric(horizontal: 3),
            child: Container(
              height: 500,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(300),
                    child: CircleAvatar(
                      child: Image.asset('images/logo.gif'),
                      radius: 75,
                    ),
                  ),
                  LoginEntry(usernamecontrol: usernamecontrol, txt: 'username'),
                  LoginEntry(usernamecontrol: usernamecontrol, txt: 'password'),
                  Column(
                    children: <Widget>[
                      LongUsualButton('Login', () {
                        print('hello');
                      }),
                      LongUsualButton('SignUp', () {
                        print('hello');
                      }),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextButton LongUsualButton(@required txt, @required action) {
    return TextButton(
      onPressed: action,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[800],
          borderRadius: BorderRadius.circular(30),
        ),
        width: double.infinity,
        height: 40,
        child: Center(
            child: Text(txt,
                style: GoogleFonts.poppins(
                    textStyle:TextStyle(color: Colors.white, fontSize: 18.5)))),
      ),
    );
  }
}

class LoginEntry extends StatelessWidget {
  const LoginEntry({
    Key? key,
    required this.usernamecontrol,
    required this.txt,
  }) : super(key: key);

  final TextEditingController usernamecontrol;
  final String txt;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: usernamecontrol,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            width: 1,
          ),
        ),
        filled: true,
        hintStyle:
            GoogleFonts.lato(textStyle: TextStyle(color: Colors.black54)),
        hintText: txt,
        fillColor: Colors.white10,
      ),
    );
  }
}
