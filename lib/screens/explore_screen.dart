import 'package:explore_solar_app/slide_bloc/slide_bloc.dart';
import 'package:explore_solar_app/widgets/dots_navigation.dart';
import 'package:explore_solar_app/widgets/explore_header.dart';
import 'package:explore_solar_app/widgets/planet_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExploreScreen extends StatefulWidget {
  static final routeName = '/explore';

  const ExploreScreen({Key? key}) : super(key: key);

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  void dispose() {
    SlideBloc.destroy();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: AnnotatedRegion(
        value: SystemUiOverlayStyle(
          systemNavigationBarColor: Color(0xff8a59b4), // navigation bar color
          statusBarColor: Color(0xff194fa5),
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarIconBrightness: Brightness.light,
        ),
        child: SafeArea(
          child: Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Color(0xff194fa5),
                  Color(0xff8a59b4),
                ])),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ExploreHeader(),
                  PlanetSlider(),
                  DotsNavigation(9),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
