import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram_clone/lists/allposts.dart';
import 'instastory.dart';
import 'package:instagram_clone/loadingscreen/instaloadingscreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class InstaList extends StatefulWidget {
  InstaList({required this.uid});

  final String uid;
  @override
  _InstaListState createState() => _InstaListState();
}

class _InstaListState extends State<InstaList> {
  bool isPressed = false;
  bool loading = true;
  FirebaseAuth auth = FirebaseAuth.instance;
  List<allposts> posts = [];
  var child = new AssetImage("rick.jpg");
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return StreamBuilder<QuerySnapshot>(
        stream: collectionRef.orderBy('time', descending: true).snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return InstaLoading();
          }
          if (snapshot.connectionState == ConnectionState.active) {
            var postdata = snapshot.data!.docs;
            return ListView.builder(
              itemCount: snapshot.data!.docs.length + 1,
              itemBuilder: (context, index) => index == 0
                  ? new SizedBox(
                      child: new InstaStories(),
                      height: 120,
                    )
                  : snapshot.data!.docs.length == 0
                      ? Center(child: Text("No posts yet"))
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Divider(),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  16.0, 0.0, 8.0, 8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      new Container(
                                        height: 40.0,
                                        width: 40.0,
                                        decoration: new BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: new DecorationImage(
                                              fit: BoxFit.fill,
                                              image: AssetImage(
                                                  'assets/posts/rick.jpg')),
                                        ),
                                      ),
                                      new SizedBox(
                                        width: 10.0,
                                      ),
                                      Text(
                                        postdata[index - 1]['who'] != null
                                            ? postdata[index - 1]['who']
                                            : '',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w800),
                                      )
                                    ],
                                  ),
                                  new IconButton(
                                    icon: Icon(Icons.more_vert),
                                    onPressed: null,
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: deviceSize.width,
                              width: deviceSize.width,
                              decoration: new BoxDecoration(
                                image: new DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(
                                        postdata[index - 1]['url'])),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  new Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      new IconButton(
                                        icon: new Icon(postdata[index - 1]
                                                    ['likedby']
                                                .contains(widget.uid)
                                            ? Icons.favorite
                                            : FontAwesomeIcons.heart),
                                        color: postdata[index - 1]['likedby']
                                                .contains(widget.uid)
                                            ? Colors.red
                                            : Colors.black,
                                        iconSize: postdata[index - 1]['likedby']
                                                .contains(widget.uid)
                                            ? 30
                                            : 25,
                                        onPressed: () {
                                          setState(() {
                                            isPressed = !isPressed;
                                            if (isPressed)
                                              updatelike(
                                                  postdata[index - 1].id,
                                                  postdata[index - 1]
                                                      ['likedby']);
                                            else
                                              unupdatelike(
                                                  postdata[index - 1].id,
                                                  postdata[index - 1]
                                                      ['likedby']);
                                          });
                                        },
                                      ),
                                      new SizedBox(
                                        width: 16.0,
                                      ),
                                      new Icon(
                                        FontAwesomeIcons.comment,
                                      ),
                                      new SizedBox(
                                        width: 16.0,
                                      ),
                                      new Icon(FontAwesomeIcons.paperPlane),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text(
                                "${postdata[index - 1]['likedby'].length} likes",
                                style: TextStyle(fontWeight: FontWeight.w400),
                              ),
                            ),
                            SizedBox(
                              height: 3.0,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text(
                                postdata[index - 1]['caption'],
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                            ),
                            SizedBox(
                              height: 6.0,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: GestureDetector(
                                  onTap: () {},
                                  child: Text("View all comments",
                                      style: TextStyle(color: Colors.grey))),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  16.0, 6.0, 0.0, 8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  new Container(
                                    height: 30.0,
                                    width: 30.0,
                                    decoration: new BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: new DecorationImage(
                                        fit: BoxFit.fill,
                                        image: new NetworkImage(
                                            postdata[index - 1]['url']),
                                      ),
                                    ),
                                  ),
                                  new SizedBox(
                                    width: 10.0,
                                  ),
                                  Expanded(
                                    child: new TextField(
                                      decoration: new InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Add a comment...",
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text(postdata[index - 1]['who'],
                                  style: TextStyle(color: Colors.grey)),
                            ),
                            SizedBox(
                              height: 10.0,
                            )
                          ],
                        ),
            );
          } else {
            return InstaLoading();
          }
        });
  }

  /*@override
  void initState() {
    getallposts(widget.uid);
  }

  var collectionRef = FirebaseFirestore.instance.collection('allposts');

  getallposts(String uid) async {
    print('getallposts done');
    posts.clear();
    await collectionRef.get().then(
          (querysnapshot) => querysnapshot.docs.forEach((doc) {
            posts.insert(
              posts.length,
              allposts(
                  who: doc.data()['who'],
                  when: ('ddd'),
                  what: doc.data()['url'],
                  caption: doc.data()['caption'],
                  likedby: ['a', 'b', 'c', 'd', 'e', 'f', 'g'],
                  url: doc.data()['url']),
            );
            posts = List.from(posts.reversed);
          }),
        );
    setState(() {
      loading = false;
    });
  }*/

  /*Future<void> _pullRefresh() async {
    return Future.delayed(Duration(seconds: 2), () {
      setState(() {
        getallposts(widget.uid);
      });
    });
  }*/
  @override
  void initState() {}

  updatelike(String id, List likedby) {
    if (!likedby.contains(widget.uid)) {
      likedby.add(widget.uid);
      collectionRef.doc(id).update({'likedby': likedby});
    }
  }

  unupdatelike(String id, List likedby) {
    likedby.remove(widget.uid);
    collectionRef.doc(id).update({'likedby': likedby});
  }

  var collectionRef = FirebaseFirestore.instance.collection('allposts');

  var last;
}
