import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ultimate_tasbih_app/services/const.dart';
import 'package:ultimate_tasbih_app/widgets/slider_toggle.dart';

class TasbihAppBar extends StatelessWidget {
  const TasbihAppBar(
      {Key? key,
      required this.globeTap,
      required this.libraryTap,
      required this.onChange})
      : super(key: key);
  final globeTap;
  final libraryTap;
  final onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SliderSwitch(
                onChange: onChange,
              ),
              Container(height: 55, width: 1), //SPACER
              IconButton(
                icon: Icon(FluentIcons.library_24_filled,
                    size: iconSize, color: kombuGreen),
                onPressed: this.libraryTap,
              ),
              IconButton(
                icon: Icon(
                  FluentIcons.book_globe_24_filled,
                  size: iconSize,
                  color: kombuGreen,
                ),
                onPressed: this.globeTap,
              ),
              IconButton(
                icon: const Icon(Icons.account_circle,
                    color: kombuGreen, size: iconSize),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              )
            ],
          ),
          Container(
            height: 2,
            width: MediaQuery.of(context).size.width * 0.90,
            color: kombuGreen,
          ),
        ],
      ),
    );
  }
}
