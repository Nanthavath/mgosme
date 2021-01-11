import 'package:flutter/material.dart';
import 'package:mgosme/pages/home/screen/home_app/more_page/profiles/edit_profiles/edit_info.dart';

class DropDownWidget extends StatefulWidget {
  @override
  _DropDownWidgetState createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  List<String> genders = ['   ຊາຍ', '   ຍິງ', '   ອື່ນໆ'];
  String selected;

  //
  // @override
  // void initState() {
  //   selected = genders[0];
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        children: [
          Container(
            width: 40,
            child: Image.asset(
              'icons/gender.png',
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

                hint: Text('   ເລືອກເພດ'),
                isExpanded: true,
                underline: Container(),
                value: selected,
                onChanged: (String newValue) {
                  setState(() {
                    selected = newValue;
                    gender = selected.trim();
                    print('Gender==${selected.trim()}');
                  });
                },
                items: genders.map<DropdownMenuItem<String>>((String value) {
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
