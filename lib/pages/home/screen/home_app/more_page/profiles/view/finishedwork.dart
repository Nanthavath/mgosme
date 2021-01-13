import 'package:flutter/material.dart';

class Finishedword extends StatefulWidget {
  @override
  _FinishedwordState createState() => _FinishedwordState();
}

class _FinishedwordState extends State<Finishedword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text(
          'page3',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
