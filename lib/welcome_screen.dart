import 'package:flutter/material.dart';
import 'package:instagram_clone/screen/authentication/Login.dart';
import 'package:instagram_clone/screen/authentication/SignUp.dart';

//import 'package:instagram_clone/screen/auth/signup.dart';
//import 'SignUp.dart';
//import 'package:instagram_clone/Login.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 50.0),
            RichText(
                text: TextSpan(
              text: 'Instagram ',
              style: TextStyle(
                  fontSize: 100.0,
                  fontFamily: 'Billabong',
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            )),
            SizedBox(height: 200.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  },
                  child: Text(
                    'Log in',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.only(left: 100, right: 100),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      primary: Colors.blue),
                ),
                SizedBox(width: 400.0, height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUp()),
                    );
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.only(left: 100, right: 100),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      primary: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
