import 'package:flutter/material.dart';

class BackToLogin extends StatelessWidget {
  VoidCallback onPress;
  String title;
  BackToLogin({this.title,this.onPress});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: FlatButton(
        onPressed: onPress,
        child: Text('${title==null?'ມີບັນຊີຜູ້ໃຊ້ແລ້ວ?':title}',
          style: TextStyle(color: Colors.deepPurple),
        ),
      ),
    );
  }
}
