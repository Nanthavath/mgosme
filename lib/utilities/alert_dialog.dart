import 'package:flutter/material.dart';
import 'package:flutter_progress_dialog/flutter_progress_dialog.dart';

class CustomAlertDialog {
  CustomAlertDialog();

  Future loadingDialog(BuildContext context) async {
    showProgressDialog(
      loadingText: 'ກຳລັງໂຫຼດ...',
      textStyle: TextStyle(fontSize: 14),
      orientation: ProgressOrientation.vertical,
    );
    Future.delayed(Duration(seconds: 1), () {
      dismissProgressDialog();
    });
  }

  void optionDialog(BuildContext context, String title, String content,
      VoidCallback onPressed) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(
            children: [
              Icon(
                Icons.warning,
                color: Colors.red,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                '$title',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          content: Text('$content'),
          actions: [
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'ຍົກເລີກ',
                style: TextStyle(color: Colors.blue),
              ),
            ),
            MaterialButton(
              onPressed: onPressed,
              child: Text(
                'ຢືນຢັນ',
                style: TextStyle(color: Colors.blue),
              ),
            )
          ],
        );
      },
    );
  }

  void showWarningDialog(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(
            children: [
              Icon(
                Icons.warning,
                color: Colors.red,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                '$title',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          content: Text('$content'),
          actions: [
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'ເຂົ້າໃຈແລ້ວ',
                style: TextStyle(color: Colors.blue),
              ),
            )
          ],
        );
      },
    );
  }
}
