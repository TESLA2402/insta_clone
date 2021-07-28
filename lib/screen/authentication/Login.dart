import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/constants.dart';
//import 'package:instagram_clone/screen/mainpage/instahome.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_clone/firebase/auth.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  int buttonColor = 0xff26A9FF;
  bool inputTextNotNull = false;
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();
  bool readonly = false;
  final keys = GlobalKey<FormState>();
  Auth auth = new Auth();

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
                            return RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value!)
                                ? null
                                : "Please Enter Correct Email";
                          },
                          controller: emailController,
                          decoration: InputDecoration(
                              labelText: 'Username',
                              prefixIcon: Icon(Icons.email)),
                          onChanged: (text) {
                            setState(() {
                              if (emailController.text.length >= 2 &&
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
                            return value!.length > 6
                                ? null
                                : "Enter Password 6+ characters";
                          },
                          controller: passwordController,
                          decoration: InputDecoration(
                              labelText: 'Password',
                              prefixIcon: Icon(Icons.lock)),
                          obscureText: true,
                          onChanged: (text) {
                            setState(() {
                              if (emailController.text.length >= 2 &&
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
                          //controller: _btnController,
                          onPressed: () async {
                            /*if (keys.currentState!.validate()) {
                              setState(() {
                                readonly = true;
                              });
                              FocusScope.of(context).unfocus();*/
                            String msg = await auth.signIn(
                                emailController.text.trim(),
                                passwordController.text.trim());
                            print(msg);
                            Navigator.pushNamed(context, HOME);
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
                      ],
                    ),
                  ],
                ),
              ),
            )
          ])),
    ));
  }
}
