import 'package:explore_solar_app/helpers/custom_scroll_behavior.dart';
import 'package:explore_solar_app/providers/planet_provider.dart';
import 'package:explore_solar_app/screens/explore_screen.dart';
import 'package:explore_solar_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

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
    return ChangeNotifierProvider.value(
      value: PlanetProvider(),
      child: MaterialApp(
        theme: theme,
        scrollBehavior: CustomScrollBehavior(),
        debugShowCheckedModeBanner: false,
        home: ExploreScreen(),
      ),
    );
  }
}
