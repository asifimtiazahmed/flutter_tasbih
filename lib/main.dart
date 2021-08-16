import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ultimate_tasbih_app/screens/login_screen.dart';

import './screens/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ultimate Tasbih',
      theme: ThemeData(
          primarySwatch: Colors.green,
          fontFamily: GoogleFonts.didactGothic().fontFamily),
      home: LoginScreen(),
    );
  }
}
