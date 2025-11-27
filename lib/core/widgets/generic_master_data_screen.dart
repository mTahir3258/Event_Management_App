import 'package:flutter/material.dart';
import 'package:ui_specification/core/theme/app_colors.dart';
import 'package:ui_specification/core/theme/app_dimensions.dart';
import 'package:ui_specification/core/widgets/custom_card.dart';
import 'package:ui_specification/core/widgets/custom_text_field.dart';
import 'package:ui_specification/core/widgets/empty_state.dart';

class GenericMasterDataScreen<T> extends StatefulWidget {
  final String title;
  final List<T> items;
  final String Function(T) getName;
  final Function(String) onAdd;
  final Function(T, String) onEdit;
  final Function(T) onDelete;

  const GenericMasterDataScreen({
    super.key,
    required this.title,
    required this.items,
    required this.getName,
    required this.onAdd,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  State<GenericMasterDataScreen<T>> createState() =>
      _GenericMasterDataScreenState<T>();
}

class _GenericMasterDataScreenState<T>
    extends State<GenericMasterDataScreen<T>> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final filteredItems = widget.items
        .where(
          (item) => widget
              .getName(item)
              .toLowerCase()
              .contains(_searchQuery.toLowerCase()),
        )
        .toList();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: AppColors.surface,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(AppDimensions.spacing16),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search ${widget.title}...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: AppColors.surface,
              ),
              onChanged: (value) => setState(() => _searchQuery = value),
            ),
          ),
          Expanded(
            child: filteredItems.isEmpty
                ? EmptyState(
                    icon: Icons.list,
                    message: 'No ${widget.title} Found',
                    subtitle: 'Add a new one to get started',
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppDimensions.spacing16,
                    ),
                    itemCount: filteredItems.length,
                    itemBuilder: (context, index) {
                      final item = filteredItems[index];
                      return CustomCard(
                        margin: const EdgeInsets.only(bottom: 12),
                        child: ListTile(
                          title: Text(
                            widget.getName(item),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.edit_outlined,
                                  color: AppColors.primary,
                                ),
                                onPressed: () => _showFormDialog(item: item),
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.delete_outline,
                                  color: Colors.red,
                                ),
                                onPressed: () => _showDeleteConfirmation(item),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showFormDialog(),
        backgroundColor: AppColors.primary,
        icon: const Icon(Icons.add),
        label: Text('Add ${widget.title}'),
      ),
    );
  }

  void _showFormDialog({T? item}) {
    final controller = TextEditingController(
      text: item != null ? widget.getName(item) : '',
    );
    final formKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          item != null ? 'Edit ${widget.title}' : 'Add ${widget.title}',
        ),
        content: Form(
          key: formKey,
          child: CustomTextField(
            label: 'Name',
            controller: controller,
            validator: (v) => v?.isEmpty ?? true ? 'Required' : null,
            autofocus: true,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (formKey.currentState?.validate() ?? false) {
                if (item != null) {
                  widget.onEdit(item, controller.text);
                } else {
                  widget.onAdd(controller.text);
                }
                Navigator.pop(context);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
            ),
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  void _showDeleteConfirmation(T item) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Delete'),
        content: Text(
          'Are you sure you want to delete "${widget.getName(item)}"?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              widget.onDelete(item);
              Navigator.pop(context);
            },
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
