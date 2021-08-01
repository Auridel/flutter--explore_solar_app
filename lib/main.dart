import 'package:explore_solar_app/helpers/custom_scroll_behavior.dart';
import 'package:explore_solar_app/providers/planet_provider.dart';
import 'package:explore_solar_app/screens/explore_screen.dart';
import 'package:explore_solar_app/screens/planet_details_screen.dart';
import 'package:explore_solar_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
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
        routes: {
          ExploreScreen.routeName: (ctx) => ExploreScreen(),
          PlanetDetailsScreen.routeName: (ctx) => PlanetDetailsScreen(),
        },
      ),
    );
  }
}
