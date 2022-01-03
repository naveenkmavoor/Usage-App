import 'package:flutter/material.dart';
import 'package:task/presentation/styles.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 50,
      decoration: const ShapeDecoration(
        shape: RoundedRectangleBorder(
            side: BorderSide(color: Color(0xFF2F80ED), width: 3),
            borderRadius: BorderRadius.all(Radius.circular(6))),
      ),
      child: const Text(
        'Extend Free-time',
        style: textStyle4,
      ),
    );
  }
}
