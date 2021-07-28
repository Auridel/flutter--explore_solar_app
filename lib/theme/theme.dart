import 'package:flutter/material.dart';

final theme = ThemeData(
  primarySwatch: Colors.blue,
  primaryTextTheme: TextTheme(
    headline4: TextStyle(
      color: Colors.white70,
      fontSize: 18,
    )
  ),
  textTheme: TextTheme(
    headline6: TextStyle(
      color: Colors.white,
      fontSize: 38,
      fontWeight: FontWeight.w700,
    ),
    headline5: TextStyle(
      color: Color(0xff44496f),
      fontSize: 24,
      fontWeight: FontWeight.w700,
    ),
    headline4: TextStyle(
      color: Color(0xff44496f),
      fontSize: 15,
    ),
    headline3: TextStyle(
      color: Color(0xff44496f),
      fontSize: 12
    )
  )
);