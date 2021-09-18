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
            height: this.height,
            padding: EdgeInsets.all(20),
            child: Scrollbar(
              child: SingleChildScrollView(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    this.duaText,
                    textAlign: TextAlign.justify,
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
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: this.width / 3,
                height: 2,
                color: kombuGreen,
                padding: EdgeInsets.symmetric(horizontal: 20),
              ),
              Container(
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
              Container(
                width: this.width / 3,
                height: 2,
                color: kombuGreen,
                padding: EdgeInsets.symmetric(horizontal: 20),
              ),
            ],
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
