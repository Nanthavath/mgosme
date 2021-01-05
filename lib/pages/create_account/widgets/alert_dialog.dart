import 'package:flutter/material.dart';

class ShowAlertDialog {
  ShowAlertDialog();

  Future<void> showWarningDialog(
      BuildContext context, String title, String content) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding:
              EdgeInsets.only(left: MediaQuery.of(context).size.width / 4.8),
          title:  Row(
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.warning,color: Colors.red,),
                SizedBox(width: 10,),
                Text(title),
              ],
            ),
          content: Text(content),
          actions: <Widget>[
            TextButton(

              child: Text('ເຂົ້າໃຈແລ້ວ'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
