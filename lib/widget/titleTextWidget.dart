import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TitleTextWidget extends StatelessWidget {
  final String txt;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? txtColor;

  const TitleTextWidget({
    super.key,
    required this.txt,
    required this.fontSize,
    this.fontWeight,
    this.txtColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        txt,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: txtColor,
        ),
      ),
    );
  }
}
