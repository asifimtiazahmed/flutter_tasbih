import 'package:flutter/material.dart';
import 'package:ultimate_tasbih_app/screens/counter_screen/counter_screen.dart';
import 'package:ultimate_tasbih_app/screens/dua_entry_screen/dua_library_screen.dart';
import 'package:ultimate_tasbih_app/screens/loading_screen.dart';
import 'package:ultimate_tasbih_app/screens/login/forgot_password_screen.dart';
import 'package:ultimate_tasbih_app/screens/login/login_screen.dart';
import 'package:ultimate_tasbih_app/screens/register/register_screen.dart';

class AppRoutes {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case LoadingScreen.routeName:
        return MaterialPageRoute(builder: (_) => LoadingScreen());

      case LoginScreen.routeName:
        return MaterialPageRoute(builder: (_) => LoginScreen());

      case RegisterScreen.routeName:
        return MaterialPageRoute(builder: (_) => RegisterScreen());

      case CounterScreen.routeName:
        return MaterialPageRoute(builder: (_) => CounterScreen());

      case ForgotPasswordScreen.routeName:
        return MaterialPageRoute(builder: (_) => ForgotPasswordScreen());

      case DuaEntryScreen.routeName:
        return MaterialPageRoute(builder: (_) => DuaEntryScreen());

      default:
        return MaterialPageRoute(builder: (_) => CounterScreen());
    }
  }
}
