import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mgosme/pages/home/widgets/button_crus.dart';
import 'package:mgosme/utilities/alert_dialog.dart';

import 'edit_job.dart';
class MyPostJob extends StatefulWidget {
  final String uid;

  const MyPostJob({Key key, this.uid}) : super(key: key);
  @override
  _MyPostJobState createState() => _MyPostJobState(uid);
}

class _MyPostJobState extends State<MyPostJob> {
  final String uid;

  _MyPostJobState(this.uid);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('posts')
              .where('userID', isEqualTo: uid).where('status',isEqualTo: 'empty')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container();
            }
            return Container(
              margin: EdgeInsets.only(top: 10, left: 10, right: 5),
              child: ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot snap = snapshot.data.docs[index];
                  return Card(
                    child: Container(
                      margin: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildHeader(index, snap),
                          Divider(
                            thickness: 1,
                          ),
                          buildBottom(snap),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }),
    );
  }

  Widget buildHeader(int index, DocumentSnapshot snapshot) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'ລະຫັດ: ${snapshot.data()['id']}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              '${snapshot.data()['cost']} K',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.lightBlue),
            ),
          ],
        ),
        Text('ວັນທີ: ${snapshot.data()['date']}'),
        Text('ຮັບວຽກແລ້ວ: 1'),
      ],
    );
  }

  Widget buildBottom(DocumentSnapshot snapshot) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('ປະເພດວຽກ: ${snapshot.data()['jobType']}'),
            Container(
              padding: EdgeInsets.only(right: 15, left: 15),
              decoration: BoxDecoration(
                color: Colors.yellow,
                //border: Border.all(),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: snapshot.data()['status'] == 'empty'
                    ? Text('ເປີດ')
                    : Text('ປິດ'),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            CircleAvatar(
              maxRadius: 40,
              minRadius: 40,
              backgroundImage: snapshot.data()['img'] == null
                  ? AssetImage('images/mgo_logo.png')
                  : NetworkImage(snapshot.data()['img']),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('ຫົວຂໍ້ວຽກ: ${snapshot.data()['title']}'),
                Text('ລາຍລະອຽດ: ${snapshot.data()['detail']}'),
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: Colors.red,
                      size: 15,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'ບ້ານດົງໂດກ',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        buildButton(snapshot),
      ],
    );
  }

  Widget buildButton(DocumentSnapshot snapshot) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ButtonCRUS(
          colorBackgroundIcon: Colors.green,
          icon: Icons.edit,
          text: 'ແກ້ໄຂ',
          colorIcon: Colors.yellow,
          onPress: () {
            _buildModalBottomSheet(context,snapshot.id);
          },
        ),
        ButtonCRUS(
          colorBackgroundIcon: Colors.white,
          icon: Icons.close,
          text: 'ຍົກເລີກ',
          colorIcon: Colors.red,
          onPress: () {
            CustomAlertDialog().optionDialog(
                context, 'ທາງເລືອກ', 'ທ້ານຕ້ອງການທີ່ຈະຍົກເລີກບໍ່?', () {
              Navigator.of(context).maybePop().then((value) {
                return CustomAlertDialog().loadingDialog(context).then(
                      (value) => canCelOption(snapshot),
                );
              });
            });
          },
        ),
        ButtonCRUS(
          colorBackgroundIcon: Colors.green,
          icon: Icons.done,
          text: 'ສຳເລັດ',
          colorIcon: Colors.white,
          onPress: () {},
        ),
      ],
    );
  }

  ///Edit
  Future _buildModalBottomSheet(BuildContext context,String postId) {
    return showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      context: context,
      builder: (context) {
        return Container(
          child: Column(
            children: [
              Icon(Icons.minimize),
              EditJob(postId: postId,),
            ],
          ),
        );
      },
    );
  }

  ///Cancel
  Future canCelOption(DocumentSnapshot snapshot) async {
    try {
      return await FirebaseFirestore.instance
          .collection('posts')
          .doc(snapshot.id)
          .delete();
    } catch (ex) {
      return ex.toString();
    }
  }
}
