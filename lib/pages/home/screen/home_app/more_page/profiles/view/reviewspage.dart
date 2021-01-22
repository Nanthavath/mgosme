import 'package:flutter/material.dart';
import 'package:mgosme/pages/home/screen/home_app/more_page/profiles/widgets/popup_menu.dart';
import 'package:mgosme/pages/home/screen/home_app/more_page/profiles/widgets/showdialog.dart';
import 'package:mgosme/pages/home/screen/home_app/more_page/profiles/widgets/stars_give.dart';

class textcommentt {
  textcommentt();
  textcomments({BuildContext context}) {
    return txtcommentss;
  }
}

class Review_pages extends StatefulWidget {
  @override
  _Review_pagesState createState() => _Review_pagesState();
}

String txtcommentss;
double starrating;

class _Review_pagesState extends State<Review_pages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  children: [
                    Row(
                      children: [
                        staraverage(),
                        constrating(),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              line(),
              boxcomment(),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  children: [
                    Row(
                      children: [
                        usercomment(),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  staraverage() {
    double countstars = 3.5;
    return Container(
      // height: 110,
      // width: 120,
      //margin: EdgeInsets.only(left: 20),
      child: Column(
        children: [
          // SizedBox(height: 10),
          Text('ຄ່າສະເລຍ'),
          Text(
            '$countstars',
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ShowalertStars().stars_const(
                  context: context,
                  size: 19,
                  readonly: true,
                  ratingstars: countstars),
            ],
          )
        ],
      ),
    );
  }

  constrating() {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(left: 20),
          // height: 110,
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
    );
  }

  _textquarlity({String textquarlitu, double top}) {
    return Container(
      margin: EdgeInsets.only(top: top, left: 200),
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
        margin: EdgeInsets.only(left: 30, right: 30, bottom: 8),
        color: Colors.grey,
        height: 1);
  }

  boxcomment() {
    return Stack(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
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
      margin: EdgeInsets.only(left: 30),
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
      width: 80,
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

  usercomment() {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            textusercomment(
                image: 'icons/user.png',
                name: 'ຕົ້ນຕານຕົ້ນຕານ',
                time: '1 day ago',
                commenttext:
                    'ເຮັດດົນໂພດ ລາຄາກາແພງເກີນ  ເຮັດບໍ່ດົນກາເປ້ເຮັດບໍ່ດົນາເປ້ ເຮັດບໍ່ດົນກາເປ້ເຮັດບໍ່ດົນາເປ້ ເຮັດບໍ່ດົນກາເປ້ເຮັດບໍ່ດົນາເປ້ ເຮັດບໍ່ດົນກາເປ້ເຮັດບໍ່ດົນາເປ້ ເຮັດບໍ່ດົນກາເປ້ເຮັດບໍ່ດົນາເປ້ ເຮັດບໍ່ດົນກາເປ້ເຮັດບໍ່ດົນາເປ້'),
            textusercomment(
                image: 'icons/user.png',
                name: 'ຈອນ',
                time: '2 days ago',
                commenttext: 'ເຮັດບໍ່ຖືກໃຈ'),
            textusercomment(
                image: 'icons/user.png',
                name: 'tontan',
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
    if (name.length > 7) {
      name = name.substring(0, 07);
      name = '$name..';
    }
    if (commenttext.length > 150) {
      commenttext = commenttext.substring(0, 150);
      commenttext = '$commenttext...';
    }
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
            alignment: Alignment.topRight,
            children: [
              Container(
                margin: EdgeInsets.only(top: 10, right: 160),
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
                width: 240,
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

  menupopupbutton() {
    return Container(
      //  margin: EdgeInsets.only(left: 220),
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
      ShowalertStars().showbottomsheetwidget(context: context);
    }
    if (choice == Constants_review.delete) {
      print('delete');
    }
  }
}
