import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final bool? obscureText;
  final int? hoverColor;
  final bool? isPasswordField;

  const MyTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscureText,
      required this.hoverColor,
      required this.isPasswordField});

  @override
  State<MyTextField> createState() => _MyTextFieldWidgetState();
}

class _MyTextFieldWidgetState extends State<MyTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: SizedBox(
          height: 50,
          child: TextField(
            controller: widget.controller,
            obscureText: widget.isPasswordField == true ? _obscureText : false,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Color(0XFF2B2B2E), width: 1.8),
                  borderRadius: BorderRadius.circular(30),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color(widget.hoverColor ?? 0xFF2B2B2E),
                        width: 1.8),
                    borderRadius: BorderRadius.circular(30)),
                hintText: widget.hintText,
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  child: widget.isPasswordField == true
                      ? Icon(
                          _obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: _obscureText == false
                              ? Color(widget.hoverColor ?? 0xFF2B2B2E)
                              : Colors.grey,
                        )
                      : const Text(""),
                )),
          )),
    );
  }
}
