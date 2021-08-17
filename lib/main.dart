import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ultimate_tasbih_app/services/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppRoutes _appRoutes = AppRoutes();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ultimate Tasbih',
      theme: ThemeData(
          primarySwatch: Colors.grey,
          fontFamily: GoogleFonts.didactGothic().fontFamily),
      onGenerateRoute: _appRoutes.onGenerateRoute,
    );
  }
}
