import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_clone/sharedpref/sharedpref.dart';

//import 'package:firebase_storage/firebase_storage.dart';
class Auth {
  CollectionReference users = FirebaseFirestore.instance.collection("users");
  sharedpref sf = new sharedpref();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<String> signUp(String username, String email, String password) async {
    try {
      bool usernameexist = await usernameExist(username);
      if (usernameexist) {
        return 'Username already exist';
      } else {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        Map<String, dynamic> mapuser = {
          'name': username,
          'email': userCredential.user!.email.toString(),
          'bio': 'IITG 24',
          'phno': '',
          'dp': 'assets/posts/unknown.jpg',
          'uid': userCredential.user!.uid,
          'searchname': setSearchParam(username),
          'followers': '0',
          'following': '0',
        };
        await userCredential.user!.updateDisplayName(username);
        await userCredential.user!.updatePhotoURL('rick.jpg');
        await users
            .doc(userCredential.user!.uid.toString())
            .set(mapuser)
            .then((value) => print("User added"))
            .catchError((error) => print("Failed to adduser: $error"));
        await sf.saveuid(userCredential.user!.uid);
        return ('Signup successful');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return ('Weak password');
      } else if (e.code == 'email-already-in-use') {
        return ('Email already in use');
      } else {
        return ('Error $e');
      }
    } catch (e) {
      print(e);
      return ('Error $e');
    }
  }

  Future<List<DocumentSnapshot>> fetchStats(
      {required String uid, required String label}) async {
    QuerySnapshot querySnapshot =
        await _firestore.collection("users").doc(uid).collection(label).get();
    return querySnapshot.docs;
  }

  Future<bool> usernameExist(String username) async {
    bool check = false;
    await users.where("name", isEqualTo: username).get().then((snapshot) {
      if (snapshot.docs.length > 0) {
        check = true;
      } else {
        check = false;
      }
    });
    return check;
  }

  List setSearchParam(String searchedtext) {
    List<String> caseSearchList = <String>[];
    String temp = "";
    for (int i = 0; i < searchedtext.length; i++) {
      temp = temp + searchedtext[i];
      caseSearchList.add(temp);
    }
    return caseSearchList;
  }

  Future<String> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      await sf.saveuid(userCredential.user!.uid);
      return ('Logged in successfully');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return ('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        return ('Wrong password provided for that user.');
      } else {
        return ('Error $e');
      }
    } catch (e) {
      print(e);
      return (e.toString());
    }
  }

  Future<String> updateemail(String prevemail, String prevpassword,
      String newemail, String uid) async {
    try {
      bool check = await emailExist(newemail);
      if (check)
        return ('Email already in use');
      else {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: prevemail, password: prevpassword)
            .then((userCredential) async {
          print("now updating mail");
          await userCredential.user!.updateEmail(newemail);
          FirebaseFirestore.instance
              .collection('users')
              .doc(uid)
              .update({'email': newemail});
        });
        return "Updated successfully";
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return ('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        return ('Wrong password provided for that user.');
      } else if (e.code == 'email-already-in-use') {
        return ('Email already in use');
      } else {
        return ('Error $e');
      }
    } catch (e) {
      print(e);
      return (e.toString());
    }
  }

  Future<bool> emailExist(String newemail) async {
    bool check = false;
    await users.where("email", isEqualTo: newemail).get().then((snapshot) {
      if (snapshot.docs.length > 0) {
        check = true;
      } else {
        check = false;
      }
    });
    return check;
  }
}
