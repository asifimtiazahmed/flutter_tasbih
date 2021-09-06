import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ultimate_tasbih_app/services/authentication.dart';
import 'package:ultimate_tasbih_app/services/const.dart';
import 'package:ultimate_tasbih_app/services/routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppRoutes _appRoutes = AppRoutes();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (_) => ApplicationState(),
        builder: (context, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Ultimate Tasbih',
          theme: ThemeData(
              primaryColor: kombuGreen,
              accentColor: oliveGreen,
              shadowColor: kombuGreen,
              highlightColor: fawn,
              fontFamily: GoogleFonts.didactGothic().fontFamily),
          onGenerateRoute: _appRoutes.onGenerateRoute,
        ),
      ),
    ]);
  }
}
