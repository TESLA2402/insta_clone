import 'package:flutter/material.dart';
import 'package:instagram_clone/ringforstories/gradient_ring.dart';
import 'package:instagram_clone/lists/allstories.dart';

class InstaStories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
            child: new Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: new ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: stories.length,
                itemBuilder: (context, index) => new Stack(
                  children: <Widget>[
                    Column(children: [
                      WGradientRing(
                        width: index == 0 ? 0.0 : 2.0,
                        child: Container(
                          width: 60.0,
                          height: 60.0,
                          decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(stories[index].what)),
                          ),
                          margin: const EdgeInsets.symmetric(horizontal: 8.0),
                        ),
                      ),
                      SizedBox(
                        height: 3.0,
                      ),
                      if (stories[index].who.length > 6)
                        Text(
                          stories[index]
                              .who
                              .replaceRange(6, stories[index].who.length, '..'),
                          style: TextStyle(fontWeight: FontWeight.w400),
                        ),
                      if (stories[index].who.length <= 6)
                        Text(
                          stories[index].who,
                          style: TextStyle(fontWeight: FontWeight.w400),
                        ),
                    ]),
                    index == 0
                        ? Positioned(
                            right: 10.0,
                            top: 50.0,
                            child: InkWell(
                              child: new CircleAvatar(
                                backgroundColor: Colors.blueAccent,
                                radius: 10.0,
                                child: new Icon(
                                  Icons.add,
                                  size: 14.0,
                                  color: Colors.white,
                                ),
                              ),
                              onTap: () {},
                            ))
                        : new Container()
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
