import 'package:flutter/material.dart';

import '../services/const.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu, color: cornSilk, size: iconSize),
                onPressed: () { Scaffold.of(context).openDrawer(); },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          title: Text('Ultimate Tasbih',
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
                    padding: EdgeInsets.fromLTRB(0,0,18,0),
                    icon: Icon (Icons.account_circle,
                    size: iconSize,),
                    color: cornSilk,
                    onPressed: ()=> null,
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
// TODO: import storage package to keep the count in memory
// TODO: Shift App bar to its own widget area
// TODO: Create a column to incorporate the dua space, counter, button
// TODO: Add in Settings left handed or Right handed
// TODO: Import Google font for most typing, counter
// TODO: implement the screen size MediaQery for responsiveness
