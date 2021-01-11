import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mgosme/pages/home/screen/home_app/more_page/profiles/edit_profiles/education.dart';
import 'package:mgosme/pages/home/screen/home_app/more_page/profiles/view/input_formater.dart';
import 'package:mgosme/pages/home/screen/home_app/more_page/profiles/widgets/back_button.dart';
import 'package:mgosme/pages/home/screen/home_app/more_page/profiles/widgets/dropdown_widget.dart';
import 'package:mgosme/pages/home/screen/home_app/more_page/profiles/widgets/next_buttton.dart';

class Info extends StatefulWidget {
  @override
  _InfoState createState() => _InfoState();
}

TextEditingController name = TextEditingController();
TextEditingController surname = TextEditingController();
String gender = '';

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      _cover(),
                      _profile(),
                    ],
                  ),
                  Container(
                    height: 500,
                    child: Column(
                      children: [
                        _textInputName(),
                        DropDownWidget(),
                        _textInputDate(),
                        _textInput(
                            ico: 'icons/address.png',
                            hint: 'ທີ່ຢູ່',
                            enabled: false),
                        _textInput(
                          ico: 'icons/phone.png',
                          hint: 'ເບີໂທ',
                        ),
                        _textInput(
                          ico: 'icons/email.png',
                          hint: 'ອີເມລ',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            BackButtons(),
            Align(
              alignment: Alignment.bottomRight,
              child: NextButtons(
                title: 'ຖັດໄປ',
                onPressed: () {
                  if (gender == '') {
                    print('Please select your gender!!');
                  } else {
                    print(' your gender==$gender');
                  }

                  // Navigator.of(context).push(MaterialPageRoute(
                  //   builder: (context) => Education(),
                  // ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  _cover() {
    return Container(
      color: Colors.blue,
      height: 200,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: NetworkImage(
                  'https://www.eta.co.uk/wp-content/uploads/2012/09/Cycling-by-water-resized-min.jpg'),
              fit: BoxFit.cover,
            )),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: _cameraButton(
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }

  _cameraButton({VoidCallback onTap}) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(right: 10, bottom: 10),
        height: 30,
        width: 30,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey,
            border: Border.all(color: Colors.white)),
        child: Icon(
          Icons.camera_alt,
        ),
      ),
      onTap: onTap,
    );
  }

  _profile() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 150),
          height: 140,
          width: 140,
          child: Stack(
            children: [
              Container(
                height: 140,
                width: 140,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                    border: Border.all(width: 3, color: Colors.white)),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: _cameraButton(),
              )
            ],
          ),
        ),
      ],
    );
  }

  textField({TextEditingController controller, String hint}) => Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.only(
                left: 16,
                top: 8,
                bottom: 8,
                right: 10,
              ),
              border: OutlineInputBorder(borderSide: BorderSide.none),
              isDense: true,
              hintText: '$hint'),
        ),
      );

  _textInputName() {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        children: [
          Image(
            image: AssetImage('icons/user.png'),
            width: 40,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: textField(controller: name, hint: 'ຊື່'),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: textField(controller: surname, hint: 'ນາມສະກຸນ'),
          ),
        ],
      ),
    );
  }

  _textInput({
    TextEditingController controller,
    String hint,
    String ico,
    bool enabled,
  }) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        children: [
          Container(
            width: 40,
            child: Image.asset(
              ico,
              width: 30,
              height: 30,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextField(
                enabled: enabled,
                controller: controller,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                      left: 16,
                      top: 8,
                      bottom: 8,
                      right: 10,
                    ),
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    isDense: true,
                    hintText: '$hint'),
              ),
            ),
          )
        ],
      ),
    );
  }

  _textInputDate() {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        children: [
          Container(
            width: 40,
            child: Image.asset(
              'icons/calendar.png',
              width: 35,
              height: 35,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(6),
                  InputFormatter(),
                ],
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(
                    left: 16,
                    top: 8,
                    bottom: 8,
                    right: 10,
                  ),
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  hintText: 'DD/MM/YY',
                ),
                keyboardType: TextInputType.number,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
