import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:instagram_clone/firebase/datacontroller.dart';
import 'package:instagram_clone/screen/profile/friendsprofile.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController usernameController = TextEditingController();
  late QuerySnapshot snapshotData;
  late bool isExecuted = false;
  @override
  Widget build(BuildContext context) {
    Widget searchedData() {
      return ListView.builder(
          itemCount: snapshotData.docs.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => FriendsProfile(
                            name: snapshotData.docs[index]['name']))));
              },
              leading: CircleAvatar(
                backgroundImage: NetworkImage(snapshotData.docs[index]['dp']),
              ),
              title: Text(snapshotData.docs[index]['name'],
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0)),
            );
          });
    }

    return Scaffold(
        appBar: AppBar(
            actions: [
              GetBuilder<DataController>(
                  init: DataController(),
                  builder: (val) {
                    return IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          val.queryData(usernameController.text).then((value) {
                            snapshotData = value;
                            setState(() {
                              isExecuted = true;
                            });
                          });
                        });
                  }),
            ],

            /*height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade300),*/
            title: TextField(
              decoration: InputDecoration(
                  hintText: 'Search',
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search,
                  )),
              controller: usernameController,
            )),
        body: isExecuted
            ? searchedData()
            : new StaggeredGridView.countBuilder(
                crossAxisCount: 4,
                shrinkWrap: true,
                itemCount: 40,
                itemBuilder: (BuildContext context, int index) => new Container(
                    color: Colors.blue,
                    child: new Center(
                      child: new CircleAvatar(
                        backgroundColor: Colors.white,
                        child: new Text('$index'),
                      ),
                    )),
                staggeredTileBuilder: (int index) =>
                    new StaggeredTile.count(2, index.isEven ? 2 : 1),
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
              ));
  }

  /*PreferredSizeWidget Appbar() {
    
    var size = MediaQuery.of(context).size;
    return PreferredSize(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 20.0,
          ),
          SafeArea(
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 10,
                ),
                Container(
                  actions: [
                    GetBuilder<DataController>(
                        init: DataController(),
                        builder: (val) {
                          return IconButton(
                              icon: Icon(Icons.search),
                              onPressed: () {
                                val
                                    .queryData(usernameController.text)
                                    .then((value) {
                                  snapshotData = value;
                                  setState(() {
                                    isExecuted = true;
                                  });
                                });
                              });
                        }),
                  ],
                  controller: usernameController,
                  width: size.width - 20,
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade300),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'Search',
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.search,
                        )),
                    cursorColor: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      preferredSize: new Size(size.width, 90),
    );
  }*/
}
