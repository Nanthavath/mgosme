import 'package:flutter/material.dart';
import 'package:mgosme/pages/home/menu_popup.dart';
import 'package:mgosme/pages/home/screen/home_app/home/home.dart';
import 'package:mgosme/pages/home/screen/home_app/more_page/profiles/view/experiance.dart';
import 'package:mgosme/pages/home/screen/home_app/more_page/profiles/widgets/popup_menu.dart';
import 'package:mgosme/pages/home/screen/home_app/more_page/profiles/widgets/showdialog.dart';
import 'package:mgosme/pages/home/screen/home_app/more_page/profiles/widgets/stars_give.dart';
import 'package:mgosme/utilities/alert_dialog.dart';

class textcomment {
  textcomment();
  textcomments({
    BuildContext context,
  }) {
    return txtcommentss;
  }
}

class Reviewpage extends StatefulWidget {
  @override
  _ReviewpageState createState() => _ReviewpageState();
}

String txtcommentss;
double starrating;

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
    double countstars = 3.5;
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
                  '$countstars',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ShowalertStars().stars_const(
                        context: context,
                        size: 18,
                        readonly: true,
                        ratingstars: countstars),
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
          txtcommentss = value;
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
          if (txtcommentss == '' || txtcommentss == null) {
            CustomAlertDialogStars().alertDialog(
              context: context,
              title: 'ຜິດພາດ',
              icon: Icons.error_outline,
              message: 'ກະລຸນາຕື່ມຂໍ້ມູນ',
            );
          } else {
            ShowalertStars().showstars(context: context);
            //print('text = $txtcomment');
          }
        },
        child: Text(
          'ຕົກລົງ',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  usercomment() {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            textusercomment(
                image: 'icons/user.png',
                name: 'ຕົ້ນຕານ',
                time: '1 day ago',
                commenttext: 'ເຮັດດົນໂພດ ລາຄາກາແພງເກີນ ເຮັດບໍ່ດົນາເປ້ '),
            textusercomment(
                image: 'icons/user.png',
                name: 'ຈອນ',
                time: '2 days ago',
                commenttext: 'ເຮັດບໍ່ຖືກໃຈ'),
            textusercomment(
                image: 'icons/user.png',
                name: 'ບິບໄຫ່ຍ',
                time: '3 days ago',
                commenttext: 'ເຮັດຜິດຫັນ ແລ້ວກະດົນຫຼາຍ'),
          ],
        ),
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
                    ShowalertStars().stars_const(
                        context: context,
                        size: 18,
                        readonly: true,
                        ratingstars: 2),
                  ],
                ),
              ),
              Container(
                // color: Colors.blue,
                width: 185,
                margin: EdgeInsets.only(top: 30, left: 20, right: 10),
                child: Text(
                  commenttext,
                  style: TextStyle(fontSize: 12),
                ),
              ),
              menupopupbutton(),
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

  menupopupbutton() {
    return Container(
      margin: EdgeInsets.only(left: 180),
      child: Column(
        children: [
          PopupMenuButton(
            onSelected: choiceAction,
            child: Text('...'),
            itemBuilder: (BuildContext context) {
              return Constants_review.choices.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
    );
  }

  void choiceAction(String choice) {
    if (choice == Constants_review.update) {
      print('update');
    }
    if (choice == Constants_review.delete) {
      print('delete');
    }
  }
}
