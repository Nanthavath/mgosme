import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'get_name.dart';
import 'widgets/backToLoginButton.dart';

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Stack(
            children: [
              ListView(
                children: [
                  img(context),
                  SizedBox(
                    height: 20,
                  ),
                  introText(context),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 50,
                  child: BackToLogin(
                    onPress: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column introText(BuildContext context) {
    return Column(
      children: [
        Text(
          'ເຂົ້າຮ່ວມ ເອມໂກ',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          'ພວກເຮົາຈະຊ່ວຍທ່ານໃນການລົງທພບຽນໃໝ່ດ້ວຍຂັ້ນຕອນງ່າຍໆ',
          style: TextStyle(fontSize: 15),
        ),
        Text(
          'ພຽງແຕ່ທໍໃດວິນາທີ',
          style: TextStyle(fontSize: 15),
        ),
        SizedBox(
          height: 20,
        ),
        intoRegisterButton(context),
      ],
    );
  }

  Widget intoRegisterButton(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.2,
      height: 45,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        color: Colors.blueAccent,
        child: Text(
          'ຖັດໄປ',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => GetNamePage(),
          ));
        },
      ),
    );
  }

  Container img(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Image(
        image: AssetImage(
          'images/intro_banner.png',
        ),
        width: 200,
        height: MediaQuery.of(context).size.height / 2.8,
      ),
    );
  }
}
