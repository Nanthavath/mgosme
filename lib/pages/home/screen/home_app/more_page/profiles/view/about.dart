import 'package:flutter/material.dart';
import 'package:mgosme/utilities/styles.dart';

class Aboutpage extends StatefulWidget {
  @override
  _AboutpageState createState() => _AboutpageState();
}

class _AboutpageState extends State<Aboutpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  _abouttext(
                      text: 'ຊື່ : ຕົ້ນຕານ ແກ້ວມະນີວົງ ແກ້ວມະນີວົງ ແກ້ວມະນີວົງ',
                      top: 10,
                      ico: 'icons/user.png'),
                  _abouttext(text: 'ເພດ : ຊາຍ', ico: 'icons/gender.png'),
                  _abouttext(text: '28/12/1998', ico: 'icons/calendar.png'),
                  _abouttext(text: 'ທີ່ຢູ : ດົງໂດກ', ico: 'icons/address.png'),
                  _abouttext(text: '020 59633390', ico: 'icons/phone.png'),
                  _abouttext(text: 'tonkmnv@gmail.com', ico: 'icons/email.png'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _abouttext({String text, final double top, String ico}) {
    if (text.length > 40) {
      text = text.substring(0, 40);
      text = '$text ...';
    }
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 9),
                child: Column(
                  children: [
                    Image.asset(
                      ico,
                      height: 30,
                      width: 30,
                    )
                    //')
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10, bottom: 5),
                width: 310,
                child: Row(
                  children: [
                    Text(
                      text,
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
