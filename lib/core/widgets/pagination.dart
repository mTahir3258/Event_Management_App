import 'package:flutter/material.dart';
import 'package:ui_specification/core/theme/app_dimensions.dart';
import 'package:ui_specification/core/theme/app_colors.dart';

/// Pagination widget for data tables
class PaginationControls extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final int itemsPerPage;
  final int totalItems;
  final Function(int) onPageChanged;
  final Function(int)? onItemsPerPageChanged;
  final List<int> itemsPerPageOptions;

  const PaginationControls({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.itemsPerPage,
    required this.totalItems,
    required this.onPageChanged,
    this.onItemsPerPageChanged,
    this.itemsPerPageOptions = const [10, 25, 50, 100],
  });

  @override
  Widget build(BuildContext context) {
    final startItem = (currentPage - 1) * itemsPerPage + 1;
    final endItem = (currentPage * itemsPerPage > totalItems)
        ? totalItems
        : currentPage * itemsPerPage;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.spacing16,
        vertical: AppDimensions.spacing8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Items per page selector
          if (onItemsPerPageChanged != null)
            Row(
              children: [
                Text(
                  'Rows per page:',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(width: AppDimensions.spacing8),
                DropdownButton<int>(
                  value: itemsPerPage,
                  items: itemsPerPageOptions.map((value) {
                    return DropdownMenuItem<int>(
                      value: value,
                      child: Text(value.toString()),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      onItemsPerPageChanged!(value);
                    }
                  },
                  underline: Container(),
                ),
              ],
            ),

          // Page info
          Text(
            'Showing $startItem-$endItem of $totalItems',
            style: Theme.of(context).textTheme.bodySmall,
          ),

          // Page navigation
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.chevron_left),
                onPressed: currentPage > 1
                    ? () => onPageChanged(currentPage - 1)
                    : null,
                tooltip: 'Previous page',
              ),
              ...List.generate(totalPages > 5 ? 5 : totalPages, (index) {
                int pageNumber;
                if (totalPages <= 5) {
                  pageNumber = index + 1;
                } else if (currentPage <= 3) {
                  pageNumber = index + 1;
                } else if (currentPage >= totalPages - 2) {
                  pageNumber = totalPages - 4 + index;
                } else {
                  pageNumber = currentPage - 2 + index;
                }

                return TextButton(
                  onPressed: () => onPageChanged(pageNumber),
                  style: TextButton.styleFrom(
                    backgroundColor: currentPage == pageNumber
                        ? AppColors.primary
                        : Colors.transparent,
                    foregroundColor: currentPage == pageNumber
                        ? AppColors.textOnPrimary
                        : AppColors.textPrimary,
                    minimumSize: const Size(40, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        AppDimensions.radiusSmall,
                      ),
                    ),
                  ),
                  child: Text(pageNumber.toString()),
                );
              }),
              IconButton(
                icon: const Icon(Icons.chevron_right),
                onPressed: currentPage < totalPages
                    ? () => onPageChanged(currentPage + 1)
                    : null,
                tooltip: 'Next page',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
