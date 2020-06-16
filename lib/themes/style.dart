import 'package:flutter/material.dart';
import 'package:moolah/models/transaction.dart';
import 'package:tinycolor/tinycolor.dart';

ThemeData appTheme() {
  final color1 = TinyColor.fromString('#28587B');
  final color2 = TinyColor.fromString('#9FB4C7');
  final color3 = TinyColor.fromString('#9FB798');
  final color4 = TinyColor.fromString('#EEEEFF');

  final primaryColor = color1.darken(10).color;
  final accentColor = color2.darken(5).color;
  final focusColor = color2.darken(25).color;
  final hintColor = TinyColor(Colors.grey).lighten(10).color.withOpacity(0.95);
  final scaffoldBackgroundColor = color4.color;
  final canvasColor = color4.color;
  final splashColor = color1.darken(5).color;
  final buttonColor = color2.darken(5).color;
  final dividerColor = TinyColor(Colors.grey).darken(10).color;

  return ThemeData(
    primaryColor: primaryColor,
    accentColor: accentColor,
    hintColor: hintColor,
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



class ExpenseColors {
  static final Map<ExpenseType, Color> expenseColor = {
    ExpenseType.Bills: TinyColor.fromString('#7189bf').color,
    ExpenseType.Food: TinyColor.fromString('#ffc785').darken(5).color,
    ExpenseType.Transportation:TinyColor.fromString('#72d6c9').darken(10).color,
    ExpenseType.Retail:TinyColor.fromString('#df7599').color,
  };

  Color getTypeColor(ExpenseType expenseType) => expenseColor[expenseType];
}
