import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final String? btnName;
  final Color? btnColor, bgColor;
  final Icon? btnIcon;
  final VoidCallback onPressed;

  const ElevatedButtonWidget({
    super.key,
    this.btnName,
    this.btnColor,
    this.bgColor,
    required this.btnIcon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(backgroundColor: bgColor),
      child: btnIcon,
    );
  }
}
