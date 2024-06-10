import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.red,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: TextTheme(
      headline1: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
      bodyText1: TextStyle(fontSize: 16.0),
      bodyText2: TextStyle(fontSize: 12.0),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey[200],
      border: OutlineInputBorder(),
    ),
  );
}
