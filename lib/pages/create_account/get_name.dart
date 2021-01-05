import 'package:flutter/material.dart';

import 'adapter/user_adapter.dart';
import 'get_gender_page.dart';
import 'widgets/button_next.dart';

// ignore: must_be_immutable
class GetNamePage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: BackButton(),
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              left: 15, right: 15, bottom: 15, top: 20),
                          child: Column(
                            children: [
                              Image(
                                image: AssetImage('images/account.png'),
                                width: 40,height: 40,
                              ),
                              Text(
                                'ໃສ່ຊື່ ແລະ ນາມສະກຸນຂອງທ່ານ',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: nameText(),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: surnameText(),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              NextButton(
                                title: 'ຖັດໄປ',
                                onPress: () {
                                  if (_formKey.currentState.validate()) {
                                    userModel.name = nameController.text;
                                    userModel.surname = nameController.text;
                                    print(userModel.name);
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => GetGenderPage(),
                                    ));
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  backToLogin(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget backToLogin(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: FlatButton(
        onPressed: () {
          Navigator.of(context)
              .maybePop()
              .then((value) => Navigator.of(context).pop());
        },
        child: Text(
          'ມີບັນຊີຜູ້ໃຊ້ແລ້ວ?',
          style: TextStyle(color: Colors.deepPurple, fontSize: 15),
        ),
      ),
    );
  }

  Widget nameText() => TextFormField(
        validator: (value) => value.isEmpty ? 'ກະລຸນາໃສ່ຊື່ຂອງທ່ານ' : null,
        controller: nameController,
        style: TextStyle(fontSize: 18),
        decoration: InputDecoration(
          labelText: 'ຊື່',
          isDense: true,
        ),
      );

  Widget surnameText() => TextFormField(
        validator: (value) => value.isEmpty ? 'ກະລຸນາໃສ່ນາມສະກຸນຂອງທ່ານ' : null,
        controller: surnameController,
        style: TextStyle(fontSize: 18),
        decoration: InputDecoration(
          labelText: 'ນາມສະກຸນ',
          isDense: true,
        ),
      );
}
