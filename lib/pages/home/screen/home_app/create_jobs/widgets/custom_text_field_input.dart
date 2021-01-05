import 'package:flutter/material.dart';

class CustomTextInput extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final bool readOnly;
  final IconData icon;
  final VoidCallback onTap;

  CustomTextInput({
    this.hintText,
    this.keyboardType,
    this.controller,
    this.readOnly = false,this.icon,this.onTap
  });

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.transparent,
        width: 0,
      ),
      borderRadius: const BorderRadius.all(
        const Radius.circular(8),
      ),
    );
    return Card(
      child: TextField(
        onTap: onTap,

        readOnly: readOnly,
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          suffixIcon: Icon(icon),
          isDense: true,
          enabledBorder: border,
          focusedBorder: border,
          border: border,
          hintText: hintText,
          contentPadding: EdgeInsets.only(
            left: 10,
            top: 8,
            right: 4,
            bottom: 8,
          ),
        ),
      ),
    );
  }
}
