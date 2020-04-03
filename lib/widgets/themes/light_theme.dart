import 'package:flutter/material.dart';

final _lightTheme = ThemeData.light();

final kAppLightTheme = _lightTheme.copyWith(
  appBarTheme: AppBarTheme(
    textTheme: TextTheme(
      title: _lightTheme.primaryTextTheme.title.copyWith(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 22,
      ),
    ),
  ),
  primaryTextTheme: _lightTheme.primaryTextTheme.copyWith(
    title: _lightTheme.primaryTextTheme.title.copyWith(
      color: Colors.black,
    ),
    subhead: _lightTheme.primaryTextTheme.subhead.copyWith(
      color: Colors.black,
    ),
    subtitle: _lightTheme.primaryTextTheme.subtitle.copyWith(
      color: Colors.black,
    ),
    body1: _lightTheme.primaryTextTheme.subtitle.copyWith(
      color: Colors.black,
    ),
    body2: _lightTheme.primaryTextTheme.subtitle.copyWith(
      color: Colors.black,
    ),
  ),
);
