import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mgosme/pages/home/screen/home_app/home.dart';
import 'package:mgosme/pages/user_pages/user_home_page.dart';

import 'screen/home_app/chats/chats.dart';
import 'screen/home_app/create_jobs/create.dart';
import 'screen/home_app/more_page/more.dart';
import 'screen/home_app/my_jobs/my_job.dart';

class HomePage extends StatefulWidget {
  final String uid;
   bool position;

  HomePage({this.uid, this.position});

  @override
  _HomePageState createState() => _HomePageState(uid: uid, position: position);
}

class _HomePageState extends State<HomePage> {
  final String uid;
  final bool position;

  _HomePageState({this.uid, this.position});

  int currentTab = 0;
  Widget swapped;
  List<Widget> screen;
  Widget currentScreen;

  ///Firebase
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  void initState() {
    setState(() {
      if (position == true) {
        swapped = Home(uid: uid);
      } else {
        swapped = UserHomePage(uid: uid);
      }

      currentScreen = swapped;
    });

    screen = [
      swapped,
      MyJob(uid: uid),
      Chats(),
      More(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
            stream: fireStore.collection('users').doc(uid).snapshots(),
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
              return PageStorage(
                child: currentScreen,
                bucket: bucket,
              );
            }),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => CreateJob(),
            ));
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 10,
          child: Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentTab = 0;
                          currentScreen = screen[currentTab];
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.home,
                            color: currentTab == 0 ? Colors.blue : Colors.grey,
                          ),
                          Text(
                            'ໜ້າຫຼັກ',
                            style: TextStyle(
                              color:
                                  currentTab == 0 ? Colors.blue : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentTab = 1;
                          currentScreen = screen[currentTab];
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.work,
                            color: currentTab == 1 ? Colors.blue : Colors.grey,
                          ),
                          Text(
                            'ວຽກຂອງຂ້ອຍ',
                            style: TextStyle(
                              color:
                                  currentTab == 1 ? Colors.blue : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentTab = 2;
                          currentScreen = screen[currentTab];
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.chat,
                            color: currentTab == 2 ? Colors.blue : Colors.grey,
                          ),
                          Text(
                            'ແຊັດ',
                            style: TextStyle(
                              color:
                                  currentTab == 2 ? Colors.blue : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentTab = 3;
                          currentScreen = screen[currentTab];
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.menu,
                            color: currentTab == 3 ? Colors.blue : Colors.grey,
                          ),
                          Text(
                            'ເພີ່ມເຕີມ',
                            style: TextStyle(
                              color:
                                  currentTab == 3 ? Colors.blue : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

// Future getUserInfo() async {
//   DocumentSnapshot snapshot =
//       await FirebaseFirestore.instance.collection('users').doc(uid).get();
//   return snapshot;
// }
}
