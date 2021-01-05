import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MyAddress {
  double lat;
  double lng;
  String province;
  String district;
  String village;
  String street;

  MyAddress({
    this.lat,
    this.lng,
    this.province,
    this.district,
    this.village,
    this.street,
  });

  Future<void>addAdr(String uid,Map<String,dynamic>map)async{
    CollectionReference address=FirebaseFirestore.instance.collection('address');
    await address.doc(uid).set(map);
  }

}
