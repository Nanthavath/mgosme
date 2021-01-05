import 'package:flutter/material.dart';

import 'current_job.dart';
import 'finished_job.dart';
import 'my_post_job.dart';

class MyJob extends StatefulWidget {
  final String uid;

  const MyJob({Key key, this.uid}) : super(key: key);

  @override
  _MyJobState createState() => _MyJobState(uid);
}

class _MyJobState extends State<MyJob> {
  final String uid;

  _MyJobState(this.uid);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('ປະກາດຂອງຂ້ອຍ'),
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'ວຽກຂອງຂ້ອຍ',
              ),
              Tab(
                text: 'ກຳລັງເຮັດ',
              ),
              Tab(
                text: 'ສຳເລັດແລ້ວ',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            MyPostJob(),
            CurrentJob(
              uid: uid,
            ),
            FinishJob(),
          ],
        ),
      ),
    );
  }
}
