

import 'package:flutter/material.dart';

class CircleAndText extends StatelessWidget {
  final Color circleColor;
  final String text;

  const CircleAndText({
    required this.circleColor,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: circleColor
          ),
        ),
        const SizedBox(width: 10,),
        Text(
          text,
          style: const TextStyle(
            fontFamily: 'Gothic_A1',
            fontWeight: FontWeight.w500
          ),
        )
      ],
    );
  }
}