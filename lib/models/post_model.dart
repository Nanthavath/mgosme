import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class PostModel {
  String jobType;
  String title;
  String cost;
  String date;
  String img;
  String userID;
  String detail;
  double lat;
  double lng;
  String village;
  String district;
  String province;


  PostModel({
    this.jobType,
    this.title,
    this.cost,
    this.date,
    this.img,
    this.userID,
    this.detail,

  });

  CollectionReference post = FirebaseFirestore.instance.collection('posts');

  Future<void> postJob() async {
    await post.doc().set({
      'userID': userID,
      'jobType': jobType,
      'title': title,
      'cost': cost,
      'date': date,
      'detail': detail,
      'img': img,
      'address':{
        'lat':lat,
        'lng':lng,
        'province':province,
        'district':district,
        'village':village,
      }

    });
  }

  Future<User> getCurrentUser() async {
    return FirebaseAuth.instance.currentUser;
  }

  Future<String> addImageToFireStore(File file) async {
    Random random = Random();
    int i = random.nextInt(999999999);
    Reference reference = FirebaseStorage.instance
        .ref()
        .child('images/post/${FirebaseAuth.instance.currentUser.uid}/post$i');
    UploadTask uploadTask = reference.putFile(file);
    await uploadTask.whenComplete(
      () async {
        print('Upload complete');
        img = await uploadTask.snapshot.ref.getDownloadURL();
        print(img);
      },
    );
    return img;
  }
}
