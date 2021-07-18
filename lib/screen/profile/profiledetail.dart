import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/lists/allstories.dart';
import 'package:instagram_clone/ringforstories/gradient_ring.dart';

class ProfileDetail extends StatefulWidget {
  const ProfileDetail({Key? key}) : super(key: key);

  @override
  _ProfileDetailState createState() => _ProfileDetailState();
}

class _ProfileDetailState extends State<ProfileDetail> {
  @override
  Widget build(BuildContext context) {
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
              Column(children: [Text("16"), Text('Posts')]),
              Column(children: [Text("1M"), Text('Followers')]),
              Column(children: [Text("5"), Text('Following')])
            ]),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Lakshay",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text("IITG'24"),
            SizedBox(
              height: 20.0,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.height,
              child: ElevatedButton(
                  onPressed: () {},
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
