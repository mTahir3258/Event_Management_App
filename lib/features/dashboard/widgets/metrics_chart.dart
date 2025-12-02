import 'package:flutter/material.dart';
import 'package:ui_specification/core/theme/app_colors.dart';
import 'package:ui_specification/core/theme/app_dimensions.dart';
import 'package:ui_specification/core/widgets/custom_card.dart';

/// Simple metrics chart widget for dashboard
class MetricsChart extends StatelessWidget {
  const MetricsChart({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      {'label': 'Today', 'value': 12.0, 'color': AppColors.primary},
      {'label': 'Tomorrow', 'value': 8.0, 'color': AppColors.success},
      {'label': 'This Week', 'value': 25.0, 'color': AppColors.warning},
      {'label': 'Next Week', 'value': 18.0, 'color': AppColors.info},
      {'label': 'This Month', 'value': 45.0, 'color': AppColors.secondary},
      {'label': 'Next Month', 'value': 32.0, 'color': AppColors.primary},
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        // Use all available space
        final availableWidth = constraints.maxWidth;
        final hasConstrainedHeight = constraints.hasBoundedHeight;
        final availableHeight = hasConstrainedHeight
            ? constraints.maxHeight
            : double.infinity;

        // Calculate responsive dimensions based on available space
        final isSmallScreen = availableWidth < 600;

        // Use available height minus padding and title space
        final titleHeight = isSmallScreen
            ? 24.0
            : 28.0; // Estimated title height
        final legendHeight = isSmallScreen
            ? 40.0
            : 50.0; // Estimated legend height
        final padding = isSmallScreen
            ? AppDimensions.spacing12
            : AppDimensions.spacing16;
        final spacing = isSmallScreen
            ? AppDimensions.spacing12
            : AppDimensions.spacing16;

        final chartHeight = hasConstrainedHeight
            ? (availableHeight -
                      titleHeight -
                      legendHeight -
                      (padding * 2) -
                      spacing)
                  .clamp(100.0, availableHeight * 0.7)
            : (isSmallScreen ? 150.0 : 200.0);

        // Responsive bar width based on available width
        final barWidth = (availableWidth / data.length).clamp(16.0, 32.0);

        // Responsive text sizes
        final labelFontSize = isSmallScreen ? 10.0 : 12.0;
        final titleFontSize = isSmallScreen ? 16.0 : 18.0;

        // Calculate max value for scaling
        final maxValue = data
            .map((item) => item['value'] as double)
            .reduce((a, b) => a > b ? a : b);
        final scaleFactor =
            (chartHeight - 40) / maxValue; // Leave space for labels

        final chartContent = CustomCard(
          padding: EdgeInsets.all(padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Order Overview',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: titleFontSize,
                ),
              ),
              SizedBox(height: spacing),
              SizedBox(
                height: chartHeight,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: data.map((item) {
                      final value = item['value'] as double;
                      final color = item['color'] as Color;
                      final label = item['label'] as String;
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: isSmallScreen ? 4.0 : 8.0,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: barWidth,
                              height: value * scaleFactor,
                              decoration: BoxDecoration(
                                color: color,
                                borderRadius: BorderRadius.circular(
                                  isSmallScreen ? 2 : 4,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: isSmallScreen
                                  ? AppDimensions.spacing2
                                  : AppDimensions.spacing4,
                            ),
                            SizedBox(
                              width: barWidth + 10,
                              child: Text(
                                label,
                                style: TextStyle(
                                  color: AppColors.textSecondary,
                                  fontSize: labelFontSize,
                                ),
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              SizedBox(
                height: isSmallScreen
                    ? AppDimensions.spacing6
                    : AppDimensions.spacing8,
              ),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: isSmallScreen
                    ? AppDimensions.spacing12
                    : AppDimensions.spacing16,
                runSpacing: AppDimensions.spacing8,
                children: [
                  _buildLegend('Today', AppColors.primary, isSmallScreen),
                  _buildLegend('Upcoming', AppColors.success, isSmallScreen),
                  _buildLegend('This Month', AppColors.warning, isSmallScreen),
                ],
              ),
            ],
          ),
        );

        return hasConstrainedHeight
            ? SizedBox(
                width: availableWidth,
                height: availableHeight,
                child: chartContent,
              )
            : chartContent;
      },
    );
  }

  Widget _buildLegend(String label, Color color, bool isSmallScreen) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: isSmallScreen ? 10 : 12,
          height: isSmallScreen ? 10 : 12,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        SizedBox(
          width: isSmallScreen
              ? AppDimensions.spacing2
              : AppDimensions.spacing4,
        ),
        Text(
          label,
          style: TextStyle(
            color: AppColors.textSecondary,
            fontSize: isSmallScreen ? 11 : 12,
          ),
        ),
      ],
    );
  }
}
