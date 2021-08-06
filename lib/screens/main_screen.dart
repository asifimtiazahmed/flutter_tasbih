import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:ultimate_tasbih_app/widgets/appBar.dart';

import '../widgets/circle_counter.dart';

import '../services/const.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final PreferredSizeWidget utAppBar = AppBar(
    leading: Builder(
      builder: (BuildContext context) {
        return IconButton(
          icon: const Icon(Icons.menu, color: cornSilk, size: iconSize),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        );
      },
    ),
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
      IconButton(
        padding: EdgeInsets.fromLTRB(0, 0, 18, 0),
        icon: Icon(
          Icons.account_circle,
          size: iconSize,
        ),
        color: cornSilk,
        onPressed: () => null,
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: utAppBar,
        backgroundColor: cornSilk,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 30.0),
              child: Center(
                child: Stack(children: [
                  Container(
                    width: 200,
                    height: 200,
                    alignment: Alignment.center,
                    child: Text(
                      '500',
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 35,
                          color: kombuGreen),
                    ),
                  ),
                  Container(
                    width: 200,
                    height: 200,
                    child: CircularProgressIndicator(
                      value: 0.70,
                      strokeWidth: 30,
                      color: kombuGreen,
                    ),
                  ),
                ]),
              ),
            ),
            CircleCounter(),
            SizedBox(
              height: mediaQuery.height * 0.20,
            ),
          ],
        ),
      ),
    );
  }
}

// TODO: change background color to cornSilk
// TODO: import neumorphic package
// TODO: import the splash type progress indicator
// TODO: import storage package to keep the count in memory SharedPreferences
// TODO: Shift App bar to its own widget area
// TODO: Create a column to incorporate the dua space, counter, button
// TODO: Add in Settings left handed or Right handed
// TODO: Import Google font for most typing, counter
// TODO: implement the screen size MediaQery for responsiveness
// TODO: Design implement pastel colors for soothing eye
// TODO: Need to find a way to get frosted glass look for some of the slivers
// TODO: implement better buttons, maybe think about velocityX??
//TODO: Start making a routine that fits what you do - So edit the current one to reflect
// 14Feb 2021 git hub update 4
