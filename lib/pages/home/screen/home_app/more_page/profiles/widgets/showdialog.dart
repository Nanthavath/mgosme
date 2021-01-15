import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class CustomAlertDialogStars {
  CustomAlertDialogStars();

  alertDialog(
      {BuildContext context, String title, String message, IconData icon}) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Icon(
              icon,
              // color: Colors.red,
            ),
            SizedBox(
              width: 8,
            ),
            Text(title),
          ],
        ),
        content: Text(message),
        actions: [
          FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('ຕົກລົງ'),
          )
        ],
      ),
    );
  }
}
