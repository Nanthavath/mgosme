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
                    height: 10,
                  ),
                  _abouttext(
                      text: 'ຊື່ : ຕົ້ນຕານ ແກ້ວມະນີວົງ',
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
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          child: Row(
            children: [
              Container(
                height: 25,
                width: 25,
                margin: EdgeInsets.only(bottom: 9),
                child: Column(
                  children: [
                    // Icon(iconData, color: Colors.black54, size: 28),
                    Image.asset(
                      ico,
                    )
                    //')
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Text(
                      text,
                      style: TextStyle(fontSize: 16),
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
