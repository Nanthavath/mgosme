import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        elevation: 0,
        title: Text(
          'ຕັ້ງຄ່າບັນຊີ',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
