import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ultimate_tasbih_app/screens/login/login_screen.dart';
import '../services/authentication.dart';
import 'counter_screen/counter_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);
  static const String routeName = '/';

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    Provider.of<ApplicationState>(context, listen: false);
    super.initState();
  }

//TODO: IMPLEMENT A WAY TO ROUTE WHICH SCREEN TO DISPLAY
  @override
  Widget build(BuildContext context) {
    var _applicationState = Provider.of<ApplicationState>(context);
    // switch (_applicationState.loginState) {
    //   case (ApplicationLoginState.loggedIn):
    //     Navigator.pushReplacementNamed(context, MainScreen.routeName);
    //     break;
    //   case (ApplicationLoginState.loggedOut):
    //     Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    //     break;
    //   case ApplicationLoginState.emailAddress:
    //     Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    //     break;
    //   case ApplicationLoginState.register:
    //     Navigator.pushReplacementNamed(context, RegisterScreen.routeName);
    //     break;
    //   case ApplicationLoginState.password:
    //     Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    //     break;
    //   case ApplicationLoginState.loggedInAnonymous:
    //     Navigator.pushReplacementNamed(context, MainScreen.routeName);
    //     break;
    //   case ApplicationLoginState.reset:
    //     Navigator.pushReplacementNamed(context, ForgotPasswordScreen.routeName);
    //     break;
    // }

    return FutureBuilder(
        future: _applicationState.getCurrentUser(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print('${snapshot.data} + ${snapshot.hasData}');
            return CounterScreen();
          } else if (!snapshot.hasData) {
            print('${snapshot.data} + ${snapshot.hasData}');
            return LoginScreen();
          } else
            return LoginScreen();
        });
  }
}
