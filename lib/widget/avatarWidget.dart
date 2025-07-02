import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AvatarWidget extends StatelessWidget {
  final double avatarRadius;
  final Color? bgColor;
  final IconButton? icon;

  const AvatarWidget({
    super.key,
    required this.avatarRadius,
    this.bgColor,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: avatarRadius,
      backgroundColor: bgColor,
      child: icon,
    );
  }
}
