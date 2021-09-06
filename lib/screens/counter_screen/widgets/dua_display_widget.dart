import 'package:flutter/material.dart';
import 'package:ultimate_tasbih_app/services/const.dart';
import 'package:ultimate_tasbih_app/services/styles.dart';

class PrayerDisplay extends StatelessWidget {
  const PrayerDisplay(
      {Key? key,
      required this.height,
      required this.duaText,
      required this.width})
      : super(key: key);
  final double height;
  final double width;
  final String duaText;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20.0, bottom: 10.0),
          child: Container(
            width: this.width,
            height: this.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.transparent,
              border: Border.all(color: kombuGreen, width: 2),
            ),
            child: Container(
              padding: EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Text(
                  this.duaText,
                  style: AppStyle.body.copyWith(
                      backgroundColor: cornSilk,
                      fontWeight: FontWeight.w800,
                      color: kombuGreen,
                      wordSpacing: 1.5,
                      letterSpacing: 1,
                      height: 1.5),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: 30,
          top: -4,
          child: Container(
            color: cornSilk,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Prayer',
                style: TextStyle(
                    backgroundColor: cornSilk,
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                    color: kombuGreen),
              ),
            ),
          ),
        ),
        // Positioned(
        //   right: 15,
        //   top: 8,
        //   child: FontSizeButton(
        //     icon: Icon(
        //       Icons.add,
        //       size: 18,
        //       color: cornSilk,
        //     ),
        //     toolTip: AppStrings.FONT_BUTTON_INCREASE_TOOLTIP,
        //     onTap: () {
        //       print('boom +');
        //     },
        //   ),
        // ),
        // Positioned(
        //   right: 90,
        //   top: 8,
        //   child: FontSizeButton(
        //     icon: Icon(
        //       Icons.remove,
        //       size: 18,
        //       color: cornSilk,
        //     ),
        //     toolTip: AppStrings.FONT_BUTTON_DECREASE_TOOLTIP,
        //     onTap: () {
        //       print('boom -');
        //     },
        //   ),
        // ),
      ],
    );
  }
}
