import 'package:flutter/material.dart';
import 'package:ui_specification/core/theme/app_colors.dart';
import 'package:ui_specification/core/theme/app_dimensions.dart';

class PaginationControls extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final int rowsPerPage;
  final List<int> rowsPerPageOptions;
  final Function(int) onPageChanged;
  final Function(int) onRowsPerPageChanged;
  final int totalItems;

  const PaginationControls({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.rowsPerPage,
    this.rowsPerPageOptions = const [10, 25, 50, 100],
    required this.onPageChanged,
    required this.onRowsPerPageChanged,
    required this.totalItems,
  });

  @override
  Widget build(BuildContext context) {
    final startItem = ((currentPage - 1) * rowsPerPage) + 1;
    final endItem = (currentPage * rowsPerPage).clamp(0, totalItems);

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.spacing16,
        vertical: AppDimensions.spacing8,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 16,
        runSpacing: 16,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Rows per page:'),
              const SizedBox(width: 8),
              DropdownButton<int>(
                value: rowsPerPage,
                items: rowsPerPageOptions.map((rows) {
                  return DropdownMenuItem(
                    value: rows,
                    child: Text(rows.toString()),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    onRowsPerPageChanged(value);
                  }
                },
                underline: Container(),
                style: const TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '$startItem-$endItem of $totalItems',
                style: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(width: 16),
              IconButton(
                icon: const Icon(Icons.chevron_left),
                onPressed: currentPage > 1
                    ? () => onPageChanged(currentPage - 1)
                    : null,
                color: AppColors.primary,
                disabledColor: Colors.grey.shade300,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  '$currentPage',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.chevron_right),
                onPressed: currentPage < totalPages
                    ? () => onPageChanged(currentPage + 1)
                    : null,
                color: AppColors.primary,
                disabledColor: Colors.grey.shade300,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
