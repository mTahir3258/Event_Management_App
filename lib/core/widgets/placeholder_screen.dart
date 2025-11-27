import 'package:flutter/material.dart';
import 'package:ui_specification/core/widgets/empty_state.dart';

/// Placeholder screen for routes not yet implemented
class PlaceholderScreen extends StatelessWidget {
  final String title;

  const PlaceholderScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: EmptyState(
        icon: Icons.construction_outlined,
        message: '$title Screen',
        subtitle: 'This screen is under construction',
        actionLabel: 'Go Back',
        onActionPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
