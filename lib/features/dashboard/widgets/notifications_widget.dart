import 'package:flutter/material.dart';
import 'package:ui_specification/core/theme/app_colors.dart';
import 'package:ui_specification/core/theme/app_dimensions.dart';
import 'package:ui_specification/core/widgets/custom_card.dart';

/// Notifications widget for dashboard
class NotificationsWidget extends StatelessWidget {
  const NotificationsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;
    final isLargeScreen = screenWidth > 1200;

    // Adjust number of notifications shown based on screen size
    final notifications = [
      {
        'title': 'New lead assigned',
        'subtitle': 'John Doe requested a quote',
        'time': '2 hours ago',
        'icon': Icons.person_add_outlined,
        'color': AppColors.primary,
      },
      {
        'title': 'Order payment due',
        'subtitle': 'Order #1234 payment overdue',
        'time': '1 day ago',
        'icon': Icons.payment_outlined,
        'color': AppColors.error,
      },
      {
        'title': 'Event reminder',
        'subtitle': 'Wedding event tomorrow',
        'time': '3 hours ago',
        'icon': Icons.event_outlined,
        'color': AppColors.warning,
      },
      {
        'title': 'Quotation approved',
        'subtitle': 'Quote #567 approved by client',
        'time': '5 hours ago',
        'icon': Icons.check_circle_outlined,
        'color': AppColors.success,
      },
    ];

    // Show fewer notifications on smaller screens
    final displayNotifications = isSmallScreen
        ? notifications.take(3).toList()
        : notifications;

    return CustomCard(
      padding: EdgeInsets.all(
        isSmallScreen ? AppDimensions.spacing12 : AppDimensions.spacing16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recent Notifications',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: isSmallScreen ? 16 : 18,
                ),
              ),
              if (!isSmallScreen)
                TextButton(
                  onPressed: () {
                    // Navigate to notifications screen
                  },
                  child: const Text('View All'),
                ),
            ],
          ),
          SizedBox(
            height: isSmallScreen
                ? AppDimensions.spacing6
                : AppDimensions.spacing8,
          ),
          ...displayNotifications.map(
            (notification) =>
                _buildNotificationItem(notification, isSmallScreen),
          ),
          if (isSmallScreen)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Center(
                child: TextButton(
                  onPressed: () {
                    // Navigate to notifications screen
                  },
                  child: const Text('View All'),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildNotificationItem(
    Map<String, dynamic> notification,
    bool isSmallScreen,
  ) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: isSmallScreen
            ? AppDimensions.spacing8
            : AppDimensions.spacing12,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(
              isSmallScreen ? AppDimensions.spacing6 : AppDimensions.spacing8,
            ),
            decoration: BoxDecoration(
              color: (notification['color'] as Color).withOpacity(0.1),
              borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
            ),
            child: Icon(
              notification['icon'] as IconData,
              color: notification['color'] as Color,
              size: isSmallScreen ? 18 : 20,
            ),
          ),
          SizedBox(
            width: isSmallScreen
                ? AppDimensions.spacing8
                : AppDimensions.spacing12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notification['title'] as String,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: isSmallScreen ? 13 : 14,
                  ),
                ),
                SizedBox(
                  height: isSmallScreen
                      ? AppDimensions.spacing2
                      : AppDimensions.spacing4,
                ),
                Text(
                  notification['subtitle'] as String,
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: isSmallScreen ? 11 : 12,
                  ),
                ),
                SizedBox(
                  height: isSmallScreen
                      ? AppDimensions.spacing2
                      : AppDimensions.spacing4,
                ),
                Text(
                  notification['time'] as String,
                  style: TextStyle(
                    color: AppColors.textDisabled,
                    fontSize: isSmallScreen ? 9 : 10,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
