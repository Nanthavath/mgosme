import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mgosme/pages/home/home_page.dart';

import 'widgets/button_next.dart';

class SummaryPage extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        return Scaffold(
          body: SafeArea(
            child: Container(
              child: Column(
                children: [
                  Container(
                    child: Image.asset('images/banner1.png'),
                  ),
                  Text(
                    'ລົງທະບຽນສຳເລັດ!',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('ເອມໂກ ຍິນດີຕ້ອນຮັບ'),
                  SizedBox(
                    height: 30,
                  ),
                  NextButton(
                    title: 'ເຂົ້າສ່ລະບົບ',
                    onPress: () {
                      // userModel.addUser().then((value) {
                      //
                      // });
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                          (route) => false);
                    },
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
