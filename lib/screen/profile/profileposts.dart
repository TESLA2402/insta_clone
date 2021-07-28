import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/lists/allposts.dart';

class ProfilePosts extends StatefulWidget {
  const ProfilePosts({Key? key}) : super(key: key);

  @override
  _ProfilePostsState createState() => _ProfilePostsState();
}

class _ProfilePostsState extends State<ProfilePosts> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (MediaQuery.of(context).size.height - 20) * (2 / 3),
      child: GridView.builder(
        controller: new ScrollController(keepScrollOffset: false),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        //itemCount: posts.length,
        itemBuilder: (BuildContext context, int index) => Container(
          decoration: new BoxDecoration(
              //image: new DecorationImage(
              //fit: BoxFit.fill, image: AssetImage(posts[index].what)),
              ),
        ),
      ),
    );
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
