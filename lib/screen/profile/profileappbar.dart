import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/constants.dart';

import 'package:shared_preferences/shared_preferences.dart';

class ProfileAppBar extends StatefulWidget {
  const ProfileAppBar({Key? key, required this.username}) : super(key: key);
  final String username;

  @override
  _ProfileAppBarState createState() => _ProfileAppBarState();
}

class _ProfileAppBarState extends State<ProfileAppBar> {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return new SafeArea(
      child: new Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
        ),
        child: new Column(
          children: <Widget>[
            new Row(
              children: <Widget>[
                new Spacer(),
                new IconButton(
                  icon: new Icon(Icons.lock),
                  onPressed: () {},
                ),
                new Text(
                  widget.username,
                  style: new TextStyle(fontWeight: FontWeight.bold),
                ),
                new IconButton(
                  icon: new Icon(Icons.arrow_drop_down),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              leading: new Icon(Icons.logout),
                              title: new Text('Log Out'),
                              onTap: () {
                                showAlertDialog(BuildContext context) {
                                  Widget cancelButton = ElevatedButton(
                                    child: Text("Back"),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  );
                                  Widget continueButton = ElevatedButton(
                                    child: Text("Log Out"),
                                    onPressed: () async {
                                      SharedPreferences preferences =
                                          await SharedPreferences.getInstance();
                                      await preferences.clear();
                                      await auth.signOut();
                                      Navigator.pushNamed(context, WELCOME);
                                    },
                                  );
                                  AlertDialog alert = AlertDialog(
                                    title: Text("Are you sure"),
                                    content: Text("Would you like to log out?"),
                                    actions: [
                                      cancelButton,
                                      continueButton,
                                    ],
                                  );
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return alert;
                                    },
                                  );
                                }

                                ;

                                return showAlertDialog(context);
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
                new Spacer()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
