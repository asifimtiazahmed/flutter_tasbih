import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:ultimate_tasbih_app/screens/register/register_screen.dart';
import 'package:ultimate_tasbih_app/services/authentication.dart';
import 'package:ultimate_tasbih_app/services/const.dart';
import 'package:ultimate_tasbih_app/widgets/gradient_button.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  LoginForm({Key? key}) : super(key: key);
  static const String routeName = 'loginForm';

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();

  @override
  void initState() {
    Provider.of<ApplicationState>(context, listen: false);
    super.initState();
  }

  @override
  void dispose() {
    emailTextController.dispose();
    passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _applicationLogin = Provider.of<ApplicationState>(context);

    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: TextFormField(
              controller: emailTextController,
              decoration: InputDecoration(
                icon: Icon(
                  Icons.email,
                  color: oliveGreen,
                ),
                labelText: 'Email',
              ),
              keyboardType: TextInputType.emailAddress,
              validator: _applicationLogin.validateEmail,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: passwordTextController,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.lock,
                          color: oliveGreen,
                        ),
                        labelText: 'Password',
                      ),
                      obscureText: _applicationLogin.isPasswordObscured,
                      obscuringCharacter: '■',
                      keyboardType: TextInputType.emailAddress,
                      validator: _applicationLogin.validatePassword,
                    ),
                  ),
                  IconButton(
                    icon: _applicationLogin.isPasswordObscured
                        ? Icon(
                            FluentIcons.eye_hide_24_filled,
                            color: oliveGreen,
                          )
                        : Icon(
                            FluentIcons.eye_show_24_filled,
                            color: oliveGreen,
                          ),
                    onPressed: () {
                      _applicationLogin.showPassword();
                      //_loginViewModel.showPassword();
                    },
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          GradientButton(
            width: MediaQuery.of(context).size.width * 0.5,
            height: 50.0,
            text: 'Login',
            onPressed: () {
              if (_formKey.currentState!.validate() &&
                  _applicationLogin.loginState ==
                      ApplicationLoginState.password) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('The username already exists')),
                );
                return;
              } else if (_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Logging in')),
                );
                _applicationLogin.signInWithEmailAndPassword(
                    emailTextController.text, passwordTextController.text, (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${e.message.toString()}')),
                  );
                });
              }
            },
          ),
          SizedBox(height: 20),
          GradientButton(
            width: MediaQuery.of(context).size.width * 0.5,
            height: 50.0,
            text: 'Sign Up',
            onPressed: () {
              Navigator.pushNamed(context, RegisterScreen.routeName);
            },
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 18.0),
            child: TextButton(
              child: Text(
                'Forgot password?',
                style: TextStyle(
                    color: kombuGreen,
                    fontWeight: FontWeight.w500,
                    fontSize: 18),
              ),
              onPressed: () {},
            ),
          ),
          TextButton(
            child:
                _applicationLogin.loginState == ApplicationLoginState.loggedIn
                    ? Text(
                        'Use as Guest - Logged In',
                        style: TextStyle(
                            color: kombuGreen,
                            fontWeight: FontWeight.w800,
                            fontSize: 18,
                            letterSpacing: 1.1),
                      )
                    : Text('Use as Guest - Logged Out',
                        style: TextStyle(
                            color: kombuGreen,
                            fontWeight: FontWeight.w800,
                            fontSize: 18,
                            letterSpacing: 1.1)),
            onPressed: () {
              _applicationLogin.signOut();
              // Navigator.pushNamed(context, MainScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
