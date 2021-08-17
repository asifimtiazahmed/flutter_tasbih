import 'package:flutter/material.dart';
import 'package:ultimate_tasbih_app/services/const.dart';

class GradientButton extends StatelessWidget {
  const GradientButton(
      {required this.text,
      required this.onPressed,
      required this.height,
      required this.width});
  final String text;
  final double width;
  final double height;
  final onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(80),
        color: oliveGreen,
      ),
      child: MaterialButton(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: StadiumBorder(),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(text,
              style: TextStyle(
                  color: cornSilk,
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 2)),
        ),
      ),
    );
  }
}
