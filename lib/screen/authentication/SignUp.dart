import 'package:flutter/material.dart';
import 'package:instagram_clone/screen/mainpage/instahome.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late String _email, _password;
  final auth = FirebaseAuth.instance;
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
          Container(
            child: Form(
              child: Column(
                children: <Widget>[
                  Container(
                    child: TextFormField(
                        validator: (input) {
                          if (input!.isEmpty) return 'Enter Email';
                        },
                        decoration: InputDecoration(
                            labelText: 'Username',
                            prefixIcon: Icon(Icons.email)),
                        onChanged: (value) {
                          setState(() {
                            _email = value.trim();
                          });
                        }),
                  ),
                  Container(
                    child: TextFormField(
                        validator: (input) {
                          if (input!.length < 6)
                            return 'Provide Minimum 6 Character';
                        },
                        decoration: InputDecoration(
                            labelText: 'Password',
                            prefixIcon: Icon(Icons.lock)),
                        obscureText: true,
                        onChanged: (value) {
                          setState(() {
                            _password = value.trim();
                          });
                        }),
                  ),
                  Container(
                    child: TextFormField(
                        validator: (input) {
                          if (input!.length < 6)
                            return 'Provide Minimum 6 Character';
                        },
                        decoration: InputDecoration(
                            labelText: 'Confirm Password',
                            prefixIcon: Icon(Icons.lock)),
                        obscureText: true,
                        onChanged: (value) {}),
                  ),
                  Container(
                    child: TextFormField(
                        validator: (input) {
                          if (input!.isEmpty) return 'Enter Email';
                        },
                        decoration: InputDecoration(
                            labelText: 'Email ID',
                            prefixIcon: Icon(Icons.email)),
                        obscureText: true,
                        onChanged: (value) {
                          /*Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => InstaHome()),
                          );*/
                        }),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          auth.createUserWithEmailAndPassword(
                              email: _email, password: _password);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => InstaHome()),
                          );
                        },
                        child: Text(
                          'Sign In',
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
                    ],
                  ),
                ],
              ),
            ),
          )
        ])));
  }
}
