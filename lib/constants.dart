import 'package:flutter/material.dart';

Color kIndigoBlueColor = Color(0xff436EA0);
Color kIndigoTransparentBlueColor = Color(0x80436EA0);
Color kGreyColor = Color(0xffd4d4d4);

Color kReverseColor = Color(0xffbc915f);
Color kReverseTransparentColor = Color(0x80bc915f);
Color kGreyReverseColor = Color(0xff8f8f8f);

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  visualDensity: VisualDensity(vertical: 0.5, horizontal: 0.5),
  primarySwatch: MaterialColor(
    0xffffffff,
    <int, Color>{
      50: Color(0xffededed),
      100: Color(0xffefefef),
      200: Color(0xfff1f1f1),
      300: Color(0xfff2f2f2),
      400: Color(0xfff4f4f4),
      500: Color(0xfff6f6f6),
      600: Color(0xfff8f8f8),
      700: Color(0xfffafafa),
      800: Color(0xfffbfbfb),
      900: Color(0xffffffff)
    },
  ),
  primaryColor: Color(0xfff6f6f6),
  primaryColorBrightness: Brightness.light,
  primaryColorLight: Color(0xfff1f1f1),
  primaryColorDark: Color(0xfffbfbfb),
  canvasColor: Color(0xfff6f6f6),
  accentColor: kIndigoBlueColor,
  accentColorBrightness: Brightness.light,
  scaffoldBackgroundColor: Color(0xfff6f6f6),
  bottomAppBarColor: Color(0xff6D42CE),
  cardColor: Color(0xfff0f0f0),
  dividerColor: kGreyColor,
  iconTheme: IconThemeData(color: kIndigoBlueColor),
  primaryIconTheme: IconThemeData(
    color: Colors.black,
  ),
  accentIconTheme: IconThemeData(color: kIndigoTransparentBlueColor),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: Colors.black,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: kIndigoBlueColor, foregroundColor: Color(0xfff6f6f6)),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  visualDensity: VisualDensity(vertical: 0.5, horizontal: 0.5),
  primarySwatch: MaterialColor(
    0xFF0f1010,
    <int, Color>{
      50: Color(0xFF1d1f20),
      100: Color(0xFF1a1c1d),
      200: Color(0xFF17191a),
      300: Color(0xFF141616),
      400: Color(0xFF111313),
      500: Color(0xFF0f1010),
      600: Color(0xFF0c0c0d),
      700: Color(0xFF09090a),
      800: Color(0xFF060606),
      900: Color(0xFF030303)
    },
  ),
  primaryColor: Color(0xFF0c0c0d),
  primaryColorBrightness: Brightness.dark,
  primaryColorLight: Color(0xFF17191a),
  primaryColorDark: Color(0xFF060606),
  canvasColor: Color(0xFF0f1010),
  accentColor: kReverseColor,
  accentColorBrightness: Brightness.dark,
  scaffoldBackgroundColor: Color(0xFF171717),
  bottomAppBarColor: Color(0xff6D42CE),
  cardColor: Color(0xFF292929),
  dividerColor: kGreyReverseColor,
  iconTheme: IconThemeData(color: kReverseColor),
  primaryIconTheme: IconThemeData(
    color: Colors.white,
  ),
  accentIconTheme: IconThemeData(color: kReverseTransparentColor),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: Colors.white,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: kReverseColor, foregroundColor: Color(0xFF0c0c0d)),
);

final String kLegalUrl = "https://www.google.com.tr";
