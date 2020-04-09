import 'package:flutter/material.dart';

final kAppLightTheme = ThemeData(
  brightness: Brightness.light,
  appBarTheme: AppBarTheme(
    textTheme: TextTheme(
      title: TextStyle(
        fontFamily: 'BellotaText',
        fontWeight: FontWeight.w700,
        fontSize: 24,
        color: Colors.white,
      ),
    ),
  ),
  primaryTextTheme: TextTheme(
    title: TextStyle(
      fontFamily: 'BellotaText',
      fontWeight: FontWeight.w700,
      color: Colors.black87,
    ),
    subtitle: TextStyle(
      fontFamily: 'BellotaText',
      fontWeight: FontWeight.w700,
      color: Colors.black87,
    ),
    subhead: TextStyle(
      fontFamily: 'BellotaText',
      fontWeight: FontWeight.w700,
      color: Colors.black87,
    ),
    headline: TextStyle(
      fontFamily: 'BellotaText',
      fontWeight: FontWeight.w700,
      color: Colors.black87,
    ),
    body1: TextStyle(
      fontFamily: 'BellotaText',
      fontWeight: FontWeight.normal,
      color: Colors.black87,
    ),
    button: TextStyle(
      fontFamily: 'BellotaText',
      fontWeight: FontWeight.w700,
      color: Colors.blue,
    ),
  ),
  accentTextTheme: TextTheme(
    title: TextStyle(
      fontFamily: 'BellotaText',
      fontWeight: FontWeight.w700,
      color: Colors.blue,
    ),
    subtitle: TextStyle(
      fontFamily: 'BellotaText',
      fontWeight: FontWeight.w700,
      color: Colors.blue,
    ),
    headline: TextStyle(
      fontFamily: 'BellotaText',
      fontWeight: FontWeight.w700,
      color: Colors.blue,
    ),
    body1: TextStyle(
      fontFamily: 'BellotaText',
      fontWeight: FontWeight.normal,
      color: Colors.blue,
    ),
    button: TextStyle(
      fontFamily: 'BellotaText',
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
  ),
  buttonTheme: ButtonThemeData(
    textTheme: ButtonTextTheme.primary,
  ),
  tabBarTheme: TabBarTheme(
    labelStyle: TextStyle(
      fontFamily: 'BellotaText',
      color: Colors.blue,
    ),
    unselectedLabelStyle: TextStyle(
      fontFamily: 'BellotaText',
    ),
  ),
  snackBarTheme: SnackBarThemeData(
    contentTextStyle: TextStyle(
      fontFamily: 'BellotaText',
      color: Colors.white,
    ),
  ),
);
