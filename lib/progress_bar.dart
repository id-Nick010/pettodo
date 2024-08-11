// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar(
      {super.key,
      required this.width,
      required this.height,
      required this.progress});
  final double width;
  final double height;
  final double progress;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width + 80.0,
      height: height + 15,
      padding: EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        color: Color(0XFFFFFAF0),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Color(0XFF2B2B2E), width: 1.8),
      ),
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            width: (width + 80) * progress,
            height: height + 10,
            decoration: BoxDecoration(
                color: Color(0XFFAED6B8),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Color(0XFF2B2B2E), width: 1.3)),
          ),
          Align(
              alignment: Alignment.center,
              child: Text(
                '${(progress * 100).toInt()}%',
                style: const TextStyle(
                  color: Color(0XFF2B2B2E),
                  fontWeight: FontWeight.bold,
                ),
              ))
        ],
      ),
    );
  }
}
