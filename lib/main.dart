import 'package:flutter/material.dart';
import 'package:instagram_clone/screen/authentication/Login.dart';
import 'package:instagram_clone/screen/authentication/SignUp.dart';
import 'package:instagram_clone/screen/mainpage/instahome.dart';

import 'package:instagram_clone/screen/profile/profilescreen.dart';
import 'package:instagram_clone/welcome_screen.dart';

import 'constants/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:instagram_clone/sharedpref/sharedpref.dart';
import 'package:instagram_clone/loadingscreen/instaloadingscreen.dart';
import 'package:instagram_clone/screen/chat/chatDM.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

void configLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..userInteractions = false
    ..dismissOnTap = false;
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late String uid, username, bio, phno;

  bool isloading = true;

  @override
  Widget build(BuildContext context) {
    return isloading
        ? MediaQuery(
            child: InstaLoading(),
            data: MediaQueryData(),
          )
        : MaterialApp(
            title: 'Instagram Clone',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: Colors.white,
              primarySwatch: Colors.blue,
            ),
            initialRoute: uid == null ? WELCOME : HOME,
            routes: {
              SIGN_IN: (context) => SignUp(),
              LOGIN: (context) => Login(),
              HOME: (context) => InstaHome(
                  username: username,
                  bio: bio,
                  phno: phno,
                  defaultpage: 0,
                  uid: uid),
              PROFILE: (context) => ProfileScreen(
                    username: username,
                    bio: bio,
                    phno: phno,
                  ),
              DMPAGE: (context) => DM(),
              WELCOME: (context) => WelcomeScreen(),
            },
            builder: EasyLoading.init(),
          );
  }

  getdetails() async {
    sharedpref sf = new sharedpref();
    uid = await sf.getuid();
    if (uid != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .where('uid', isEqualTo: uid)
          .get()
          .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          bio = doc['bio'];
          phno = doc['phno'];
          username = doc['name'];
        });
      });
    }

    setState(() {
      isloading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getdetails();
  }
}
