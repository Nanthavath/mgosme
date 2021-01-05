import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'pages/nearly.dart';
import 'pages/new_technician.dart';
import 'pages/recommend.dart';
import 'widgets/banner_slider.dart';

class UserHomePage extends StatefulWidget {
  final String uid;

  const UserHomePage({Key key, this.uid}) : super(key: key);

  @override
  _UserHomePageState createState() => _UserHomePageState(uid);
}

class _UserHomePageState extends State<UserHomePage> {
  final String uid;
  TabController tabController;
  List<Widget> pages = [
    Recommend(),
    NewTech(),
    Nearly(),
  ];
  ScrollController _scrollController = ScrollController();
  List<String> techType = [];
  List<String> url = [];

  _UserHomePageState(this.uid);
  String username;

  @override
  void initState() {
    setState(() {
      getTechType();
      getUserInfo().then((value) {
        username=value.data()['full_name'];
      });
    });
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
              backgroundColor: Colors.white,
              expandedHeight: MediaQuery.of(context).size.height / 1.6,
              floating: true,
              pinned: true,
              snap: false,
              title: Text(
                'ສະບາຍດີ: $username',
                style: TextStyle(fontSize: 16),
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: InkWell(
                    child: Icon(Icons.language),
                    onTap: () {},
                  ),
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 50),
                      margin: EdgeInsets.only(bottom: 8),
                      height: 200,
                      color: Colors.blue,
                      child: BannerSlider(),
                    ),
                    _buildInputSearch(),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                      child: Text(
                        'ໝວດໝູ່ຊ່າງ',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15, left: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: _buildCategoryJob(),
                          ),
                          InkWell(
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                            ),
                            onTap: () {
                              _scrollController.animateTo(
                                  _scrollController.offset + 100,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.linear);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              bottom: TabBar(
                labelColor: Colors.black,
                tabs: [
                  Tab(
                    text: 'ຊ່າງແນະນຳ',
                  ),
                  Tab(
                    text: 'ຊ່າງໃຫມ່',
                  ),
                  Tab(
                    text: 'ຊ່າງໃກ້ທ່ານ',
                  ),
                ],
              ),
            ),
            SliverFillRemaining(
              child: TabBarView(
                controller: tabController,
                children: pages,
              ),
            ),
          ],
        ),
      ),
    );
  }

  ///Search Text
  Widget _buildInputSearch() {
    final sizeIcon = BoxConstraints(minWidth: 40, minHeight: 40);
    final border = OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.transparent,
        width: 0,
      ),
      borderRadius: const BorderRadius.all(const Radius.circular(8)),
    );
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Card(
        elevation: 5,
        child: TextField(
          style: TextStyle(fontSize: 16),
          decoration: InputDecoration(
              hintText: 'ຄົ້ນຫາ',
              hintStyle: TextStyle(fontSize: 16),
              isDense: true,
              prefixIcon: Icon(Icons.search),
              prefixIconConstraints: sizeIcon,
              filled: true,
              fillColor: Colors.white,
              enabledBorder: border,
              focusedBorder: border,
              contentPadding: EdgeInsets.all(4)),
        ),
      ),
    );
  }

  ///Category ListView slide
  _buildCategoryJob() {
    return Container(
      height: 65,
      margin: EdgeInsets.only(left: 10, right: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: techType.length,
        controller: _scrollController,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.only(right: 20),
            child: InkWell(
              child: Column(
                children: [
                  Image.network(
                    url[index],
                    height: 40,
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(techType[index]),
                ],
              ),
              onTap: () {},
            ),
          );
        },
      ),
    );
  }

  ///Get Technician From FireStore
  Future getTechType() async {
    await FirebaseFirestore.instance
        .collection('technicianCategory')
        .get()
        .then(
      (QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach(
          (doc) {
            techType.add(doc['name']);
            url.add(doc['img']);
          },
        );
        setState(() {});
      },
    );
  }

  Future<DocumentSnapshot> getUserInfo() async {
    DocumentSnapshot snapshot =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    return snapshot;
  }
}
