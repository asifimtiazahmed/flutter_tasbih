import 'package:flutter/material.dart';
import 'package:ultimate_tasbih_app/screens/login/login_screen.dart';
import 'package:ultimate_tasbih_app/screens/main_screen.dart';
import 'package:ultimate_tasbih_app/screens/register/register_screen.dart';

class AppRoutes {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case LoginScreen.routeName:
        return MaterialPageRoute(builder: (_) => LoginScreen());

      case RegisterScreen.routeName:
        return MaterialPageRoute(builder: (_) => RegisterScreen());

      case MainScreen.routeName:
        return MaterialPageRoute(builder: (_) => MainScreen());

      default:
        return MaterialPageRoute(builder: (_) => MainScreen());
    }
  }
}
