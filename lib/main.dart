import 'package:flutter/material.dart';
import 'package:instagram_clone/screen/authentication/Login.dart';
import 'package:instagram_clone/screen/mainpage/instahome.dart';
import 'package:instagram_clone/screen/authentication/signin.dart';

import 'package:instagram_clone/screen/profile/profilescreen.dart';
import 'package:instagram_clone/welcome_screen.dart';

import 'constants/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Instagram Clone',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: WELCOME,
        routes: {
          WELCOME: (context) => WelcomeScreen(),
          SIGN_IN: (context) => Signinpage(),
          LOGIN: (context) => Login(),
          HOME: (context) => InstaHome(),
          PROFILE: (context) => ProfileScreen()
        });
  }
}
