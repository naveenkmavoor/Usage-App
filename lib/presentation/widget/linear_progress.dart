import 'package:flutter/material.dart';
import 'package:task/presentation/widget/linear_progress_paint.dart';

class LinearProgress extends StatelessWidget {
  final double freeTimeProgress;
  const LinearProgress({Key? key, required this.freeTimeProgress})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      foregroundPainter:
          LinearProgressPaint(freeTimeProgress: freeTimeProgress),
    );
  }
}
