import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextButton extends StatelessWidget {
  late String text;
  late double size;
  late Color bgColor;
  final VoidCallback onPressed;

  CustomTextButton(this.text, this.size, this.bgColor, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: bgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 146),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: size,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
