//ignore_for_file: prefer_const_constructors, depend_on_referenced_packages,avoid_print

import 'package:flutter/material.dart';

///@author  fansan
///@version 2023/10/30
///@des     my_theme

class MyTheme {
  static const double smallFont = 12;
  static const double middleFont = 14;
  static const double largeFont = 16;

  static final ThemeData norTheme = ThemeData(
    useMaterial3: true,
    primaryColor: Colors.lightBlueAccent,
    scaffoldBackgroundColor: Colors.white,
    cardColor: Colors.white70,
    primaryColorDark: Colors.blue[700],
    dividerColor: Colors.black,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
    textTheme: TextTheme(
      bodySmall: TextStyle(fontSize: smallFont, color: Colors.black87),
      bodyMedium: TextStyle(fontSize: middleFont, color: Colors.black87),
      bodyLarge: TextStyle(fontSize: largeFont, color: Colors.black87),
      labelLarge: TextStyle(fontSize: largeFont, color: Colors.black45),
      titleMedium: TextStyle(fontSize: smallFont,color: Colors.black54)
    ),
  );

  static final ThemeData dart = ThemeData(
    useMaterial3: true,
    primaryColor: Color(0xff333333),
    scaffoldBackgroundColor: Colors.black,
    cardColor: Color(0xff252525),
    primaryColorDark: Colors.blueGrey[600],
    dividerColor: Colors.white,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
    textTheme: TextTheme(
      bodySmall: TextStyle(fontSize: smallFont, color: Colors.white70),
      bodyMedium: TextStyle(fontSize: middleFont, color: Colors.white70),
      bodyLarge: TextStyle(fontSize: largeFont, color: Colors.white70),
      labelLarge: TextStyle(fontSize: largeFont, color: Colors.white),
      titleMedium: TextStyle(fontSize: middleFont,color: Colors.white54),
    ),
  );
}
