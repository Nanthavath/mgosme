import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mgosme/authen_service/firebase_auth.dart';
import 'package:mgosme/pages/create_account/intro_page.dart';
import 'package:mgosme/pages/create_account/widgets/alert_dialog.dart';
import 'package:mgosme/pages/create_account/widgets/image_slider.dart';
import 'package:mgosme/pages/logins/switch_page.dart';



class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

///FirebaseAuth
AuthService _service = AuthService();


TextEditingController emailController=TextEditingController();
TextEditingController passwordController=TextEditingController();

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(
          top: 15,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFE3ECFE),
              Color(0xFFFDFEFE),
            ],
          ),
        ),
        child: ListView(
          children: [
            Center(
              child: Image.asset(
                'images/mgo_logo.png',
                width: 250,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            ImageSlider(),
            SizedBox(
              height: 10,
            ),
            emailText(),
            passwordText(),
            loginButton(),
            signInOption(),
            SizedBox(
              height: 10,
            ),
            createAccountButton(),
          ],
        ),
      ),
    );
  }

  Widget createAccountButton() {
    return FlatButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => IntroPage(),
        ));
      },
      child: Text(
        'ສະໝັກສະມາຊິກໃໝ່',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget signInOption() {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              'images/icons_facbook.png',
            ),
          ),
          onTap: () {
            print('Facebook');
          },
        ),
        SizedBox(
          width: 40,
        ),
        InkWell(
          child: Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              'images/icons_google.png',
              width: 45,
              height: 45,
            ),
          ),
          onTap: () {
            _service.signInWithGoogle().then((value) {
              print(value.user..uid);
              // Navigator.of(context).pushAndRemoveUntil(
              //     MaterialPageRoute(
              //       builder: (context) => Swapped(),
              //     ),
              //     (route) => false);
            });
          },
        ),
      ],
    ));
  }

  ///Login Button
  Container loginButton() {
    return Container(
      height: 40,
      margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        color: Color(0xFF2F4576),
        child: Text(
          'ເຂົ້າສູ່ລະບົບ',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        onPressed: () {
          if (emailController.text.isEmpty ||
              emailController.text == null ||
              emailController.text == '' ||
              passwordController.text == '' ||
              passwordController.text.isEmpty ||
              passwordController.text == null) {
            ShowAlertDialog().showWarningDialog(
                context, 'ຄຳເຕືອນ !', 'ກະລຸນາໃສ່ຂໍ້ມູນໃຫ້ຖືກຕ້ອງ');
          } else {
            print(emailController.text);
            print(passwordController.text);
            _service.signInWithEmail(emailController.text, passwordController.text).then((value) {
              print(value);

              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => SwitchPage(),
                  ),
                  (route) => false);
            });
          }
        },
      ),
    );
  }

  Widget emailText() {
    final border = OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.transparent,
        width: 0,
      ),
      borderRadius: const BorderRadius.all(
        const Radius.circular(8),
      ),
    );
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(
          fontSize: 16,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(
            left: 10,
            top: 4,
            right: 4,
            bottom: 4,
          ),
          isDense: true,
          enabledBorder: border,
          focusedBorder: border,
          hintText: 'ອີເມລ',
        ),
        controller: emailController,
      ),
    );
  }

  Widget passwordText() {
    final border = OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.transparent,
        width: 0,
      ),
      borderRadius: const BorderRadius.all(
        const Radius.circular(8),
      ),
    );
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
      child: TextField(
        obscureText: true,
        style: TextStyle(
          fontSize: 16,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(
            left: 10,
            top: 4,
            right: 4,
            bottom: 4,
          ),
          isDense: true,
          enabledBorder: border,
          focusedBorder: border,
          hintText: 'ລະຫັດຜ່ານ',
        ),controller: passwordController,
      ),
    );
  }
}
