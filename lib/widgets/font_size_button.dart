import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:ultimate_tasbih_app/services/const.dart';

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
    return NeumorphicButton(
      tooltip: toolTip,
      style: NeumorphicStyle(
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(15)),
          color: oliveGreen,
          shadowDarkColor: kombuGreen.withOpacity(0.8),
          shadowLightColor: oliveGreen.withOpacity(0.8),
          lightSource: LightSource.topRight),
      onPressed: onTap,
      child: icon,
    );
  }
}
