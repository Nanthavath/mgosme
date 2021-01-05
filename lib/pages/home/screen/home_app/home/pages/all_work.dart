import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AllWork extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('posts').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Something want wrong'),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Text('Loading...'),
            );
          }
          if (snapshot.data.docs.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('ບໍ່ມີຂໍ້ມູນ'),
                ],
              ),
            );
          }

          return Container(
              margin: EdgeInsets.only(
                top: 20,
                left: 10,
                right: 10,
              ),
              child: ListView(
                shrinkWrap: true,
                children: [
                  Container(
                    child: Column(
                      children:
                          List.generate(snapshot.data.docs.length, (index) {
                        DocumentSnapshot snapPost = snapshot.data.docs[index];
                        return Card(
                          child: Container(
                            margin: EdgeInsets.all(10),
                            child: Column(
                              children: [
                                buildHeader(index, snapPost),
                                Divider(
                                  thickness: 1,
                                ),
                                buildBottom(snapPost),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ));
        });
  }

  Widget buildBottom(DocumentSnapshot snapPost) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('ປະເພດວຽກ: ${snapPost.data()['jobType']}'),
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
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('ຫົວຂໍ້ວຽກ: ${snapPost.data()['title']}'),
                Text('ລາຍລະອຽດ: ${snapPost.data()['detail']}'),
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: Colors.red,
                    ),
                    Text('ບ້ານດົງໂດກ'),
                  ],
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Center(
          child: MaterialButton(
            color: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              'ສົນໃຈວຽກນີ້',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  Widget buildHeader(int index, DocumentSnapshot snapPost) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'ລະຫັດ: ${index.toString()}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'K ${snapPost.data()['cost']}',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.lightBlue),
            ),
          ],
        ),
        Text('ວັນທີ: ${snapPost.data()['date']}| 12:00'),

      ],
    );
  }
}
