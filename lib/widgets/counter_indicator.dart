import 'package:flutter/material.dart';
import 'package:ultimate_tasbih_app/services/const.dart';

class CounterProgressIndicator extends StatelessWidget {
  const CounterProgressIndicator(
      {Key? key,
      required this.currentValue,
      required this.totalValue,
      required this.progressIndicator,
      required this.heightAndWidth})
      : super(key: key);
  final int currentValue;
  final int totalValue;
  final double progressIndicator;
  final double heightAndWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: Center(
        child: Stack(children: [
          Container(
            width: heightAndWidth,
            height: heightAndWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(heightAndWidth),
              border: Border.all(color: fawn, width: 10.0),
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
                  Text(
                    'out of',
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                        color: kombuGreen),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
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
          Container(
            width: heightAndWidth,
            height: heightAndWidth,
            child: CircularProgressIndicator(
              value: this.progressIndicator,
              strokeWidth: 20,
              color: kombuGreen,
            ),
          ),
        ]),
      ),
    );
  }
}
