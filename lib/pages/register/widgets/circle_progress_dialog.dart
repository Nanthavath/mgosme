import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';

class CircleProgressDialog {
  CircleProgressDialog();
  Future<ProgressDialog> showProgress(BuildContext context)async{
    final ProgressDialog pr = ProgressDialog(context);
    pr.style(
        message: 'ກຳລັງກວດສອບ...',
        borderRadius: 10.0,
        backgroundColor: Colors.white,
        progressWidget: CircularProgressIndicator(),
        elevation: 1.0,
        insetAnimCurve: Curves.easeInOut,
        progress: 0.0,
        maxProgress: 5.0,
        progressTextStyle: TextStyle(
            color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
        messageTextStyle: TextStyle(
            color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.normal)
    );
    await pr.show();
    Future.delayed(Duration(seconds: 3),(){
      pr.hide();
    });

    return pr;
  }
}
