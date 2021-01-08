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
          Container(
            child: Column(
              children: [
                Column(
                  children: [
                    _abouttext('ຈົບຊັ້ນສູ່ງ ຊ່າງການໄຟຟ້າ', 10),
                    _abouttext('ຈົບໄອທີ ລະບົບ ໄອໄອທີ Smart Home', 1),
                    _abouttext('ຜູ້ຄຸ່ມງ່ານລະບົບໄຟຟ້າໂຮງແຮມ mgo', 1),
                    _abouttextmgo('ຮ່ວມວຽກກັບເອມໂກ : ', 10, 'ກັນຍາ 2020'),
                    _abouttextscore('ຄະແນນລີວີວ : ', 1, '4,5'),
                    _linecross(),
                    // _workstatus(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _abouttext(String text, final double top) {
    return Container(
      margin: EdgeInsets.only(
        top: top,
        left: 30,
      ),
      child: Row(
        children: [
          Container(
            child: Icon(
              Icons.work,
              color: Colors.black54,
              size: 30,
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
                // Text(
                //   textdate,
                //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                // ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _linecross() {
    return Container(
      margin: EdgeInsets.only(left: 30, right: 30, top: 10),
      color: Colors.grey,
      height: 1,
    );
  }

  _abouttextmgo(String text, final double top, String textdate) {
    return Container(
      margin: EdgeInsets.only(
        top: top,
        left: 30,
      ),
      child: Row(
        children: [
          Container(
            child: Icon(
              Icons.timer,
              color: Colors.black54,
              size: 30,
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
                Text(
                  textdate,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _abouttextscore(String text, final double top, String textdate) {
    return Container(
      margin: EdgeInsets.only(
        top: top,
        left: 30,
      ),
      child: Row(
        children: [
          Container(
            child: Icon(
              Icons.favorite,
              color: Colors.black54,
              size: 30,
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
                Text(
                  textdate,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 5, left: 10),
                  child: Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow[800]),
                      Icon(Icons.star, color: Colors.yellow[800]),
                      Icon(Icons.star, color: Colors.yellow[800]),
                      Icon(Icons.star, color: Colors.yellow[800]),
                      Icon(Icons.star, color: Colors.yellow[800]),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  _workstatus() {
    return Container(
      child: Text(
        'ວຽກສຳເລັດ',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
