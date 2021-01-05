import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String uid;
  String name;
  String surname;
  String sex;
  String birthday;
  String tel;
  String email;
  String urlProfile;
  String status;
  String occupation;
  String accountNo;
  String qrcode;
  String title;
  bool position;

  UserModel({
    this.uid,
    this.name,
    this.surname,
    this.sex,
    this.birthday,
    this.tel,
    this.email,
    this.urlProfile,
    this.accountNo,
    this.occupation,
    this.qrcode,
    this.status,
    this.title,
    this.position = false,
  });

  Future<void> addUser() async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return users.doc(uid).set({
      'name':name,
      'surname':surname,
      'sex': sex,
      'birthday': birthday,
      'tel': tel,
      'email': email,
      'urlProfile': urlProfile,
      'status': status,
      'occupation': occupation,
      'accountNo': accountNo,
      'qrcode': qrcode,
      'title': title,
      'position': position,
    });
  }

  UserModel.fromMap(Map<String, dynamic> map) {
    name=map['name'];
    surname=map['surname'];
    sex = map['sex'];
    birthday = map['birthday'];
    tel = map['tel'];
    email = map['email'];
    urlProfile = map['urlProfile'];
    status = map['status'];
    occupation = map['occupation'];
    accountNo = map['accountNo'];
    qrcode = map['qrcode'];
    title = map['title'];
    position = map['position'];
  }
}
