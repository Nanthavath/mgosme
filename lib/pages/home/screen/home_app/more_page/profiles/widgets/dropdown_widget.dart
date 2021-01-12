import 'package:flutter/material.dart';
import 'package:mgosme/pages/home/screen/home_app/more_page/profiles/edit_profiles/edit_info.dart';
import 'package:mgosme/pages/home/screen/home_app/more_page/profiles/edit_profiles/education.dart';

class DropDownWidget extends StatefulWidget {
  final List<String> list;
  final String icon;
  final String hint;

  const DropDownWidget({Key key, this.list, this.icon, this.hint})
      : super(key: key);

  @override
  _DropDownWidgetState createState() => _DropDownWidgetState(list, icon, hint);
}

class _DropDownWidgetState extends State<DropDownWidget> {
  //List<String> genders = ['   ຊາຍ', '   ຍິງ', '   ອື່ນໆ'];
  final List<String> list;
  final String icon;
  final String hint;
  String selected;

  _DropDownWidgetState(this.list, this.icon, this.hint);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        children: [
          Container(
            width: 40,
            child: Image.asset(
              '$icon',
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
              child: DropdownButton<String>(
                hint: Text('   $hint'),
                isExpanded: true,
                underline: Container(),
                value: selected,
                onChanged: (String newValue) {
                  setState(() {
                    selected = newValue;
                    gender = selected.trim();
                    level=newValue.trim();

                  });
                },
                items: list.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
