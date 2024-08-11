import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  final int hoverColor;

  const MyTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscureText,
      required this.hoverColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: SizedBox(
          height: 50,
          child: TextField(
            controller: controller,
            obscureText: obscureText,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Color(0XFF2B2B2E), width: 1.8),
                  borderRadius: BorderRadius.circular(30),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(hoverColor), width: 1.8),
                    borderRadius: BorderRadius.circular(30)),
                hintText: hintText),
          ),
        ));
  }
}
