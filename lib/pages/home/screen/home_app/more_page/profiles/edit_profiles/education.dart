import 'package:flutter/material.dart';
import 'package:mgosme/pages/home/screen/home_app/more_page/profiles/widgets/back_button.dart';
import 'package:mgosme/pages/home/screen/home_app/more_page/profiles/widgets/dropdown_widget.dart';
import 'package:mgosme/pages/home/screen/home_app/more_page/profiles/widgets/next_buttton.dart';
import 'package:mgosme/pages/home/screen/home_app/more_page/profiles/widgets/textInput.dart';

class Education extends StatefulWidget {
  @override
  _EducationState createState() => _EducationState();
}
String level;
DropDownWidget _downWidget=DropDownWidget();
List<String>levels=['1','2','3'];


class _EducationState extends State<Education> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [

              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 150,
                        child: Image.asset('icons/education.png'),
                      ),
                    ],
                  ),
                  // DropDownWidget(
                  //   list: levels,
                  //   hint: 'ລະດັບການສຶກສາ',
                  //   icon: 'icons/education.png',
                  // ),
                  TextInput(
                    hint: 'ວິຊາ',
                  ),
                  TextInput(
                    hint: 'ໂຮງຮຽນ ຫຼື ມະຫາວິທະຍາໄລ',
                  ),
                  TextInput(
                    hint: 'ໂຮງຮຽນ ຫຼື ມະຫາວິທະຍາໄລ',
                  ),


                ],
              ),
              BackButtons(),
              Align(
                alignment: Alignment.bottomRight,
                child: NextButtons(
                  onPressed: () {
                    print('Hint===$level');
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
