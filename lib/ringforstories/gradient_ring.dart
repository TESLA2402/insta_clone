import 'dart:math';

import 'package:flutter/material.dart';

class WGradientRing extends StatelessWidget {
  const WGradientRing(
      {Key? key, required this.width, this.padding = 2.0, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (width != 0) {
      return CustomPaint(
          painter: RingPainter(width),
          child: Container(
              padding: EdgeInsets.all(padding + width), child: child));
    } else {
      return CustomPaint(
          painter: RingPainterWhite(2.0),
          child: Container(padding: EdgeInsets.all(4.0), child: child));
    }
  }

  final double width;
  final double padding;
  final Widget child;
}

class RingPainter extends CustomPainter {
  RingPainter(this.strokeWidth);

  @override
  void paint(Canvas canvas, Size size) {
    final Offset center = Offset(size.width / 2, size.height / 2);
    final double radius = min(size.width, size.height) / 2 - strokeWidth / 2;
    const SweepGradient gradient = SweepGradient(
        colors: <Color>[Colors.purple, Colors.orange, Colors.purple]);

    final Paint brush = Paint()
      ..color = Colors.red
      ..shader = gradient.createShader(Rect.fromCenter(
          center: center, width: size.width, height: size.height))
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    canvas.drawCircle(center, radius, brush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

  final double strokeWidth;
}

class RingPainterWhite extends CustomPainter {
  RingPainterWhite(this.strokeWidth);

  @override
  void paint(Canvas canvas, Size size) {
    final Offset center = Offset(size.width / 2, size.height / 2);
    final double radius = min(size.width, size.height) / 2 - strokeWidth / 2;
    const SweepGradient gradient =
        SweepGradient(colors: <Color>[Colors.grey, Colors.grey, Colors.grey]);

    final Paint brush = Paint()
      ..color = Colors.grey
      ..shader = gradient.createShader(Rect.fromCenter(
          center: center, width: size.width, height: size.height))
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    canvas.drawCircle(center, radius, brush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

  final double strokeWidth;
}
