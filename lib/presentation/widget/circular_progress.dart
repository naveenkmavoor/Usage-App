import 'package:flutter/material.dart';

import 'package:task/data/convert.dart';
import 'package:task/data/models/screenTime.dart';
import 'package:task/presentation/widget/circle_progress_paint.dart';

class CircularProgress extends StatefulWidget {
  final ScreenTime screenTime;
  final int classTime;
  final int studyTime;
  const CircularProgress({
    Key? key,
    required this.screenTime,
    required this.classTime,
    required this.studyTime,
  }) : super(key: key);

  @override
  _CircularProgressState createState() => _CircularProgressState();
}

class _CircularProgressState extends State<CircularProgress>
    with TickerProviderStateMixin {
  String totalTime = '0h 0m';
  late Animation classProgressAnimation;
  late Animation studyProgressAnimation;
  late AnimationController classProgressController;
  late AnimationController studyProgressController;

  @override
  void initState() {
    //convert total min to h:min format
    totalTime = Convert.convertMtoHM(widget.screenTime.chartData.totalTime);

    //convert classTime in terms of 100 inorder to plot on chart
    final double classProgress = (widget.screenTime.chartData.classTime * 100) /
        widget.screenTime.chartData.totalTime;

    //convert studyTime in terms of 100 inorder to plot on chart
    final double studyProgress = (widget.screenTime.chartData.studyTime * 100) /
        widget.screenTime.chartData.totalTime;

    //animation for class progress
    classProgressController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    classProgressAnimation = Tween<double>(begin: 0, end: classProgress)
        .animate(classProgressController)
      ..addListener(() {
        setState(() {});
      });

    //animation for study progress
    studyProgressController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    studyProgressAnimation = Tween<double>(begin: 0, end: studyProgress)
        .animate(studyProgressController)
      ..addListener(() {
        setState(() {});
      });

    //start the animation
    classProgressController.forward();
    studyProgressController.forward();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      foregroundPainter: CircleProgressPaint(
          classProgressAnimation.value,
          studyProgressAnimation
              .value), // this will add custom painter after child
      child: SizedBox(
        width: 200,
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Total',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'RedHatDisplay')),
            Text(totalTime,
                style: const TextStyle(fontSize: 27, fontFamily: 'SegoeUI')),
          ],
        ),
      ),
    );
  }
}
