import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mgosme/pages/create_account/adapter/user_adapter.dart';

class GenderSelected extends StatefulWidget {
  @override
  _GenderSelectedState createState() => _GenderSelectedState();
}

List<String> gender = ['ຊາຍ', 'ຍິງ', 'ອື່ນໆ'];
String genderSelected = '';
String selected;

class _GenderSelectedState extends State<GenderSelected> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: List.generate(
            gender.length,
            (index) {
              return Container(
                margin: EdgeInsets.only(top: 5),
                decoration: BoxDecoration(
                  border: const Border(
                      bottom: BorderSide(
                    color: Colors.grey,
                    width: 1,
                  )),
                ),
                child: ListTile(
                  title: Text(
                    '${gender[index]}',
                    style: TextStyle(fontSize: 18),
                  ),
                  trailing: Radio(
                    value: gender[index],
                    groupValue: genderSelected,
                    onChanged: (value) {
                      setState(() {
                        genderSelected = value;
                        userModel.sex=genderSelected;
                        print(genderSelected);
                      });
                    },
                  ),
                ),
              );
            },
          ),
        ));
  }
}
