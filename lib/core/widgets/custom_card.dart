import 'package:flutter/material.dart';
import 'package:ui_specification/core/theme/app_dimensions.dart';

/// Custom card widget with consistent elevation and styling
class CustomCard extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? elevation;

  const CustomCard({
    super.key,
    required this.child,
    this.onTap,
    this.padding,
    this.margin,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation ?? AppDimensions.elevation2,
      margin: margin ?? const EdgeInsets.all(AppDimensions.spacing8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
        child: Padding(
          padding: padding ?? const EdgeInsets.all(AppDimensions.spacing16),
          child: child,
        ),
      ),
    );
  }
}
