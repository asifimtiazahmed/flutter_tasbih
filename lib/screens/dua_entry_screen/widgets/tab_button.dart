import 'package:flutter/material.dart';
import 'package:ultimate_tasbih_app/services/const.dart';
import 'package:ultimate_tasbih_app/services/styles.dart';

class TabButton extends StatelessWidget {
  const TabButton(
      {Key? key,
      required this.btnText,
      required this.tap,
      required this.isSelected})
      : super(key: key);
  final String btnText;
  final Function() tap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Stack(
        alignment: AlignmentDirectional.centerStart,
        children: [
          Container(
            width: 110,
            height: 30,
            decoration: BoxDecoration(
              color: isSelected ? liverDogs : Colors.transparent,
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: liverDogs, width: 2),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(left: 22.0 - this.btnText.length, bottom: 3.0),
            child: TextButton(
              child: Text(
                this.btnText,
                style: AppStyle.title.copyWith(
                    color: this.isSelected ? cornSilk : kombuGreen,
                    fontSize: 16),
              ),
              onPressed: this.tap,
            ),
          ),
        ],
      ),
    );
  }
}
