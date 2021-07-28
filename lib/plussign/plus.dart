import 'package:flutter/material.dart';

class Plus extends StatefulWidget {
  const Plus({Key? key}) : super(key: key);

  @override
  _PlusState createState() => _PlusState();
}

class _PlusState extends State<Plus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
          ElevatedButton(
            onPressed: () {},
            child: Text(
              'Upload from Camera',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.only(left: 100, right: 100),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                primary: Colors.blue),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              'Upload from gallery',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.only(left: 100, right: 100),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                primary: Colors.blue),
          )
        ])));
  }
}
