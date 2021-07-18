import 'package:flutter/material.dart';
import 'package:instagram_clone/screen/profile/profiledetail.dart';
import 'package:instagram_clone/screen/profile/profileposts.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: new Column(
          children: <Widget>[_appBar(), ProfileDetail(), ProfilePosts()],
        ),
      ),
    );
  }

  Widget _appBar() {
    return new Container(
      color: Colors.white,
      padding: new EdgeInsets.only(top: 25.0),
      child: new Column(
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Padding(
                padding: new EdgeInsets.only(left: 10.0),
                child: new Text(
                  "UserName",
                  style: new TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new IconButton(
                      icon: new Icon(Icons.update),
                      iconSize: 25.0,
                      onPressed: () {}),
                  new IconButton(
                      icon: new Icon(Icons.person_add),
                      iconSize: 25.0,
                      onPressed: () {}),
                  new IconButton(
                      icon: new Icon(Icons.format_list_bulleted),
                      iconSize: 25.0,
                      onPressed: () {}),
                ],
              )
            ],
          ),
          new Container(
            margin: new EdgeInsets.only(top: 2.0),
            height: 1.5,
            color: Colors.grey[300],
          ),
        ],
      ),
    );
  }
}
