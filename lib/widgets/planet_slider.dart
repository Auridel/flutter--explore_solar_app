import 'dart:async';

import 'package:explore_solar_app/models/planet.dart';
import 'package:explore_solar_app/providers/planet_provider.dart';
import 'package:explore_solar_app/slide_bloc/slide_bloc.dart';
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
      height: 450,
      child: PageView.builder(
        controller: _sliderController,
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, idx) {
          final res = idx - _currentPage;
          final value = -0.4 * res + 1;
          final opacity = ((res + 1) + 0.3).clamp(0.0, 1.0);
          final scale = (_currentPage - idx + 1).clamp(0.97, 1.0);
          return Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.05)
              ..translate(size.width *1.1 * (1 - value).abs(), res * -25,
                  res.abs())
              ..scale(scale),
            child: Opacity(
              opacity: opacity,
              child: Stack(
                clipBehavior: Clip.none,
                fit: StackFit.expand,
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 20,
                    width: size.width - 30,
                    child: Container(
                      clipBehavior: Clip.none,
                      width: size.width,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 30, right: 30, top: 70, bottom: 100),
                        child: Container(
                          height: 300,
                          width: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: Text('${_planets[idx].name}'),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    child: Image.asset(
                      _planets[idx].image,
                      width: 250,
                    ),
                    top: 0,
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: _planets.length,
        onPageChanged: (value) {
          _sliderController.animateToPage(value,
              duration: Duration(milliseconds: 220),
              curve: Curves.easeInOut);
        },
      ),
    );
  }
}
