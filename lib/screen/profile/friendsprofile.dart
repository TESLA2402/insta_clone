import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_clone/firebase/auth.dart';
//import 'package:instagram_clone/firebase/repository.dart';
import 'package:instagram_clone/ringforstories/gradient_ring.dart';

class FriendsProfile extends StatefulWidget {
  const FriendsProfile({required this.name});
  final String name;
  @override
  _FriendsProfileState createState() => _FriendsProfileState();
}

class _FriendsProfileState extends State<FriendsProfile> {
  late String currentUserId, followingUserId;

  bool isFollowing = false;
  bool followButtonClicked = false;
  int postCount = 0;
  int followersCount = 0;
  int followingCount = 0;

  followUser() {
    print('following user');

    setState(() {
      isFollowing = true;
      followButtonClicked = true;
    });
  }

  unfollowUser() {
    setState(() {
      isFollowing = false;
      followButtonClicked = true;
    });
  }

  Widget buildButton(
      {String? text,
      Color? backgroundcolor,
      Color? textColor,
      Color? borderColor,
      Function? function}) {
    return GestureDetector(
      onTap: function!(),
      child: Container(
        width: 210.0,
        height: 30.0,
        decoration: BoxDecoration(
            color: backgroundcolor,
            borderRadius: BorderRadius.circular(4.0),
            border: Border.all(color: borderColor!)),
        child: Center(
          child: Text(text!, style: TextStyle(color: textColor)),
        ),
      ),
    );
  }

  Widget buildProfileButton() {
    // already following user - should show unfollow button
    if (isFollowing) {
      return buildButton(
        text: "Unfollow",
        backgroundcolor: Colors.white,
        textColor: Colors.black,
        borderColor: Colors.grey,
        function: unfollowUser,
      );
    }

    // does not follow user - should show follow button
    if (!isFollowing) {
      return buildButton(
        text: "Follow",
        backgroundcolor: Colors.blue,
        textColor: Colors.white,
        borderColor: Colors.blue,
        function: followUser,
      );
    }

    return buildButton(
        text: "loading...",
        backgroundcolor: Colors.white,
        textColor: Colors.black,
        borderColor: Colors.grey);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: new Color(0xfff8faf8),
              elevation: 1,
              leading: Icon(Icons.arrow_back),
              title: Text(
                widget.name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            body: Container(
              height: (MediaQuery.of(context).size.height - 20) * (1 / 3),
              margin: EdgeInsets.all(10),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          WGradientRing(
                            width: 0.0,
                            child: Container(
                              width: 60.0,
                              height: 60.0,
                              decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                image: new DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage('assets/posts/rick.jpg')),
                              ),
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                            ),
                          ),
                          Column(children: [Text("16"), Text('Posts')]),
                          Column(children: [Text("100"), Text('Followers')]),
                          Column(children: [Text("5"), Text('Following')])
                        ]),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      widget.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('IITG 24'),
                    SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(
                      child: buildProfileButton(),
                      /*child: ElevatedButton(onPressed: (){
                      }, 
                      child: Text('Follow',
                      style: TextStyle(color: Colors.white)
                      ),
                      
                      style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              side: BorderSide(color: Color(0xffCBCBCB)))))),*/
                    )
                  ]),
            )));
  }

  /*Widget detailsWidget(String count, String label) {
    return Column(
      children: <Widget>[
        Text(count,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                color: Colors.black)),
        Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child:
              Text(label, style: TextStyle(fontSize: 16.0, color: Colors.grey)),
        )
      ],
    );
  }*/
}
