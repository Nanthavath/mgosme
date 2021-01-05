import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'adapter/user_adapter.dart';
import 'birth_day_page.dart';
import 'widgets/backToLoginButton.dart';
import 'widgets/button_next.dart';
import 'widgets/gender_selected.dart';

class GetGenderPage extends StatefulWidget {
  @override
  _GetGenderPageState createState() => _GetGenderPageState();
}

class _GetGenderPageState extends State<GetGenderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [

              Container(
                child: SingleChildScrollView(
                  child:  Container(
                      margin:
                      EdgeInsets.only(left: 15, right: 15, bottom: 15, top: 20),
                      child: Column(
                        children: [
                          Image(
                            image: AssetImage(
                              'images/gender.png',
                            ),
                            width: 40,
                          ),
                          Text(
                            'ກະລຸນາເລືອກເພດ',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text('ທ່ານສາມາດປ່ຽນສະຖານະເພດໃນໜ້າຂໍ້ມູນສ່ວນໂຕຂອງທ່ານ'),
                          GenderSelected(),
                          SizedBox(
                            height: 50,
                          ),
                          NextButton(
                            title: 'ຖັດໄປ',
                            onPress: () {
                              if (userModel.sex == null) {
                                _showDialog();
                              } else {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => BirthDayPage(),
                                  ),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),

                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: BackButton(),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: BackToLogin(
                  onPress: () {
                    Navigator.of(context).maybePop().then(
                          (value) => Navigator.of(context).maybePop().then(
                                (value) => Navigator.of(context).maybePop(),
                              ),
                        );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(
            children: [
              Icon(
                Icons.add_alert,
                color: Colors.red,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'ຜິດພາດ',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          content: Container(
            height: 80,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('ກະລຸນາເລືອກເພດກ່ອນ!!'),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                MaterialButton(
                  color: Colors.blue,
                  child: Text(
                    'ຕົກລົງ',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
