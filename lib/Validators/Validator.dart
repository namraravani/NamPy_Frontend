class Validator {
  // Base class for validators
  static String? validateField(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter Some value';
    }
    return null;
  }

  static String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your username';
    }
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  static String? validateConfirmPassword(String? value1, String? value2) {
    if (value2 == null || value2.isEmpty) {
      return 'Please enter confirm your password';
    }
    if (value1 != value2) {
      return 'Confirm Password do not match';
    }
    return null;
  }
}
