import 'package:flutter/material.dart';
import 'package:ultimate_tasbih_app/screens/login/login_form.dart';
import 'package:ultimate_tasbih_app/widgets/login_background.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const String routeName = 'loginScreen';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 0.45;
    return LoginBackground(
      title: 'Login',
      child: LoginForm(),
      height: height,
    );
  }
}
