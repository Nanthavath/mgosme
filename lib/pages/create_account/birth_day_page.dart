import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'adapter/user_adapter.dart';
import 'get_email_page.dart';
import 'widgets/backToLoginButton.dart';
import 'widgets/button_next.dart';


class BirthDayPage extends StatefulWidget {
  @override
  _BirthDayPageState createState() => _BirthDayPageState();
}

class _BirthDayPageState extends State<BirthDayPage> {
  DateTime _dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: BackButton(),
              ),
              Expanded(
                child: Container(
                  margin:
                      EdgeInsets.only(left: 15, right: 15, bottom: 15, top: 50),
                  child: Column(
                    children: [
                      Text(
                        'ວັນ, ເດືອນ, ປີເກີດເທົ່າໃດ?',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 70,
                      ),
                      buildDatePicker(),
                      SizedBox(
                        height: 50,
                      ),
                      NextButton(
                        title: 'ຖັດໄປ',
                        onPress: () {
                          print(userModel.birthday);
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => EmailPage(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              BackToLogin(
                onPress: () {
                  Navigator.of(context).maybePop().then(
                        (value) => Navigator.of(context).maybePop().then(
                              (value) => Navigator.of(context).maybePop().then(
                                    (value) => Navigator.of(context).pop(),
                                  ),
                            ),
                      );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox buildDatePicker() {
    return SizedBox(
      height: 100,
      child: CupertinoDatePicker(
        mode: CupertinoDatePickerMode.date,
        initialDateTime: _dateTime,
        onDateTimeChanged: (dateTime) {
          setState(() {
            _dateTime = dateTime;
            userModel.birthday =
                '${_dateTime.day}/${_dateTime.month}/${_dateTime.year}';
          });
        },
      ),
    );
  }
}
