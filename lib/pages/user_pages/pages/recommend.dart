import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Recommend extends StatefulWidget {
  final String uid;

  const Recommend({Key key, this.uid}) : super(key: key);

  @override
  _RecommendState createState() => _RecommendState(uid);
}

class _RecommendState extends State<Recommend> {
  final String userId;

  _RecommendState(this.userId);

  @override
  void initState() {
    getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users')
            .where('position', isEqualTo: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container();
          }

          return Container(
              margin: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: SingleChildScrollView(
                  child: Column(
                children: List.generate(snapshot.data.docs.length, (index) {
                  DocumentSnapshot snapData = snapshot.data.docs[index];
                  return Column(
                    children: [
                      InkWell(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildCircleAvatar(snapData),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: _buildListTile(snapData),
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                      Divider(),
                    ],
                  );
                }),
              )));
        });
  }

  _buildCircleAvatar(DocumentSnapshot snapData) {
    return Container(
      child: CircleAvatar(
        backgroundImage: snapData.data()['urlProfile'] != null
            ? NetworkImage(snapData.data()['urlProfile'])
            : AssetImage('images/mgo_logo.png'),
        radius: 30,
      ),
    );
  }

  _buildListTile(DocumentSnapshot snapData) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${snapData.data()['title']}',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        Text('${snapData.data()['full_name']}'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildIco(ico: Icons.favorite, text: '15'),
            _buildIco(
                ico: Icons.access_time,
                text: ' ${snapData.data()['currentJob']} ກຳລັງເຮັດຢູ່'),
            _buildRate(),
          ],
        ),
      ],
    );
  }

  _buildIco({IconData ico, String text}) {
    return Row(
      children: [
        Icon(
          ico,
          size: 15,
        ),
        Text(
          '$text',
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }

  _buildRate() {
    return Row(
      children: List.generate(5, (index) {
        return Icon(
          Icons.star,
          size: 15,
        );
      }),
    );
  }

  Future getUserData() async {
    return FirebaseFirestore.instance.collection('users').snapshots();
  }
}
