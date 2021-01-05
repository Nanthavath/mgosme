import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mgosme/pages/home/home_page.dart';

import 'login_page.dart';

// ignore: must_be_immutable
class SwitchPage extends StatelessWidget {
  var currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    if (currentUser != null) {
      return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(currentUser.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container();
          }

          return HomePage(
            uid: currentUser.uid,
            position: snapshot.data['position'],
          );
        },
      );
    } else {
      return LoginPage();
    }
  }

// Future<void> readAllData() async {
//   FirebaseFirestore fireStore = FirebaseFirestore.instance;
//   var referance = fireStore.collection('users').doc();
//   await referance.snapshots().listen((response) {});
// }
}
