import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:ultimate_tasbih_app/services/authentication.dart';
import 'package:ultimate_tasbih_app/services/const.dart';
import 'package:ultimate_tasbih_app/widgets/gradient_button.dart';
import 'package:provider/provider.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);
  static const String routeName = 'registerForm';

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController displayTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();

  @override
  void initState() {
    // Provider.of<ApplicationState>(context, listen: false);
    super.initState();
  }

  @override
  void dispose() {
    emailTextController.dispose();
    passwordTextController.dispose();
    displayTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var _applicationLogin = Provider.of<ApplicationState>(context);
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: TextFormField(
              controller: displayTextController,
              decoration: InputDecoration(
                icon: Icon(
                  FluentIcons.leaf_three_20_filled,
                  color: oliveGreen,
                ),
                labelText: 'Display Name',
              ),
              keyboardType: TextInputType.text,
              validator: _applicationLogin.validateDisplayName,
            ),
          ),
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
            text: 'Register',
            onPressed: () async {
              await _applicationLogin.registerAccount(emailTextController.text,
                  passwordTextController.text, displayTextController.text, (e) {
                _applicationLogin.showSnackBar(context, e.message.toString());
              });
              if (_applicationLogin.loginState ==
                  ApplicationLoginState.register) {
                _applicationLogin.showSnackBar(context,
                    'Registered new account ${emailTextController.text}. An email verification has been sent to this address');
                emailTextController.clear();
                displayTextController.clear();
                passwordTextController.clear();
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
    );
  }
}
