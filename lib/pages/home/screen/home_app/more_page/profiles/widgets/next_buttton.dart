import 'package:flutter/material.dart';

class NextButtons extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;

  const NextButtons({Key key, this.onPressed, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10, bottom: 20),
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title == null ? 'ຖັດໄປ' : '$title'),
            Icon(
              Icons.arrow_forward_ios_outlined,
              size: 20,
            )
          ],
        ),
        onPressed: onPressed,
      ),
    );
  }
}
