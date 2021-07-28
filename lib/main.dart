import 'package:explore_solar_app/screens/explore_screen.dart';
import 'package:explore_solar_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Color(0xff8a59b4), // navigation bar color
    statusBarColor: Color(0xff194fa5),
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      debugShowCheckedModeBanner: false,
      home: ExploreScreen(),
    );
  }
}
