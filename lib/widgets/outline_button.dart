import 'package:flutter/material.dart';

class OutlinedPrimaryButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Color borderColor;
  final Color textColor;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final double borderWidth;

  const OutlinedPrimaryButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.borderColor = Colors.blue,
    this.textColor = Colors.blue,
    this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    this.borderRadius = 8.0,
    this.borderWidth = 2.0,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: textColor,
        side: BorderSide(color: borderColor, width: borderWidth),
        padding: padding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      child: Text(title),
    );
  }
}
