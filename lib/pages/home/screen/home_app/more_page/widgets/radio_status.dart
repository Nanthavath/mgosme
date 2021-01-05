import 'package:flutter/material.dart';

class RadioButtonStatus extends StatefulWidget {
  String selected;

  RadioButtonStatus({this.selected});

  @override
  _RadioButtonStatusState createState() =>
      _RadioButtonStatusState(selected: selected);
}

String selectedStatus;

class _RadioButtonStatusState extends State<RadioButtonStatus> {
  List<String> status = [
    'ໂສດ',
    'ແຕ່ງງານແລ້ວ',
  ];
  String selected;

  _RadioButtonStatusState({this.selected});

@override
  void initState() {
    if(selected!=null){
      selectedStatus=selected;
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: List.generate(
          status.length,
          (index) {
            return Container(
              margin: EdgeInsets.only(top: 5),
              decoration: BoxDecoration(
                border: const Border(
                  bottom: BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
              ),
              child: ListTile(
                title: Text(
                  '${status[index]}',
                  style: TextStyle(fontSize: 18),
                ),
                leading: Radio(
                  value: status[index],
                  groupValue: selectedStatus,
                  onChanged: (value) {
                    setState(() {
                      // selectedStatus = value;
                      onSelected(value);
                    });
                  },
                ),
                onTap: (){
                  onSelected(status[index]);
                },
              ),

            );
          },
        ),
      ),
    );
  }

  void onSelected(String value) {
  setState(() {
    selectedStatus=value;
  });
  }
}
