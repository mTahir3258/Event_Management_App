import 'package:flutter/material.dart';

// Define the colors from the suggested palette for use in Dart
const Color primaryColor = Color(0xFF1976D2);
const Color surfaceColor = Color(0xFFFFFFFF);

class PrimaryButtonExample extends StatelessWidget {
  const PrimaryButtonExample({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // This function executes when the button is tapped
        print('Primary Button Action!');
      },
      style: ElevatedButton.styleFrom(
        // 1. Background Color (Filled)
        backgroundColor: primaryColor, 

        // 2. Foreground Color (Text/Icon color)
        foregroundColor: surfaceColor, 

        // 3. Padding for standard sizing
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),

        // 4. Shape (Standard Material design slightly rounded corners)
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0), 
        ),

        // 5. Elevation (Gives it the 'lifted', filled appearance)
        elevation: 4, 
      ),
      child: const Text(
        'Primary (Filled) Button',
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}