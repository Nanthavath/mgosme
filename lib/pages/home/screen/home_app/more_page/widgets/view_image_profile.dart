import 'package:flutter/material.dart';

class ViewProfile extends StatefulWidget {
  @override
  _ViewProfileState createState() => _ViewProfileState();
}

class _ViewProfileState extends State<ViewProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ຮູບໂປຣໄຟ'),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
