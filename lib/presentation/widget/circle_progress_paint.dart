import 'package:flutter/material.dart';
import 'dart:math';

class CircleProgressPaint extends CustomPainter {
  double classTimeProgress;
  double studyTimeProgress;

  CircleProgressPaint(this.classTimeProgress, this.studyTimeProgress);

  @override
  void paint(Canvas canvas, Size size) {
    //this is base circle
    Paint outerCircle = Paint()
      ..strokeWidth = 15
      ..color = const Color(0XFF2FED51).withOpacity(0.76)
      ..style = PaintingStyle.stroke;

    Paint classArc = Paint()
      ..strokeWidth = 15
      ..color = const Color(0xff2D82FE)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Paint studyArc = Paint()
      ..strokeWidth = 15
      ..color = const Color(0xffFF9E57)
      ..style = PaintingStyle.stroke
      ..strokeJoin = StrokeJoin.round
      ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2.4, size.height / 2.4) - 10;

    canvas.drawCircle(
        center, radius, outerCircle); // this draws main outer circle

    double angle = 2 * pi * (classTimeProgress / 100); //class hour progress
    double angle2 = 2 * pi * (studyTimeProgress / 100);

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), 1 + angle,
        angle2, false, studyArc);

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), 1, angle,
        false, classArc);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
