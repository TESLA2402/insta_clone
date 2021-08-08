import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class FileUpload {
  var collectionRef = FirebaseFirestore.instance.collection('posts');
  var collectionRef2 = FirebaseFirestore.instance.collection('allposts');

  uploadwithcamera(
      /*String username, String profileURL, String name, String bio,
      String uid, var pickedFile*/
      ) {
    /*if (pickedFile != null) {
      var time = DateTime.now();
      String postid = '${name}_$time';
      File file = File(pickedFile.path);
      firebase_storage.Reference firebaseStorageRef = await firebase_storage
          .FirebaseStorage.instance
          .ref()
          .child('posts/$uid/$postid');
      var uploadTask = firebaseStorageRef.putFile(file);
      await uploadTask.whenComplete(() async {
        String photoURL = await firebase_storage.FirebaseStorage.instance
            .ref('posts/$uid/$postid')
            .getDownloadURL();
        Map<String, dynamic> postdata = {
          'who': username,
          'name': name,
          'caption': bio,
          'url': photoURL,
          'time': time,
          'who_url': profileURL,
        };
        await collectionRef
            .doc(uid)
            .collection('userposts')
            .doc(postid)
            .set(postdata);
        await collectionRef2.add(postdata);
      });
    }*/
  }

  uploadfromdevice(String username, String profileURL, String name, String bio,
      String uid, var pickedFile) async {
    if (pickedFile != null) {
      var time = DateTime.now();
      String postid = '${name}_$time';
      File file = File(pickedFile.path);
      firebase_storage.Reference firebaseStorageRef = await firebase_storage
          .FirebaseStorage.instance
          .ref()
          .child('posts/$uid/$postid');
      var uploadTask = firebaseStorageRef.putFile(file);
      await uploadTask.whenComplete(() async {
        String photoURL = await firebase_storage.FirebaseStorage.instance
            .ref('posts/$uid/$postid')
            .getDownloadURL();
        Map<String, dynamic> postdata = {
          'who': username,
          'name': name,
          'caption': bio,
          'url': photoURL,
          'time': time,
          'who_url': profileURL,
          'likedby': ['a'],
          'post_id': postid
        };
        await collectionRef
            .doc(uid)
            .collection('userposts')
            .doc(postid)
            .set(postdata);
        await collectionRef2.add(postdata);
      });
    }
  }
}
