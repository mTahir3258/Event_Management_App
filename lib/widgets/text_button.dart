import 'package:flutter/material.dart';

class PrimaryTextButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Color textColor;
  final EdgeInsetsGeometry padding;
  final double fontSize;
  final FontWeight fontWeight;

  const PrimaryTextButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.textColor = Colors.blue,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    this.fontSize = 16,
    this.fontWeight = FontWeight.w500,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: textColor,
        padding: padding,
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
