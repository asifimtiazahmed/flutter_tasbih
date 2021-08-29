import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../services/const.dart';

class CircleCounterButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      onPressed: () {
        print('couter button pressed');
      },
      style: NeumorphicStyle(
        shape: NeumorphicShape.convex,
        boxShape: NeumorphicBoxShape.circle(),
        shadowDarkColor: liverDogs,
        shadowLightColor: fawn,
        depth: 7,
        lightSource: LightSource.topLeft,
        color: fawn,
      ),
      padding: EdgeInsets.all(20),
      child: Icon(
        Icons.add,
        color: liverDogs,
        size: 40,
      ),
    );
  }
}
