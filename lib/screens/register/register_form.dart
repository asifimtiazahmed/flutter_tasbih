import 'package:flutter/material.dart';
import 'package:ultimate_tasbih_app/services/const.dart';
import 'package:ultimate_tasbih_app/widgets/gradient_button.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);
  static const String routeName = 'registerForm';

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String? validateEmail(value) {
    Pattern pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = new RegExp(pattern.toString());
    if (!regex.hasMatch(value) || value == null)
      return 'Enter a valid email address';
    else
      return 'Whats this?';
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                icon: Icon(Icons.email),
                labelText: 'Email',
              ),
              keyboardType: TextInputType.emailAddress,
              validator: validateEmail,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                icon: Icon(Icons.lock),
                labelText: 'Password',
              ),
              obscureText: true,
              obscuringCharacter: '■',
              keyboardType: TextInputType.emailAddress,
              validator: validateEmail,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          GradientButton(
            width: MediaQuery.of(context).size.width * 0.5,
            height: 50.0,
            text: 'Login',
            onPressed: () {},
          ),
          SizedBox(height: 20),
          GradientButton(
            width: MediaQuery.of(context).size.width * 0.5,
            height: 50.0,
            text: 'Register',
            onPressed: () {},
          ),
          TextButton(
            child: Text(
              'Forgot password?',
              style: TextStyle(
                  color: kombuGreen, fontWeight: FontWeight.w500, fontSize: 18),
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
