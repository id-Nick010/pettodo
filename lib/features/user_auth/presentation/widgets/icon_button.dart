import 'package:flutter/material.dart';

class MyIconButton extends StatelessWidget {
  final Function()? onTap;
  final Object iconname;
  final String text;
  final int colorButton;
  final bool onLoading;

  const MyIconButton({
    super.key,
    required this.onTap,
    required this.iconname,
    required this.text,
    required this.colorButton,
      required this.onLoading,
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              onLoading 
              ? const SizedBox(width: 26, height: 26, child: CircularProgressIndicator(color: Color(0XFFFFFAF0)),) 
              :Icon(iconname as IconData?, color: const Color(0XFFFFFAF0)),
              const SizedBox(
                width: 26,
                height: 26,
              ),
             Text(
                text,
                style: const TextStyle(
                  color: Color(0XFFFFFAF0),
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
