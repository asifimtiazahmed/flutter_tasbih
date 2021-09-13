import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:ultimate_tasbih_app/services/const.dart';

class CounterProgressIndicator extends StatelessWidget {
  const CounterProgressIndicator(
      {Key? key,
      required this.currentValue,
      required this.totalValue,
      required this.progressIndicator,
      required this.heightAndWidth,
      required this.isOnlyIndicator})
      : super(key: key);
  final int currentValue;
  final int totalValue;
  final double progressIndicator;
  final double heightAndWidth;
  final bool isOnlyIndicator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: Center(
        child: Stack(
          children: [
            Neumorphic(
              style: NeumorphicStyle(
                  shape: NeumorphicShape.convex,
                  boxShape:
                      NeumorphicBoxShape.roundRect(BorderRadius.circular(200)),
                  depth: 7,
                  lightSource: LightSource.top,
                  shadowLightColor: fawn.withOpacity(0.5),
                  shadowDarkColor: liverDogs.withOpacity(0.5),
                  shadowDarkColorEmboss: kombuGreen,
                  shadowLightColorEmboss: oliveGreen,
                  color: Colors.transparent),
              child: CircularPercentIndicator(
                percent: this.progressIndicator,
                lineWidth: 15,
                progressColor: liverDogs,
                radius: this.heightAndWidth,
                circularStrokeCap: CircularStrokeCap.round,
                backgroundColor: fawn.withOpacity(0.7),
              ),
            ),
            Container(
              width: heightAndWidth,
              height: heightAndWidth,
              alignment: Alignment.center,
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Column(
                  children: [
                    Text(
                      this.currentValue.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 35,
                          color: kombuGreen),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    isOnlyIndicator
                        ? Container()
                        : Text(
                            'out of',
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 20,
                                color: kombuGreen),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                    isOnlyIndicator
                        ? Container()
                        : Text(
                            this.totalValue.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 35,
                                color: kombuGreen),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
