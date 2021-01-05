import 'package:flutter/material.dart';
import 'adapter/user_adapter.dart';
import 'gender.dart';
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
                                width: 40,
                                height: 40,
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
                                    child: textInput(
                                      controller: nameController,
                                      label: 'ຊື່',
                                      validator: (value) => value.isEmpty
                                          ? 'ກະລຸນາໃສ່ຊື່ຂອງທ່ານ'
                                          : null,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: textInput(
                                      controller: surnameController,
                                      label: 'ນາມສະກຸນ',
                                      validator: (value) => value.isEmpty
                                          ? 'ກະລຸນາໃສ່ນາມສະກຸນ່ຂອງທ່ານ'
                                          : null,
                                    ),
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

  Widget textInput({
    TextEditingController controller,
    String label,
    FormFieldValidator<String> validator,
  }) {
    return TextFormField(
      style: TextStyle(fontSize: 18),
      controller: controller,
      decoration: InputDecoration(labelText: label, isDense: true),
      validator: validator,
    );
  }




}
