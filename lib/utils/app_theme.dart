import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primarySwatch: Colors.purple,
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'Montserrat',
      textTheme: const TextTheme(
        bodyText1: TextStyle(
          fontSize: 18,
        ),

        bodyText2: TextStyle(
          fontSize: 16,
        ),
      )

    );
  }
}