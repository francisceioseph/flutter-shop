import 'package:flutter/material.dart';

final kAppDarkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryTextTheme: TextTheme(
    title: TextStyle(
      fontFamily: 'BellotaText',
      fontWeight: FontWeight.w700,
    ),
    subtitle: TextStyle(
      fontFamily: 'BellotaText',
      fontWeight: FontWeight.w700,
    ),
    headline: TextStyle(
      fontFamily: 'BellotaText',
      fontWeight: FontWeight.w700,
    ),
    body1: TextStyle(
      fontFamily: 'BellotaText',
      fontWeight: FontWeight.normal,
    ),
    button: TextStyle(
      fontFamily: 'BellotaText',
      fontWeight: FontWeight.w700,
    ),
  ),
  accentTextTheme: TextTheme(
    title: TextStyle(
      fontFamily: 'BellotaText',
      fontWeight: FontWeight.w700,
    ),
    subtitle: TextStyle(
      fontFamily: 'BellotaText',
      fontWeight: FontWeight.w700,
    ),
    headline: TextStyle(
      fontFamily: 'BellotaText',
      fontWeight: FontWeight.w700,
    ),
    body1: TextStyle(
      fontFamily: 'BellotaText',
      fontWeight: FontWeight.normal,
    ),
    button: TextStyle(
      fontFamily: 'BellotaText',
      fontWeight: FontWeight.w700,
    ),
  ),
  buttonTheme: ButtonThemeData(
    textTheme: ButtonTextTheme.primary,
  ),
  tabBarTheme: TabBarTheme(
    labelStyle: TextStyle(
      fontFamily: 'BellotaText',
    ),
    unselectedLabelStyle: TextStyle(
      fontFamily: 'BellotaText',
    ),
  ),
  snackBarTheme: SnackBarThemeData(
    contentTextStyle: TextStyle(
      fontFamily: 'BellotaText',
      color: Colors.black,
    ),
  ),
);
