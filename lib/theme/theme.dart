import 'package:flutter/material.dart';

final theme = ThemeData(
  primarySwatch: Colors.blue,
  primaryTextTheme: TextTheme(
    headline6: TextStyle(
      color: Colors.black12,
      fontSize: 105,
      fontWeight: FontWeight.w900,
    ),
    headline5: TextStyle(
      color: Color(0xff41496d),
      fontSize: 22,
      fontWeight: FontWeight.w700,
    ),
    headline4: TextStyle(
      color: Colors.white70,
      fontSize: 13,
    ),
    headline3: TextStyle(
      fontSize: 15,
      color: Color(0xff41496d),
    ),
    headline2: TextStyle(
      color: Color(0xfff2b4b7),
      fontSize: 12,
    ),
  ),
  textTheme: TextTheme(
    headline6: TextStyle(
      color: Colors.white,
      fontSize: 22,
      fontWeight: FontWeight.w700,
    ),
    headline5: TextStyle(
      color: Color(0xff44496f),
      fontSize: 28,
      fontWeight: FontWeight.w700,
    ),
    headline4: TextStyle(
      color: Color(0xff44496f),
      fontSize: 13,
    ),
    headline3: TextStyle(
      color: Color(0xff44496f),
      fontSize: 12
    )
  )
);