import 'package:flutter/material.dart';
import 'package:tinycolor/tinycolor.dart';

ThemeData appTheme() {
  final color1 = TinyColor.fromString('#28587B');
  final color2 = TinyColor.fromString('#9FB4C7');
  final color3 = TinyColor.fromString('#9FB798');
  final color4 = TinyColor.fromString('#EEEEFF');

  final primaryColor = color1.darken(10).color;
  final accentColor = color2.darken(5).color;
  final focusColor = color2.darken(15).color;
  final scaffoldBackgroundColor = color4.color;
  final canvasColor = color4.color;
  final splashColor = color1.darken(5).color;
  final buttonColor = color2.darken(5).color;
  final dividerColor = TinyColor(Colors.grey).darken(10).color;

  return ThemeData(
    primaryColor: primaryColor,
    accentColor: accentColor,
    hintColor: Colors.white,
    focusColor: focusColor,
    dividerColor: dividerColor,
    buttonColor: buttonColor,
    scaffoldBackgroundColor: scaffoldBackgroundColor,
    splashColor: splashColor,
    canvasColor: canvasColor,
    fontFamily: 'RobotoCondensed',
    textTheme: TextTheme(
      bodyText1: const TextStyle(
        color: Colors.black,
        fontSize: 14,
      ),
      button: TextStyle(
        color: primaryColor,
        fontSize: 18,
      ),
      headline1: const TextStyle(
        color: Colors.black,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      headline2: TextStyle(
        color: TinyColor(primaryColor).darken(5).color,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      subtitle1: TextStyle(
        // NavBar
        fontSize: 12,
      ),
    ),
  );
}
