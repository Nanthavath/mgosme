import 'package:flutter/material.dart';
import 'package:mgosme/authen_service/firebase_auth.dart';
import 'package:mgosme/pages/register/widgets/circle_progress_dialog.dart';

import 'adapter/user_adapter.dart';
import 'summary_page.dart';
import 'widgets/backToLoginButton.dart';
import 'widgets/button_next.dart';


// ignore: must_be_immutable
class PasswordPage extends StatefulWidget {
  @override
  _PasswordPageState createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  TextEditingController controller = TextEditingController();

  AuthService service = AuthService();

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      body: SafeArea(
        child: loading==false? Container(
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
                                'images/lock.png',
                              ),
                              width: 40,
                              height: 40,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'ເລືອກລະຫັດຜ່ານ',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                                'ກະລຸນາເກັບຮັບສາລະຫັດຜ່ານເປັນຄວາມລັບສຳລັບທ່ານ'),
                            TextFormField(
                              obscureText: true,
                              controller: controller,
                              decoration: InputDecoration(
                                labelText: 'ລະຫັດຜ່ານ',
                              ),
                              validator: (value) =>
                                  (value.isEmpty || value.length < 6)
                                      ? 'ກະລຸນາໃສ່ລະຫັດຜ່ານໃຫ້ຖືກກຕ້ອງ'
                                      : null,
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            NextButton(
                              title: 'ສົງທະບຽນ',
                              onPress: () {
                                setState(() {
                                  loading=true;
                                });
                                if (_formKey.currentState.validate()) {
                                  print('Email: ${userModel.email}');
                                  print('Email: ${controller.text}');

                                  service
                                      .createAccountWithEmail(
                                          userModel.email, controller.text)
                                      .then(
                                    (value) {

                                      print('Success');
                                      print(value.email);
                                      userModel.uid = value.uid;
                                      currentUser = value;
                                      if (userModel.uid != null) {
                                        insertDataToFireStore(context);
                                      }
                                    },
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
        ):Center(
          child: Column(
            children: [
              CircularProgressIndicator(),
              Text('ກຳລັງໂຫຼດ...'),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> insertDataToFireStore(BuildContext context) async {
    userModel.addUser().then((value) {
      print('Added');
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => SummaryPage(),
      ));
    }).catchError((error) => print('Failed: $error'));
  }
}
