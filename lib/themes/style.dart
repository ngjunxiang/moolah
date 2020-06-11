import 'package:flutter/material.dart';
import 'package:tinycolor/tinycolor.dart';

ThemeData appTheme() {
  final primaryColor = TinyColor(Colors.teal).darken(15).color;
  final accentColor = TinyColor(Colors.teal).lighten(15).color;
  final scaffoldBackgroundColor = TinyColor(Colors.white).darken(10).color;

  return ThemeData(
    primaryColor: primaryColor,
    accentColor: accentColor,
    hintColor: Colors.white,
    dividerColor: Colors.white,
    buttonColor: Colors.white,
    scaffoldBackgroundColor: scaffoldBackgroundColor,
    canvasColor: Colors.black,
    fontFamily: 'RobotoCondensed',
    textTheme: TextTheme(
      bodyText1: const TextStyle(
        color: Colors.black,
        fontSize: 14,
      ),
      button: const TextStyle(
        color: Colors.white,
        fontSize: 18,
      ),
      headline1: const TextStyle(
        color: Colors.black,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      subtitle1: TextStyle(
        // NavBar
        fontSize: 12,
      ),
    ),
  );
}
