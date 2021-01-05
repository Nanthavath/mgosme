import 'package:flutter/material.dart';

class ButtonCRUS extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color colorIcon;
  final VoidCallback onPress;
  final Color colorBackgroundIcon;

  ButtonCRUS({
    this.icon,
    this.text,
    this.colorIcon,
    this.onPress,
    this.colorBackgroundIcon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      //width: 75,
      child: RaisedButton(
        color: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2),
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colorBackgroundIcon,
              ),
              child: Icon(
                icon,
                size: 15,
                color: colorIcon,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              text,
              style: TextStyle(fontSize: 12, color: Colors.white),
            ),
          ],
        ),
        onPressed: onPress,
      ),
    );
  }
}
