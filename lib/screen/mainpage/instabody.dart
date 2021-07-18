import 'package:flutter/material.dart';
import 'instalist.dart';

class InstaBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[Flexible(child: InstaList())],
    );
  }
}
