import 'package:flutter/material.dart';

class FontSizeButton extends StatelessWidget {
  const FontSizeButton(
      {Key? key,
      required this.onTap,
      required this.icon,
      required this.toolTip})
      : super(key: key);
  final onTap;
  final icon;
  final toolTip;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: icon,
    );
  }
}
