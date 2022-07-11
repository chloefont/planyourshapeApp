import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    //1
    return ThemeData(
      //2
      colorScheme: const ColorScheme.light(
        primary: Color(0xFFCE3A3A),
        secondary: Color(0xFFE5E5E5),
        background: Colors.white,
      ),
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'Montserrat', //3
      textTheme: const TextTheme(
          bodyText2: TextStyle(
        color: Colors.black,
      )),
    );
  }
}
