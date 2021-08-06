import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class FriendsProfile extends StatefulWidget {
  const FriendsProfile({required this.name});
  final String name;
  @override
  _FriendsProfileState createState() => _FriendsProfileState();
}

class _FriendsProfileState extends State<FriendsProfile> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
