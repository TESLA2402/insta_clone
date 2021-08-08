import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/lists/allstories.dart';
import 'package:instagram_clone/ringforstories/gradient_ring.dart';
import 'package:instagram_clone/screen/profile/editprofile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_clone/constants/constants.dart';

class ProfileDetail extends StatefulWidget {
  const ProfileDetail(
      {Key? key, required this.username, required this.bio, required this.phno})
      : super(key: key);
  final String username, bio, phno;
  @override
  _ProfileDetailState createState() => _ProfileDetailState();
}

class _ProfileDetailState extends State<ProfileDetail> {
  double? _height, _width;
  FirebaseAuth auth = FirebaseAuth.instance;
  late String? _photoURL;
  late final String uid;
  late final User user;

  @override
  void initState() {
    super.initState();
    user = auth.currentUser!;
    uid = user.uid;
    _photoURL = auth.currentUser!.photoURL;
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return Container(
        height: (MediaQuery.of(context).size.height - 20) * (1 / 3),
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              WGradientRing(
                width: 0.0,
                child: Container(
                  width: 60.0,
                  height: 60.0,
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                        fit: BoxFit.fill, image: AssetImage(stories[0].what)),
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                ),
              ),
              Column(children: [Text("0"), Text('Posts')]),
              Column(children: [Text("120"), Text('Followers')]),
              Column(children: [Text("5"), Text('Following')])
            ]),
            SizedBox(
              height: 20.0,
            ),
            Text(
              widget.username,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(widget.bio),
            SizedBox(
              height: 20.0,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.height,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => EditProfileScreen(
                            username: widget.username,
                            email: user.email!,
                            uid: uid,
                            bio: widget.bio,
                            phno: widget.phno),
                      ),
                    ).whenComplete(() {
                      setState(() {
                        Navigator.pushReplacementNamed(context, HOME);
                      });
                    });
                  },
                  child: Text(
                    "Edit Your Profile",
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              side: BorderSide(color: Color(0xffCBCBCB)))))),
            ),
          ],
        ));
  }
}
