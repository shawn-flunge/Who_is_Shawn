


import 'package:flutter/material.dart';

class ExperienceContentWidget extends StatelessWidget {
  final String title;
  final String period;
  final String content;

  const ExperienceContentWidget({
    required this.title,
    required this.period,
    required this.content,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: const TextStyle(
            fontFamily: 'Gothic_A1',
            fontSize: 20,
            fontWeight: FontWeight.w500
          ),
        ),
        Text(
          period,
          style: const TextStyle(
            fontFamily: 'Gothic_A1',
            fontSize: 16,
          ),
        ),
        Text(
          content,
          style: const TextStyle(
            fontFamily: 'Gothic_A1',
          ),
        )
      ],
    );
  }
}