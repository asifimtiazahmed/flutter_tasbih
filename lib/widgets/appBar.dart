import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../services/const.dart';

final PreferredSizeWidget utAppBar = AppBar(
  // leading: Builder(
  //   builder: (BuildContext context) {
  //     return IconButton(
  //       icon: const Icon(Icons.menu, color: cornSilk, size: iconSize),
  //       onPressed: () {
  //         Scaffold.of(context).openDrawer();
  //       },
  //       tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
  //     );
  //   },
  // ),
  title: Text(
    'Ultimate Tasbih',
    style: TextStyle(
      color: cornSilk,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
  ),
  backgroundColor: kombuGreen,
  shadowColor: oliveGreen,
  elevation: 9,
  actions: [
    Builder(
      builder: (BuildContext context) {
        return IconButton(
          icon:
              const Icon(Icons.account_circle, color: cornSilk, size: iconSize),
          onPressed: () {
            Scaffold.of(context).openEndDrawer();
          },
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        );
      },
    ),
  ],
);
