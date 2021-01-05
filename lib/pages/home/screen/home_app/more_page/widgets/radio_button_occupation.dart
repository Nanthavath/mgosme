import 'package:flutter/material.dart';

class RadioOccupation extends StatefulWidget {
  List<String> occupation;
  String selected;

  RadioOccupation({this.occupation, this.selected});

  @override
  _RadioOccupationState createState() =>
      _RadioOccupationState(occupation: occupation, selected: selected);
}

String selectValueOccupation;

class _RadioOccupationState extends State<RadioOccupation> {
  List<String> occupation;
  String selected;

  _RadioOccupationState({this.occupation, this.selected});
  @override
  void initState() {
    if(selected!=null){
      selectValueOccupation=selected;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Column(
        children: List.generate(
          occupation.length,
          (index) => Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
              border: const Border(
                bottom: BorderSide(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
            ),
            child: ListTile(
              dense: true,
              leading: Radio(
                value: occupation[index],
                groupValue: selectValueOccupation,
                onChanged: (value) {
                  setState(() {
                    onSelected(value);
                  });
                },
              ),
              title: InkWell(
                child: Text('${occupation[index]}'),
                onTap: () {
                  onSelected('${occupation[index]}');
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  onSelected(String value) {
    setState(() {
      selectValueOccupation = value;
    });
  }
}
