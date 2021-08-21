import 'package:flutter/material.dart';
import 'package:ultimate_tasbih_app/screens/register/register_form.dart';
import 'package:ultimate_tasbih_app/services/const.dart';
import 'package:ultimate_tasbih_app/widgets/curved_widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  static const String routeName = 'registerScreen';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 0.45;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            color: cornSilk,
            size: 50,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
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
                        'Register',
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
                child: RegisterForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
