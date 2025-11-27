/// Form validation utilities
class Validators {
  /// Email validation
  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }

    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }

    return null;
  }

  /// Required field validation
  static String? required(String? value, [String fieldName = 'This field']) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  /// Phone number validation
  static String? phone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }

    // Remove all non-digit characters
    final digitsOnly = value.replaceAll(RegExp(r'[^\d]'), '');

    if (digitsOnly.length < 10) {
      return 'Please enter a valid phone number';
    }

    return null;
  }

  /// Password validation
  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }

    return null;
  }

  /// Minimum length validation
  static String? minLength(
    String? value,
    int length, [
    String fieldName = 'This field',
  ]) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }

    if (value.length < length) {
      return '$fieldName must be at least $length characters';
    }

    return null;
  }

  /// Maximum length validation
  static String? maxLength(
    String? value,
    int length, [
    String fieldName = 'This field',
  ]) {
    if (value != null && value.length > length) {
      return '$fieldName must be at most $length characters';
    }
    return null;
  }

  /// Numeric validation
  static String? numeric(String? value, [String fieldName = 'This field']) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }

    if (double.tryParse(value) == null) {
      return '$fieldName must be a number';
    }

    return null;
  }
}
