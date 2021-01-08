import 'package:flutter/material.dart';
class BackButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: InkWell(
        child: Container(
          margin: EdgeInsets.only(left: 10),
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white),
          ),
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        onTap: () {
         Navigator.of(context).pop();
        },
      ),
    );
  }
}

