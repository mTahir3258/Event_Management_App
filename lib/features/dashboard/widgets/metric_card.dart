import 'package:flutter/material.dart';
import 'package:ui_specification/core/theme/app_colors.dart';
import 'package:ui_specification/core/theme/app_dimensions.dart';
import 'package:ui_specification/core/widgets/custom_card.dart';

/// Metric card widget for dashboard
class MetricCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final String subtitle;
  final Color? iconColor;
  final Color? highlightColor;
  final VoidCallback? onTap;

  const MetricCard({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    required this.subtitle,
    this.iconColor,
    this.highlightColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // Use smaller padding on desktop/tablet for more compact cards
    final isDesktopOrTablet = MediaQuery.of(context).size.width > 600;
    final cardPadding = isDesktopOrTablet
        ? AppDimensions.spacing6
        : AppDimensions.spacing8;

    return CustomCard(
      onTap: onTap,
      padding: EdgeInsets.all(cardPadding), // Responsive padding
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(AppDimensions.spacing8),
                decoration: BoxDecoration(
                  color: (iconColor ?? AppColors.primary).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(
                    AppDimensions.radiusMedium,
                  ),
                ),
                child: Icon(
                  icon,
                  color: iconColor ?? AppColors.primary,
                  size: 16, // Further reduced from 20 for more compact design
                ),
              ),
              const Spacer(),
              if (highlightColor != null)
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: highlightColor,
                    shape: BoxShape.circle,
                  ),
                ),
            ],
          ),
          const SizedBox(
            height: AppDimensions.spacing4,
          ), // Further reduced from spacing8
          Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: AppColors.textSecondary),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            height: AppDimensions.spacing2,
          ), // Further reduced from spacing4
          Text(
            value,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ), // Changed from headlineMedium to headlineSmall for more compact design
          ),
          const SizedBox(
            height: AppDimensions.spacing2,
          ), // Further reduced from spacing4
          Text(
            subtitle,
            style: Theme.of(context).textTheme.bodySmall,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
