import 'package:flutter/material.dart';
import 'package:mgosme/pages/home/screen/home_app/more_page/profiles/view/about.dart';
import 'package:mgosme/pages/home/screen/home_app/more_page/profiles/view/experiance.dart';
import 'package:mgosme/pages/home/screen/home_app/more_page/profiles/view/finishedwork.dart';
import 'package:mgosme/pages/home/screen/home_app/more_page/profiles/view/review.dart';
import 'package:mgosme/pages/user_pages/pages/new_technician.dart';

import 'edit_profiles/info.dart';
import 'widgets/back_button.dart';

class Profiles extends StatefulWidget {
  @override
  _ProfilesState createState() => _ProfilesState();
}

class _ProfilesState extends State<Profiles> {
  TabController controller;
  List<Widget> pages = [
    aboutpage(),
    experiancepage(),
    finishedword(),
    reviewpage(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: pages.length,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 300,
              stretch: true,
              floating: true,
              pinned: true,
              snap: false,
              // leading: _backButton(),
              // actions: [
              //   _editButton(),
              // ],
              flexibleSpace: FlexibleSpaceBar(
                stretchModes: [
                  // StretchMode.zoomBackground,
                  StretchMode.blurBackground,
                  StretchMode.fadeTitle,
                ],
                background: Container(
                  color: Colors.white,
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Expanded(
                            child: Container(
                              color: Colors.blue,
                              child: _cover(),
                            ),
                          ),
                          Expanded(
                            child: Container(),
                          ),
                        ],
                      ),
                      _profileAvatar(),
                      BackButtons(),
                      _editButton(),
                    ],
                  ),
                ),
              ),
              bottom: TabBar(
                indicatorColor: Colors.blue,
                labelColor: Colors.black,
                tabs: [
                  Tab(
                    text: 'ກ່ຽວກັບ',
                  ),
                  Tab(
                    text: 'ປະສົບການ',
                  ),
                  Tab(
                    text: 'ວຽກທີ່ສຳເລັດແລ້ວ',
                  ),
                  Tab(
                    text: 'ລີວີວ',
                  ),
                ],
              ),
            ),
            SliverFillRemaining(
              child: TabBarView(
                controller: controller,
                children: [
                  aboutpage(),
                  experiancepage(),
                  finishedword(),
                  reviewpage(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  // _backButton() {
  //   return SafeArea(
  //     child: InkWell(
  //       child: Container(
  //         margin: EdgeInsets.only(left: 10),
  //         width: 40,
  //         height: 40,
  //         decoration: BoxDecoration(
  //           shape: BoxShape.circle,
  //           border: Border.all(color: Colors.white),
  //         ),
  //         child: Icon(
  //           Icons.arrow_back,
  //           color: Colors.white,
  //         ),
  //       ),
  //       onTap: () {
  //         print('Back button');
  //       },
  //     ),
  //   );
  // }

  _editButton() {
    return SafeArea(
      child: Align(
        alignment: Alignment.topRight,
        child: Container(
          margin: EdgeInsets.only(right: 10),
          child: IconButton(
            icon: Icon(
              Icons.edit,
              color: Colors.white,
              size: 35,
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Info(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  _profileAvatar() {
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2)),
            child: CircleAvatar(
              radius: 60,
              backgroundColor: Colors.transparent,
              backgroundImage: NetworkImage(
                'https://www.sleekcover.com/covers/girl-watching-sunset-facebook-cover.jpg',
              ),
            ),
          ),
          Text('Nanthavath Vongsouna',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
        ],
      ),
    );
  }

  _cover() {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                'https://images.pexels.com/photos/1323206/pexels-photo-1323206.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
              ),
              fit: BoxFit.cover)),
    );
  }
}
