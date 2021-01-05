import 'package:flutter/material.dart';

class QRCodeViewer extends StatefulWidget {
  String imgUrl;
  QRCodeViewer({this.imgUrl});
  @override
  _QRCodeViewerState createState() => _QRCodeViewerState(imgUrl: imgUrl);
}

class _QRCodeViewerState extends State<QRCodeViewer> {
  String imgUrl;
  _QRCodeViewerState({this.imgUrl});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ລະຫັດ QRCode'),
        actions: [
          InkWell(
            child: Icon(Icons.more_vert),
            onTap: (){},
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Center(
          child: Image.network(imgUrl),
        ),
      ),
    );
  }
}
