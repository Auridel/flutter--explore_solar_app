import 'package:flutter/material.dart';

import 'circle_painter.dart';

class PlanetCircle extends StatelessWidget {
  final Size _size;
  final double _radius;

  PlanetCircle(this._size, this._radius);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: _size.height / 2,
      left: _size.width / 2,
      child: CustomPaint(
        painter: CirclePainter(_radius),
      ),
    );
  }
}
