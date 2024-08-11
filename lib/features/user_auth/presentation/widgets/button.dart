import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final int colorButton;

  const MyButton({
    super.key,
    required this.onTap,
    required this.text,
    required this.colorButton,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.symmetric(horizontal: 40),
        decoration: BoxDecoration(
          color: Color(colorButton),
          borderRadius: BorderRadius.circular(40),
          border: Border.all(color: const Color(0XFF2B2B2E), width: 1.8),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Color(0XFF2B2B2E),
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
