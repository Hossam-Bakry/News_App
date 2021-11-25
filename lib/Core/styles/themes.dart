import 'package:flutter/material.dart';

class MyTheme {
  static const primaryColor = Color.fromRGBO(57, 165, 82, 1.0);

  static ThemeData lightThem = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 22,
      ),
      elevation: 0,
    ),
  );
}
