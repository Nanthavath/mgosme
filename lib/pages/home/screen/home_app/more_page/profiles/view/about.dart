import 'package:flutter/material.dart';
import 'package:mgosme/utilities/styles.dart';

class aboutpage extends StatefulWidget {
  @override
  _aboutpageState createState() => _aboutpageState();
}

class _aboutpageState extends State<aboutpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _abouttext(
              text: 'ຊື່ : ຕົ້ນຕານ ແກ້ວມະນີວົງ',
              top: 10,
              iconData: Icons.account_circle),
          _abouttext(text: 'ເພດ : ຊາຍ', iconData: Icons.wc),
          _abouttext(text: '28/12/1998', iconData: Icons.calendar_today),
          _abouttext(text: 'ທີ່ຢູ : ດົງໂດກ', iconData: Icons.person_pin_circle),
          _abouttext(text: '020 59633390', iconData: Icons.phone),
          _abouttext(text: 'tonkmnv@gmail.com', iconData: Icons.mail_rounded),
        ],
      ),
    );
  }

  _abouttext({String text, final double top, IconData iconData}) {
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
                    Icon(iconData, color: Colors.black54, size: 28),
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
