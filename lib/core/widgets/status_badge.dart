import 'package:flutter/material.dart';
import 'package:ui_specification/core/theme/app_colors.dart';
import 'package:ui_specification/core/theme/app_dimensions.dart';

/// Status badge widget for displaying status chips
class StatusBadge extends StatelessWidget {
  final String label;
  final StatusType type;
  final bool small;

  const StatusBadge({
    super.key,
    required this.label,
    required this.type,
    this.small = false,
  });

  Color get _backgroundColor {
    switch (type) {
      case StatusType.newStatus:
        return AppColors.statusNew;
      case StatusType.inProgress:
        return AppColors.statusInProgress;
      case StatusType.success:
        return AppColors.statusSuccess;
      case StatusType.failed:
        return AppColors.statusFailed;
      case StatusType.pending:
        return AppColors.statusPending;
      case StatusType.sent:
        return AppColors.statusSent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: small ? AppDimensions.spacing8 : AppDimensions.spacing12,
        vertical: small ? AppDimensions.spacing4 : AppDimensions.spacing4,
      ),
      decoration: BoxDecoration(
        color: _backgroundColor,
        borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
          color: AppColors.textOnPrimary,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

/// Status types enum
enum StatusType { newStatus, inProgress, success, failed, pending, sent }
