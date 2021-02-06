import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../services/const.dart';

class CircleCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Neumorphic(
        style: NeumorphicStyle(
            shape: NeumorphicShape.convex,
            boxShape: NeumorphicBoxShape.circle(),
            depth: 7,
            lightSource: LightSource.topLeft,
            color: cornSilk,


        ),
        padding: EdgeInsets.all(30),
        child: Text('sfdfsdf'),
    );
  }
}
