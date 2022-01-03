import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
  final Color? color;
  final String text1;
  final String text2;
  const Indicator(
      {Key? key, this.color, required this.text1, required this.text2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 13,
          height: 13,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text1,
              style: const TextStyle(
                  height: 3, fontFamily: 'SegoeUI', fontSize: 14),
            ),
            Text(
              text2,
              style: const TextStyle(
                  fontFamily: 'RedHatDisplay',
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
            )
          ],
        )
      ],
    );
  }
}
