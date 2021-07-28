import 'dart:math';

import 'package:flutter/material.dart';
import 'package:aerium/values/values.dart';

class SkillProgressPainter extends CustomPainter {
  SkillProgressPainter({
    required this.currentProgress,
    this.circleStrokeWidth = Sizes.SIZE_5,
    this.progressArcStrokeWidth = Sizes.SIZE_5,
    this.circleColor = const Color(0xFFB5B8BC),
    this.progressArcColor = const Color(0xFF303E48),
  });

  final double currentProgress;
  final double circleStrokeWidth;
  final Color circleColor;
  final double progressArcStrokeWidth;
  final Color progressArcColor;

  @override
  void paint(Canvas canvas, Size size) {
    //this is base circle
    Paint innerCircle = Paint()
      ..strokeWidth = circleStrokeWidth
      ..color = circleColor
      ..style = PaintingStyle.stroke;

    Paint completeArc = Paint()
      ..strokeWidth = progressArcStrokeWidth
      ..color = progressArcColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2) - 10;

    canvas.drawCircle(
        center, radius, innerCircle); // this draws main outer circle

    double angle = 2 * pi * (currentProgress / 100);

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        angle, false, completeArc);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
