import 'package:flutter/material.dart';
import 'package:ultimate_tasbih_app/screens/login_form.dart';
import 'package:ultimate_tasbih_app/services/const.dart';
import 'package:ultimate_tasbih_app/widgets/curved_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const String routeName = 'loginScreen';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 0.45;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [cornSilk, fawn.withOpacity(0.1)]),
        ),
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
                height: height * 0.45,
                child: Padding(
                  padding: EdgeInsets.only(top: height * 0.35),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      'Login',
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
            Container(child: LoginForm()),
          ],
        ),
      ),
    );
  }
}
