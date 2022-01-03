import 'package:flutter/material.dart';

class LinearProgressPaint extends CustomPainter {
  final double freeTimeProgress;

  LinearProgressPaint({required this.freeTimeProgress});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color(0xFFE4EFFF)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 22;

    Paint paintProgress = Paint()
      ..color = const Color(0xFF2FED51)
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 22;

    canvas.drawLine(Offset(size.width * 1 / 28, size.height * 1 / 2),
        Offset(size.width * 0.97, size.height * 1 / 2), paint);

    canvas.drawLine(
        Offset(size.width * 1 / 28, size.height * 1 / 2),
        Offset(size.width * freeTimeProgress, size.height * 1 / 2),
        paintProgress);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
