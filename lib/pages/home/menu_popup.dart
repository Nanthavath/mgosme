import 'package:flutter/material.dart';
class MenuPopUp extends StatefulWidget {
  @override
  _MenuPopUpState createState() => _MenuPopUpState();
}

class _MenuPopUpState extends State<MenuPopUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popup'),
      ),
      body: Container(
        child: Center(
          child: RaisedButton(
            child: Text('PopUp Menu'),
            onPressed: (){},
          ),
        ),
      ),
    );
  }
}
