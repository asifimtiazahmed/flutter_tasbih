import 'package:flutter/material.dart';
import 'package:ultimate_tasbih_app/screens/register/register_form.dart';
import 'package:ultimate_tasbih_app/services/const.dart';
import 'package:ultimate_tasbih_app/widgets/login_background.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  static const String routeName = 'registerScreen';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 0.45;
    return LoginBackground(
      title: 'Register',
      child: RegisterForm(),
      height: height,
      isAppBar: true,
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
    );
  }
}
