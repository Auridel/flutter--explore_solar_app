import 'dart:async';

import 'package:explore_solar_app/models/planet.dart';
import 'package:explore_solar_app/providers/planet_provider.dart';
import 'package:explore_solar_app/screens/planet_details_screen.dart';
import 'package:explore_solar_app/slide_bloc/slide_bloc.dart';
import 'package:explore_solar_app/widgets/slider_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlanetSlider extends StatefulWidget {
  const PlanetSlider({Key? key}) : super(key: key);

  @override
  _PlanetSliderState createState() => _PlanetSliderState();
}

class _PlanetSliderState extends State<PlanetSlider> {
  final _sliderController = PageController(viewportFraction: .45);
  final _slideBloc = SlideBloc.getInstance();
  late final List<Planet> _planets;
  late StreamSink<int> _slideSink;
  double _currentPage = 0;

  void _sliderListener() {
    setState(() {
      _currentPage = _sliderController.page ?? 0;
      _slideSink.add(_sliderController.page?.toInt() ?? 0);
    });
  }

  @override
  void initState() {
    _sliderController.addListener(_sliderListener);
    _slideSink = _slideBloc.slideSink;
    _planets = Provider.of<PlanetProvider>(context, listen: false).items;
    super.initState();
  }

  @override
  void dispose() {
    _sliderController.removeListener(_sliderListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      clipBehavior: Clip.none,
      width: size.width,
      height: 400,
      child: PageView.builder(
        controller: _sliderController,
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, idx) {
          final res = idx - _currentPage;
          final value = -0.4 * res + 1;
          final opacity = ((res + 1) + 0.3).clamp(0.0, 1.0);
          final scale = (_currentPage - idx + 1).clamp(0.97, 1.0);
          return GestureDetector(
            onTap:() {
              Navigator.of(context).pushNamed(PlanetDetailsScreen.routeName,
                  arguments: _planets[idx]);
            },
            child: Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.05)
                ..translate(
                    size.width * 1.1 * (1 - value).abs(), res * -25, res.abs())
                ..scale(scale),
              child: Opacity(
                opacity: opacity,
                child: SliderCard(
                  planet: _planets[idx],
                ),
              ),
            ),
          );
        },
        itemCount: _planets.length,
        onPageChanged: (value) {
          _sliderController.animateToPage(value,
              duration: Duration(milliseconds: 220), curve: Curves.easeInOut);
        },
      ),
    );
  }
}
