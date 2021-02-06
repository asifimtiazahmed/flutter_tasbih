import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ultimate_tasbih_app/widgets/appBar.dart';

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
    final mediaQuery = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: utAppBar,
        body: Container(
          color: cornSilk,
          child: Row(
            children: [
              Container( //This will be the completion bar
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: mediaQuery.size.width * 0.10,
                color: fawn,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
                    child: CircleAvatar(
                      radius: mediaQuery.size.width *0.70/2,
                      child: Text('Counter Display'),
                      backgroundColor: liverDogs,
                    ),
                  ),
                  SizedBox(
                    height: mediaQuery.size.height * 0.20,
                  ),

                  CircleAvatar()
                  // RaisedButton(
                  //   shape: CircleBorder(
                  //      side: BorderSide(
                  //        width: 3.0,
                  //        color: Colors.deepOrangeAccent,
                  //        style: BorderStyle.none,
                  //      ),
                  //   ),
                  //   onPressed: ()=> null,
                  // ),


                ],
              ),
            ],
          ),
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