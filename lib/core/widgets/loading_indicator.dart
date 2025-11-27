import 'package:flutter/material.dart';
import 'package:ui_specification/core/theme/app_colors.dart';

/// Loading indicator widget
class LoadingIndicator extends StatelessWidget {
  final String? message;
  final bool overlay;

  const LoadingIndicator({super.key, this.message, this.overlay = false});

  @override
  Widget build(BuildContext context) {
    final indicator = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          if (message != null) ...[
            const SizedBox(height: 16),
            Text(message!, style: Theme.of(context).textTheme.bodyMedium),
          ],
        ],
      ),
    );

    if (overlay) {
      return Container(
        color: AppColors.textPrimary.withOpacity(0.3),
        child: indicator,
      );
    }

    return indicator;
  }
}
