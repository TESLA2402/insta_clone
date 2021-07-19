import 'package:flutter/material.dart';
import 'package:instagram_clone/screen/chat/chatDM.dart';
import 'package:instagram_clone/screen/mainpage/instabody.dart';
import 'package:instagram_clone/screen/profile/profilescreen.dart';
import 'package:instagram_clone/screen/search/search.dart';

class InstaHome extends StatefulWidget {
  const InstaHome({Key? key}) : super(key: key);

  @override
  _InstaHomeState createState() => _InstaHomeState();
}

class _InstaHomeState extends State<InstaHome> {
  var active = "Home";
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          backgroundColor: new Color(0xfff8faf8),
          centerTitle: true,
          elevation: 1.0,
          leading: new Icon(
            Icons.camera_alt_outlined,
            color: Colors.black,
          ),
          title: SizedBox(
              height: 35.0, child: Image.asset("assets/instagram_logo.png")),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: new IconButton(
                icon: active == 'Send'
                    ? Icon(
                        Icons.send,
                        color: Colors.black,
                        size: 30,
                      )
                    : Icon(
                        Icons.send_outlined,
                        size: 30,
                      ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DM()),
                  );
                  setState(() {
                    active = 'Send';
                  });
                },
              ),
            )
          ],
        ),
        body: new InstaBody(),
        bottomNavigationBar: new Container(
          color: Colors.white,
          height: 50.0,
          alignment: Alignment.center,
          child: new BottomAppBar(
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new IconButton(
                  icon: active == 'Home'
                      ? Icon(
                          Icons.home,
                          size: 30,
                        )
                      : Icon(
                          Icons.home_outlined,
                          size: 30,
                        ),
                  onPressed: () {
                    setState(() {
                      active = 'Home';
                    });
                  },
                ),
                new IconButton(
                    icon: active == 'Search'
                        ? Icon(
                            Icons.search,
                            size: 32,
                          )
                        : Icon(
                            Icons.search_outlined,
                            size: 30,
                          ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Search()),
                      );
                      setState(() {
                        active = 'Search';
                      });
                    }),
                new IconButton(
                    icon: active == 'Add'
                        ? Icon(
                            Icons.add_box,
                            size: 30,
                          )
                        : Icon(
                            Icons.add_box_outlined,
                            size: 30,
                          ),
                    onPressed: () {
                      setState(() {
                        active = 'Add';
                      });
                    }),
                new IconButton(
                    icon: active == 'Love'
                        ? Icon(
                            Icons.favorite,
                            size: 30,
                          )
                        : Icon(
                            Icons.favorite_outline,
                            size: 30,
                          ),
                    onPressed: () {
                      setState(() {
                        active = 'Love';
                      });
                    }),
                new InkWell(
                    child: Container(
                      width: 30.0,
                      height: 30.0,
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/posts/rick.jpg')),
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileScreen()),
                      );
                    }),
              ],
            ),
          ),
        ));
  }
}
