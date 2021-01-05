import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'pages/all_work.dart';
import 'pages/booking_list.dart';
import 'pages/finished_list.dart';
import 'pages/working_list.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

DateTime currentDate = DateTime.now();

class _HomeState extends State<Home> {
  TabController controller;
List<Widget>pages=[
  AllWork(),
  Booking(),
  Working(),
  Finished(),
];


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
                  Tab(text: 'ທັງໝົດ',),
                  Tab(text: 'ລາຍການຈອງ',),
                  Tab(text: 'ກຳລັງເຮັດຢູ່',),
                  Tab(text: 'ສຳເລັດແລ້ວ',),
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
}
