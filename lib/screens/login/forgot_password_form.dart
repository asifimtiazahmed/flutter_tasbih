import 'package:flutter/material.dart';
import 'package:ultimate_tasbih_app/services/authentication.dart';
import 'package:ultimate_tasbih_app/services/const.dart';
import 'package:provider/provider.dart';
import 'package:ultimate_tasbih_app/widgets/gradient_button.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({Key? key}) : super(key: key);
  static const String routeName = 'loginForm';

  @override
  _ForgotPasswordFormState createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailTextController = TextEditingController();

  @override
  void initState() {
    Provider.of<ApplicationState>(context, listen: false);
    super.initState();
  }

  @override
  void dispose() {
    emailTextController.dispose();
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
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 50),
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
          GradientButton(
            width: MediaQuery.of(context).size.width * 0.5,
            height: 50.0,
            text: _applicationLogin.loginState == ApplicationLoginState.reset
                ? 'Back'
                : 'Reset Password',
            onPressed: () async {
              if (_applicationLogin.loginState == ApplicationLoginState.reset) {
                Navigator.of(context).pop();
              }
              if (_formKey.currentState!.validate()) {
                await _applicationLogin.resetPassword(emailTextController.text,
                    (e) {
                  _applicationLogin.showSnackBar(context, e.message.toString());
                });
              }
              if (_applicationLogin.loginState == ApplicationLoginState.reset &&
                  _formKey.currentState!.validate()) {
                _applicationLogin.showSnackBar(context,
                    'A reset link has been sent to ${emailTextController.text}');
                emailTextController.clear();
              }
            },
          ),
        ],
      ),
    );
  }
}
