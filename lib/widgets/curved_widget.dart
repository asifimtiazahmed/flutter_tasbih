import 'package:flutter/material.dart';

class CurvedWidget extends StatelessWidget {
  const CurvedWidget(
      {Key? key,
      required this.child,
      required this.curvedDistance,
      required this.curvedHeight})
      : super(key: key);
  final Widget child;
  final double curvedDistance;
  final double curvedHeight;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CurvedWidgetBackgroundClipper(
        curvedDistance: curvedDistance,
        curvedHeight: curvedHeight,
      ),
      clipBehavior: Clip.antiAlias,
      child: child,
    );
  }
}

class CurvedWidgetBackgroundClipper extends CustomClipper<Path> {
  final double curvedDistance;
  final double curvedHeight;
  CurvedWidgetBackgroundClipper(
      {required this.curvedDistance, required this.curvedHeight});

  @override
  getClip(Size size) {
    Path clippedPath = Path();
    clippedPath.lineTo(size.width, 0);
    clippedPath.lineTo(size.width, size.height - curvedHeight - curvedDistance);
    clippedPath.quadraticBezierTo(size.width, size.height - curvedHeight,
        size.width - curvedDistance, size.height - curvedHeight);
    clippedPath.lineTo(curvedDistance, size.height - curvedHeight);
    clippedPath.quadraticBezierTo(
        0, size.height - curvedHeight, 0, size.height);
    clippedPath.lineTo(0, 0);

    return clippedPath;
  }

  @override
  bool shouldReclip(covariant CustomClipper<dynamic> oldClipper) {
    return false;
  }
}
