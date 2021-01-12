import 'package:flutter/material.dart';
class TextInput extends StatelessWidget {
  final TextEditingController controller;
  final String hint;

  const TextInput({Key key, this.controller,this.hint}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20,right: 20),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
        ),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(
              left: 16,
              top: 8,
              bottom: 8,
              right: 10,
            ),
            hintText: '$hint',

            border: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),

          ),

        ),
      ),
    );
  }
}
