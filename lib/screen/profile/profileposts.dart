import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/lists/allposts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfilePosts extends StatefulWidget {
  ProfilePosts({required this.uid});
  final String uid;
  @override
  _ProfilePostsState createState() => _ProfilePostsState();
}

class _ProfilePostsState extends State<ProfilePosts> {
  List<allposts> posts = [];
  bool loading = true;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (MediaQuery.of(context).size.height - 20) * (2 / 3),
      child: GridView.builder(
        controller: new ScrollController(keepScrollOffset: false),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: posts.length,
        itemBuilder: (BuildContext context, int index) => Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
                fit: BoxFit.fill, image: NetworkImage(posts[index].url)),
          ),
        ),
      ),
    );
  }

  @override
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
  }
}

class GridLayout {
  final String title;
  final IconData icon;

  GridLayout({required this.title, required this.icon});
}

class GridOptions extends StatelessWidget {
  final GridLayout layout;

  GridOptions({required this.layout});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              layout.icon,
              size: 40,
            ),
            Text(
              layout.title,
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
