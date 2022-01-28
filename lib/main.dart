import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ultimate_tasbih_app/services/authentication.dart';
import 'package:ultimate_tasbih_app/services/const.dart';
import 'package:ultimate_tasbih_app/services/routes.dart';
import 'package:provider/provider.dart';
import 'package:get_it/get_it.dart';

import 'manager/data_manager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isAndroid || Platform.isIOS) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  GetIt.I.registerSingleton<DataManager>(DataManager());

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
              shadowColor: kombuGreen,
              highlightColor: fawn,
              fontFamily: GoogleFonts.didactGothic().fontFamily,
              colorScheme:
                  ColorScheme.fromSwatch().copyWith(secondary: oliveGreen)),
          onGenerateRoute: _appRoutes.onGenerateRoute,
        ),
      ),
    ]);
  }
}
