import 'package:flutter/material.dart';

class Reviewpage extends StatefulWidget {
  @override
  _ReviewpageState createState() => _ReviewpageState();
}

String txtcomment;

class _ReviewpageState extends State<Reviewpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              staraverage(),
              line(),
              boxcomment(),
              usercomment(),
            ],
          ),
        ),
      ),
    );
  }

  staraverage() {
    return Align(
      child: Row(
        children: [
          // big stars
          Container(
            height: 120,
            width: 120,
            child: Column(
              children: [
                Text('ຄ່າສະເລຍ'),
                Text(
                  '2,5',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    iconstar(),
                  ],
                )
              ],
            ),
          ),
          // small stars
          Expanded(
            child: Stack(
              children: [
                Container(
                  height: 120,
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      _widgetlinescore(widget: 150),
                      _widgetlinescore(widget: 120),
                      _widgetlinescore(widget: 80),
                      _widgetlinescore(widget: 50),
                      _widgetlinescore(widget: 20),
                    ],
                  ),
                ),
                _textquarlity(textquarlitu: 'ດີຫຼາຍ', top: 7),
                _textquarlity(textquarlitu: 'ດີ', top: 25),
                _textquarlity(textquarlitu: 'ປານກາງ', top: 42),
                _textquarlity(textquarlitu: 'ອ່ອນ', top: 58),
                _textquarlity(textquarlitu: 'ອ່ອນຫຼາຍ', top: 75),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _textquarlity({String textquarlitu, double top}) {
    return Container(
      margin: EdgeInsets.only(left: 160, top: top),
      child: Text(textquarlitu),
    );
  }

  _widgetlinescore({double widget}) {
    return Container(
      padding: EdgeInsets.only(top: 5, right: 10),
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                child: Column(
                  children: [
                    Container(
                      width: 150.0,
                      height: 12.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(19.0),
                        color: const Color(0xffebe9e9),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      width: widget,
                      height: 12.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(19.0),
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  iconstar() {
    return Container(
      child: Row(
        children: [
          Icon(Icons.star, size: 18, color: Colors.yellow),
          Icon(Icons.star, size: 18, color: Colors.yellow),
          Icon(Icons.star_half, size: 18, color: Colors.yellow),
          Icon(Icons.star_border, size: 18, color: Colors.yellow),
          Icon(Icons.star_border, size: 18, color: Colors.yellow),
        ],
      ),
    );
  }

  line() {
    return Container(
        margin: EdgeInsets.only(left: 20, right: 20, bottom: 5),
        color: Colors.grey,
        height: 1);
  }

  boxcomment() {
    return Stack(
      children: [
        Row(
          children: [
            _textcomment(),
            _buttoncomment(),
          ],
        ),
        _textreview(),
      ],
    );
  }

  _textcomment() {
    return Container(
      height: 50,
      width: 200,
      margin: EdgeInsets.only(left: 40),
      child: TextField(
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.only(top: 2, bottom: 2, left: 20, right: 20),
          isDense: true,
          hintText: 'ຄຳເຫັນ',
          hintStyle: TextStyle(fontSize: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(40),
            ),
          ),
        ),
        onChanged: (String value) {
          txtcomment = value;
        },
      ),
    );
  }

  _buttoncomment() {
    return Container(
      height: 30,
      width: 64,
      margin: EdgeInsets.only(left: 10, bottom: 20),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(
          Radius.circular(40),
        ),
      ),
      child: FlatButton(
        onPressed: () {
          print('comment = $txtcomment');
        },
        child: Text(
          'ຕົກລົງ',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  usercomment() {
    return SingleChildScrollView(
      child: Column(
        children: [
          textusercomment(
              image: 'icons/user.png',
              name: 'ຕົ້ນຕານ',
              time: 'one day ago',
              commenttext: 'ການບໍ່ລິການໄດ້ດີຫຼາຍ ແຕ່ເຮັດດົນ'),
          textusercomment(
              image: 'icons/user.png',
              name: 'ຈອນ',
              time: 'two days ago',
              commenttext: 'ເຮັດດົນຫຼາຍ'),
          textusercomment(
              image: 'icons/user.png',
              name: 'ບິບໄຫ່ຍ',
              time: 'three days ago',
              commenttext: 'ເຮັດຜິດຫັນ ແລ້ວກະດົນຫຼາຍ'),
        ],
      ),
    );
  }

  textusercomment({
    String image,
    String name,
    String time,
    String commenttext,
  }) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        children: [
          Container(
            height: 55,
            width: 55,
            child: Image.asset(image),
          ),
          Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 5),
                child: Text(
                  name,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: Text(
                  time,
                  style: TextStyle(fontSize: 10),
                ),
              ),
            ],
          ),
          Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10, left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    iconstar(),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30, left: 20),
                child: Row(
                  children: <Widget>[
                    Text(
                      commenttext,
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _textreview() {
    return Container(
      margin: EdgeInsets.only(top: 30, left: 30),
      child: Text(
        'ລີວິວ ',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}
