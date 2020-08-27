import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Modular.navigatorKey,
      title: 'Repositiv',
      theme: ThemeData(
        primaryColor: Color(0xFFF79F1F),
        primaryColorLight: Color(0xFFFFE1B5),
        brightness: Brightness.light,
        accentColor: Color(0xFFEDBD74),

        fontFamily: 'Poppins',
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          headline2: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          headline3: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color:  Color(0xFFFFE1B5),
          ),
          headline4: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: Color(0xFF9C620E),
          ),
          headline5: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: Color(0xFF555555),
          ),
          subtitle1: TextStyle(
            fontSize: 12,
            color: Color(0xFF555555),
          ),
          bodyText1: TextStyle(
            fontSize: 12,
            color: Color(0xFF777777),
            fontWeight: FontWeight.bold,
            fontFamily: 'Quicksand',
          ),
          bodyText2: TextStyle(
            fontSize: 12,
            fontFamily: 'Quicksand',
          ),
        ),
      ),
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
