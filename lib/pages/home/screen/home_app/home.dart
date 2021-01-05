import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'home/pages/all_work.dart';
import 'home/pages/booking_list.dart';
import 'home/pages/finished_list.dart';
import 'home/pages/working_list.dart';

class Home extends StatefulWidget {
  final String uid;
  const Home({Key key, this.uid}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

DateTime currentDate = DateTime.now();

class _HomeState extends State<Home> {
  TabController controller;
  List<Widget> pages = [
    AllWork(),
    Booking(),
    Working(),
    Finished(),
  ];

  @override
  void initState() {
    getUserInfo();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: pages.length,
      child: Scaffold(
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              expandedHeight: 300,
              stretch: true,
              title: Text('ສະບາຍດີ: Mr.Mgo'),
              actions: [
                IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
              ],
              floating: true,
              pinned: true,
              snap: false,
              flexibleSpace: FlexibleSpaceBar(
                stretchModes: [
                  StretchMode.zoomBackground,
                  StretchMode.blurBackground,
                  StretchMode.fadeTitle,
                ],
                background: Container(
                  margin: EdgeInsets.only(
                    left: 10,
                    right: 10,
                    top: 70,
                    bottom: 100,
                  ),
                  height: 200,
                  color: Colors.blue,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Image.asset('images/banner1.png'),
                  ),
                ),
              ),
              bottom: TabBar(
                indicatorColor: Colors.white,
                labelColor: Colors.white,
                tabs: [
                  Tab(
                    text: 'ທັງໝົດ',
                  ),
                  Tab(
                    text: 'ລາຍການຈອງ',
                  ),
                  Tab(
                    text: 'ກຳລັງເຮັດຢູ່',
                  ),
                  Tab(
                    text: 'ສຳເລັດແລ້ວ',
                  ),
                ],
              ),
            ),
            SliverFillRemaining(
              child: TabBarView(
                controller: controller,
                children: [
                  AllWork(),
                  Booking(),
                  Working(),
                  Finished(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future getUserInfo()async {}
}
