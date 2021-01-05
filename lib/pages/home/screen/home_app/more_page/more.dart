import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mgosme/authen_service/firebase_auth.dart';
import 'package:mgosme/models/user_model.dart';

import 'account.dart';
import 'profiles.dart';

class More extends StatefulWidget {
  @override
  _MoreState createState() => _MoreState();
}

class _MoreState extends State<More> {
  List<UserModel> users = List();
  User user = FirebaseAuth.instance.currentUser;
  String uid;
  AuthService service = AuthService();

  @override
  void initState() {
    service.getUser().then((value) {
      setState(() {
        uid = value.uid;
        print('user=======$uid');
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        shadowColor: Colors.grey,
        title: Text(
          'ເພີ່ມເຕີມ',
          style: TextStyle(color: Colors.blue),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(top: 8, bottom: 8, right: 10),
            width: 80,
            child: InkWell(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 5,
                child: Center(
                  child: Text(
                    'Upgrade',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
              onTap: () {},
            ),
          ),
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Something went wrong'),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Text('Loading'),
            );
          }
          Map<String, dynamic> data = snapshot.data.data();
          return Container(
            margin: EdgeInsets.only(top: 10, left: 5, right: 5),
            child: Column(children: [
              ListTile(
                leading: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, border: Border.all()),
                  child: data['urlProfile'] == null
                      ? Image.asset('images/mgo.png', width: 40, height: 40)
                      : Image.network(data['urlProfile'],
                          width: 40, height: 40),
                ),
                title: Text('${data['name']} ${data['surname']} '),
                //trailing: Icon(Icons.arrow_forward_ios_sharp),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Profile(
                      userID: user.uid,
                    ),
                  ));
                },
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                thickness: 1,
              ),
              ListTile(
                dense: true,
                leading: Icon(
                  Icons.account_circle,
                ),
                title: Text('ຕັ້ງຄ້າບັນຊີ'),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AccountPage(),
                  ));
                },
              ),
              ListTile(
                dense: true,
                leading: Icon(
                  Icons.settings,
                  color: Colors.blue,
                ),
                title: Text('ການຕັ້ງຄ່າ'),
                onTap: () {},
              ),
              ListTile(
                dense: true,
                leading: Icon(
                  Icons.info,
                  color: Colors.green,
                ),
                title: Text('ຂໍ້ມູນແອັບ'),
                onTap: () {},
              ),
              ListTile(
                dense: true,
                leading: Icon(
                  Icons.power_settings_new,
                  color: Colors.red,
                ),
                title: Text('ອອກຈາກລະບົບ'),
                onTap: () {
                  service.signOut().then((value) {
                    // Navigator.of(context).pushAndRemoveUntil(
                    //     MaterialPageRoute(
                    //       builder: (context) => Swapped(),
                    //     ),
                    //     (route) => false);
                  });
                },
              ),
            ]),
          );
        },
      ),
    );
  }
}
