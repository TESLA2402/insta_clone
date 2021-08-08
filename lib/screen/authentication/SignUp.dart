import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/constants.dart';
//import 'package:instagram_clone/screen/mainpage/instahome.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:instagram_clone/firebase/auth.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordController2 = TextEditingController();
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();
  int buttonColor = 0xff26A9FF;
  bool inputTextNotNull = false;
  final keys = GlobalKey<FormState>();
  Auth auth = new Auth();
  bool readonly = false;
  @override
  void dispose() {
    _btnController.reset();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
                            readOnly: readonly,
                            validator: (value) {
                              if (value!.length < 3)
                                return "Name must be of 3+ characters without any space";
                              else if (value.contains(' '))
                                return "Name must be of 3+ characters without any space";
                              else
                                return null;
                            },
                            controller: usernameController,
                            decoration: InputDecoration(
                                labelText: 'Username',
                                prefixIcon: Icon(Icons.email)),
                            onChanged: (text) {
                              setState(() {
                                if (emailController.text.length >= 2 &&
                                    passwordController2.text.length >= 2 &&
                                    usernameController.text.length >= 2 &&
                                    passwordController.text.length >= 2) {
                                  inputTextNotNull = true;
                                  _btnController.stop();
                                } else {
                                  inputTextNotNull = false;
                                }
                              });
                            }),
                      ),
                      Container(
                        child: TextFormField(
                            readOnly: readonly,
                            validator: (value) {
                              if (value!.length < 6)
                                return "Enter Password 6+ characters";
                              else if (value != passwordController2.text)
                                return "Passwords doesn't match";
                              else
                                return null;
                            },
                            controller: passwordController,
                            decoration: InputDecoration(
                                labelText: 'Password',
                                prefixIcon: Icon(Icons.lock)),
                            obscureText: true,
                            onChanged: (text) {
                              setState(() {
                                if (emailController.text.length >= 2 &&
                                    passwordController2.text.length >= 2 &&
                                    usernameController.text.length >= 2 &&
                                    passwordController.text.length >= 2) {
                                  inputTextNotNull = true;
                                  _btnController.stop();
                                } else {
                                  inputTextNotNull = false;
                                }
                              });
                            }),
                      ),
                      Container(
                        child: TextFormField(
                            readOnly: readonly,
                            validator: (value) {
                              if (value!.length < 6)
                                return "Enter Password 6+ characters";
                              else if (value != passwordController.text)
                                return "Passwords doesn't match";
                            },
                            controller: passwordController2,
                            decoration: InputDecoration(
                                labelText: 'Confirm Password',
                                prefixIcon: Icon(Icons.lock)),
                            obscureText: true,
                            onChanged: (text) {
                              setState(() {
                                if (emailController.text.length >= 2 &&
                                    passwordController2.text.length >= 2 &&
                                    usernameController.text.length >= 2 &&
                                    passwordController.text.length >= 2) {
                                  inputTextNotNull = true;
                                  _btnController.stop();
                                } else {
                                  inputTextNotNull = false;
                                }
                              });
                            }),
                      ),
                      Container(
                        child: TextFormField(
                            readOnly: readonly,
                            validator: (value) {
                              return RegExp(
                                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(value!)
                                  ? null
                                  : "Please Enter Correct Email";
                            },
                            controller: emailController,
                            decoration: InputDecoration(
                                labelText: 'Email ID',
                                prefixIcon: Icon(Icons.email)),
                            //obscureText: true,
                            onChanged: (text) {
                              setState(() {
                                if (emailController.text.length >= 2 &&
                                    passwordController2.text.length >= 2 &&
                                    usernameController.text.length >= 2 &&
                                    passwordController.text.length >= 2) {
                                  inputTextNotNull = true;
                                  _btnController.stop();
                                } else {
                                  inputTextNotNull = false;
                                }
                              });
                            }),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ElevatedButton(
                            onPressed: () async {
                              /*if (keys.currentState!.validate()) {
                                setState(() {
                                  readonly = true;
                                });*/
                              FocusScope.of(context).unfocus();
                              String msg = await auth.signUp(
                                  usernameController.text.trim(),
                                  emailController.text.trim(),
                                  passwordController.text.trim());
                              print(msg);
                              Navigator.pushNamed(context, HOME);
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
            ])),
      ),
    );
  }
}
