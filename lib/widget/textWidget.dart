import 'dart:ffi';

import 'package:flutter/cupertino.dart';

class TextWidget extends StatelessWidget {
  final String? txt;
  final Color? txtColor;
  final double? txtSize;

  const TextWidget({super.key, required this.txt, this.txtColor, this.txtSize});

  @override
  Widget build(BuildContext context) {
    return Text(txt!, style: TextStyle(color: txtColor, fontSize: txtSize));
  }
}
