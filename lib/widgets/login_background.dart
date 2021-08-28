import 'package:flutter/material.dart';
import 'package:ultimate_tasbih_app/services/const.dart';

import 'curved_widget.dart';

class LoginBackground extends StatelessWidget {
  const LoginBackground(
      {Key? key,
      required this.title,
      required this.child,
      required this.height,
      this.isAppBar = false,
      this.leading = const SizedBox(
        height: 0,
      )})
      : super(key: key);
  final String title;
  final Widget child;
  final double height;
  final bool isAppBar;
  final leading;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: isAppBar ? leading : null,
      ),
      body: Container(
        height: height * 2.5,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [cornSilk, cornSilk]),
        ),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              CurvedWidget(
                curvedDistance: 80,
                curvedHeight: 80,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomCenter,
                        colors: [kombuGreen, oliveGreen.withOpacity(0.9)]),
                  ),
                  width: double.infinity,
                  height: height,
                  child: Padding(
                    padding: EdgeInsets.only(top: height * 0.35),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        this.title,
                        style: TextStyle(
                            fontFamily: 'Rodja',
                            color: fawn,
                            fontWeight: FontWeight.w800,
                            fontSize: 55,
                            letterSpacing: 2),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: height),
                child: this.child,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
