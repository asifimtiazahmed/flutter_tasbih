import 'package:flutter/material.dart';
import 'package:ultimate_tasbih_app/screens/login/login_form.dart';
import 'package:ultimate_tasbih_app/services/const.dart';
import 'package:ultimate_tasbih_app/widgets/curved_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 0.45;
    return Scaffold(
      extendBodyBehindAppBar: true,
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
              Container(
                margin: EdgeInsets.only(top: height),
                child: LoginForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
