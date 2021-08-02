import 'dart:ui';

import 'package:explore_solar_app/providers/planet_provider.dart';
import 'package:explore_solar_app/widgets/planet_circle.dart';
import 'package:explore_solar_app/widgets/rotating%20_planet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final AnimationController _glowController;
  late final Animation<double> _glowAnimation;

  final List<int> dummyList = List.generate(8, (index) => index + 1);

  @override
  void initState() {
    _glowController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 1500))
          ..repeat(reverse: true)
          ..addListener(() {
            setState(() {});
          });
    _glowAnimation = Tween(begin: 10.0, end: 0.0).animate(_glowController);
    super.initState();
  }

  @override
  void dispose() {
    _glowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final planets = Provider.of<PlanetProvider>(context, listen: false).items;
    final size = MediaQuery.of(context).size;
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: Color(0xff8a59b4), // navigation bar color
        statusBarColor: Color(0xff194fa5),
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      child: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Color(0xff194fa5),
                Color(0xff8a59b4),
              ])),
          width: size.width,
          height: size.height,
          child: Stack(
            clipBehavior: Clip.hardEdge,
            fit: StackFit.expand,
            children: [
              Center(
                child: Container(
                  decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                    BoxShadow(
                      color: Colors.orange,
                      blurRadius: 40,
                      spreadRadius: _glowAnimation.value,
                    )
                  ]),
                  child: Hero(
                    tag: planets[0].image,
                    child: Image.asset(
                      'assets/images/sun_img.png',
                      width: 100,
                    ),
                  ),
                ),
              ),
              ...dummyList
                  .map((e) => PlanetCircle(size, e * 50.0 + 50))
                  .toList(),
              ...dummyList
                  .map(
                    (e) => RotatingPlanet(
                        size,
                        Color((e * 0.05 * 0xFFFFFF).toInt()).withOpacity(1.0),
                        (e * 50.0 + 50),
                        Duration(seconds: e * 3)),
                  )
                  .toList(),
            ],
          ),
        ),
      ),
    );
  }
}
