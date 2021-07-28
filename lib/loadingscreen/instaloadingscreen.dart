import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/constants.dart';

class InstaLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double deviceheight = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.white,
      height: deviceheight,
      child: Center(
        child: CircularProgressIndicator(
          strokeWidth: 2.0,
          color: Colors.grey,
        ),
      ),
    );
  }
}
