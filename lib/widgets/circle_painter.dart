import 'package:flutter/material.dart';

class CirclePainter extends CustomPainter {
  final double radius;

  CirclePainter(this.radius);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black.withOpacity(0.1)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    canvas.drawCircle(Offset(0.0, 0.0), radius, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
