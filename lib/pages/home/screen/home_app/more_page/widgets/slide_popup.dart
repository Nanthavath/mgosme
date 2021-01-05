import 'package:flutter/material.dart';

class SelectGender extends StatefulWidget {
  int index;
  SelectGender({this.index});
  @override
  _SelectGenderState createState() => _SelectGenderState(index: index);
}
String sexSelected;
class _SelectGenderState extends State<SelectGender> {
  int index;
  _SelectGenderState({this.index});
  List<String> _dropdownValues = [ 'ຊາຍ', 'ຍິງ', 'ອື່ນໆ'];
  String dropdownValue;


  @override
  Widget build(BuildContext context) {
    dropdownValue=_dropdownValues[index];
    return Container(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isDense: true,
              isExpanded: true,
              itemHeight: 50.0,
              value: dropdownValue,
              iconSize: 24,
              elevation: 16,
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue = newValue;
                  sexSelected=dropdownValue;
                });
              },
              items:
                  _dropdownValues.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
