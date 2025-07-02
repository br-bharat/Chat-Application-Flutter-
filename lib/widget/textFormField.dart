import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomUnderlineTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final Color borderColor;
  final Color focusedColor;
  final Color textColor;

  const CustomUnderlineTextField({
    super.key,
    required this.controller,
    this.borderColor = Colors.grey,
    this.focusedColor = Colors.white,
    this.textColor = Colors.black,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: TextStyle(color: textColor),
      decoration: InputDecoration(
        // labelText: label,
        // labelStyle: TextStyle(color: borderColor),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: borderColor, width: 1.5),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: focusedColor, width: 2),
        ),
      ),
    );
  }
}
