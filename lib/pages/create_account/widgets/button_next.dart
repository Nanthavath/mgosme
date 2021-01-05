import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  VoidCallback onPress;
  String title;

  NextButton({this.onPress, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.2,
      height: 35,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        color: Colors.blueAccent,
        child: Text(
          title,
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        onPressed: onPress,
      ),
    );
  }
}
