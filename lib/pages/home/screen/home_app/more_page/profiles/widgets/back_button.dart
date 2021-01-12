import 'package:flutter/material.dart';
class BackButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: InkWell(
        child: Container(
          margin: EdgeInsets.only(left: 10,top: 5),
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.deepOrange),
          ),
          child: Icon(
            Icons.arrow_back,
            color: Colors.orange,
          ),
        ),
        onTap: () {
         Navigator.of(context).pop();
        },
      ),
    );
  }
}

