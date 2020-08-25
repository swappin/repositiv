import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Modular.navigatorKey,
      title: 'Repositiv',
      theme: ThemeData(
        primaryColor: Color(0xFFF79F1F),
        brightness: Brightness.light,
        accentColor: Color(0xFFFFE1B5),
        fontFamily: 'Poppins',
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          headline2: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          headline3: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color:  Color(0xFFFFE1B5),
          ),
          headline4: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF9C620E),
          ),
          subtitle1: TextStyle(
            fontSize: 14,
            color: Color(0xFF777777),
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
