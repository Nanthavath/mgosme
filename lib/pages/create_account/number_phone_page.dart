import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'adapter/user_adapter.dart';
import 'widgets/backToLoginButton.dart';
import 'widgets/button_next.dart';

class NumberPhonePage extends StatefulWidget {
  @override
  _NumberPhonePageState createState() => _NumberPhonePageState();
}

TextEditingController phoneController = TextEditingController();

class _NumberPhonePageState extends State<NumberPhonePage> {
  final _formKey = GlobalKey<FormState>();

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
                child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          left: 15, right: 15, bottom: 15, top: 50),
                      child: Column(
                        children: [
                          Text(
                            'ເບີໂທຂອງທ່ານ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Text('ກະລຸນາໃສ່ເບີໂທຂອງທ່ານທີໃຊ້ໃນປະຈຸບັນ'),
                          SizedBox(
                            height: 10,
                          ),
                          Form(
                            key: _formKey,
                            child: Row(
                              children: [
                                Text('+856'),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: TextFormField(
                                    controller: phoneController,
                                    decoration: InputDecoration(
                                        isDense: true,
                                        hintText: 'ເບີໂທຂອງທ່ານ',
                                        border: InputBorder.none,
                                        contentPadding:
                                            EdgeInsets.only(bottom: 1)),
                                    validator: (value) => value.isEmpty
                                        ? 'ກະລຸນາໃສ່ເບີໂທຂອງທ່ານ'
                                        : null,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          NextButton(
                            title: 'ຖັດໄປ',
                            onPress: () {
                              String uid;

                              if (_formKey.currentState.validate()) {
                                
                                print('+856${userModel.tel}');
                                // userModel.phoneAuth(context).then(
                                //       (value) {
                                //         print(value.uid);
                                //         userModel.uid=value.uid;
                                //       },

                                //     );
                              }
                            },
                          ),
                        ],
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

// TextFormField buildTextNumber() {
//   return TextFormField(
//     maxLength: 16,
//     onChanged: (value) {
//       setState(() {});
//     },
//     controller: _controller,
//     keyboardType: TextInputType.number,
//     decoration: InputDecoration(
//       labelText: 'ເບີໂທມືຖື',
//       suffixIcon: _controller.text == '' ||
//               _controller.text.isEmpty ||
//               _controller.text == null
//           ? null
//           : InkWell(
//               child: Icon(Icons.close),
//               onTap: () {
//                 setState(() {
//                   _controller.text = '';
//                 });
//               },
//             ),
//     ),
//   );
// }
}
