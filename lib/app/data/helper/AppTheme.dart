import 'package:flutter/material.dart';

class AppTheme {
  Color colorPrimary = Color(0xFF1D976C);
  Color colorSecondary = Color(0xFF22704A);
  Color colorAccent = Color(0xFFE5E5CA);
  Color colorBackground = Color(0xFFF3F2F2);

  ThemeData themeData() {
    return ThemeData(
      primaryColor: colorPrimary,
      accentColor: colorAccent,
      backgroundColor: colorBackground,
      splashColor: colorBackground,
      fontFamily: 'PNU',
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(textStyle: TextStyle(fontSize: 24))),
      buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        minWidth: 250,
        buttonColor: colorPrimary,
        padding: EdgeInsets.all(10),
        textTheme: ButtonTextTheme.primary,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(colorPrimary),
      )),
      textTheme: TextTheme(
        headline1: TextStyle(fontSize: 36),
        caption: TextStyle(fontSize: 24),
        bodyText1: TextStyle(fontSize: 12),
      ),
    );
  }
}
