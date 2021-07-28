import 'dart:async';

import 'package:explore_solar_app/slide_bloc/slide_bloc.dart';
import 'package:flutter/material.dart';

class PlanetSlider extends StatefulWidget {
  const PlanetSlider({Key? key}) : super(key: key);

  @override
  _PlanetSliderState createState() => _PlanetSliderState();
}

class _PlanetSliderState extends State<PlanetSlider> {
  final _sliderController = PageController(viewportFraction: 1);
  final _slideBloc = SlideBloc.getInstance();
  late StreamSink<int> _slideSink;
  double _currentPage = 0;

  final list = List.generate(9, (index) => index);

  void _sliderListener() {
    _currentPage = _sliderController.page ?? 0;
    _slideSink.add(_sliderController.page?.toInt() ?? 0);
  }

  @override
  void initState() {
    _sliderController.addListener(_sliderListener);
    _slideSink = _slideBloc.slideSink;
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
      width: size.width,
      height: 350,
      child: PageView.builder(
        controller: _sliderController,
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, idx) {
          return Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            children: [
              Container(
                width: size.width,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 70),
                  child: Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Text('${list[idx]}'),
                  ),
                ),
              ),
              Positioned(child: Image.asset('assets/images/earth_img.png', width: 250,), top: 0,),
            ],
          );
        },
        itemCount: list.length,
        onPageChanged: (value) {
          _sliderController.animateToPage(value,
              duration: Duration(milliseconds: 150), curve: Curves.easeInOut);
        },
      ),
    );
  }
}
