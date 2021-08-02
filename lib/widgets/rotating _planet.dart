import 'dart:math';

import 'package:flutter/material.dart';

class RotatingPlanet extends StatefulWidget {
  final Size _size;
  final Color _color;
  final double _radius;
  final Duration _duration;

  RotatingPlanet(this._size, this._color, this._radius, this._duration);

  @override
  _RotatingPlanetState createState() => _RotatingPlanetState();
}

class _RotatingPlanetState extends State<RotatingPlanet>
    with SingleTickerProviderStateMixin {
  late final AnimationController _rotationController;
  late final Animation<double> _rotationAnimation;

  @override
  void initState() {
    _rotationController =
        AnimationController(vsync: this, duration: widget._duration)..repeat();
    _rotationAnimation =
        Tween(begin: 0.0, end: 360.0).animate(_rotationController);
    super.initState();
  }

  Offset _calculate(double value, double radius) {
    double radians = value * (pi / 180);
    double dx = radius * cos(radians);
    double dy = radius * sin(radians);
    return Offset(dx, dy);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Positioned(
            top: _calculate(_rotationAnimation.value, widget._radius).dy +
                widget._size.height / 2,
            left: _calculate(_rotationAnimation.value, widget._radius).dx +
                widget._size.width / 2,
            child: Container(
              decoration: BoxDecoration(
                  color: widget._color,
                  borderRadius: BorderRadius.circular(10)),
              width: 10,
              height: 10,
            ),
          )
        ],
      ),
    );
  }
}
