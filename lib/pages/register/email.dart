import 'package:flutter/material.dart';

import 'adapter/user_adapter.dart';
import 'password_page.dart';
import 'widgets/backToLoginButton.dart';
import 'widgets/button_next.dart';

// ignore: must_be_immutable
class EmailPage extends StatelessWidget {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
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
                child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          left: 15, right: 15, bottom: 15, top: 20),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Image(
                              image: AssetImage(
                                'images/mail_fill.png',
                              ),
                              width: 40,
                              height: 40,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'ໃສ່ອີເມລຂອງທ່ານ',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              controller: emailController,
                              decoration: InputDecoration(
                                // labelText: 'ອີເມລ',
                                hintText: 'name@example.com',
                              ),
                              validator: (value) => value.isEmpty
                                  ? 'ກະລຸນາໃສ່ລະຫັດຜ່ານໃຫ້ຖືກກຕ້ອງ'
                                  : null,
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            NextButton(
                              title: 'ຖັດໄປ',
                              onPress: () {
                                if (_formKey.currentState.validate()) {
                                  userModel.email = emailController.text;
                                  print(userModel.email);
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => PasswordPage(),
                                    ),
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              BackToLogin(
                onPress: () {
                  Navigator.of(context).maybePop().then(
                        (value) => Navigator.of(context).maybePop().then(
                              (value) => Navigator.of(context)
                                  .maybePop()
                                  .then((value) =>
                                      Navigator.of(context).maybePop())
                                  .then((value) =>
                                      Navigator.of(context).maybePop())
                                  .then(
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
}
