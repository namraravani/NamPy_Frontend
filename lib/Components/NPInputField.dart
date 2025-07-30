import 'package:flutter/material.dart';
import 'package:nampy_frontend/Views/Global/Theme.dart';

class NPInputField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final String? placeholder;
  final String? Function(String?)? validator;
  final bool obscureText;

  const NPInputField({
    super.key,
    required this.labelText,
    required this.controller,
    this.placeholder,
    this.validator,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: placeholder,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 14, horizontal: 12),

        // Border when not focused
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary), // customize color
        ),

        // Border when focused
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: AppColors.secondary,
              width: 2), // customize color & thickness
        ),

        // Border when error exists
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.danger),
        ),

        // Border when focused and error exists
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.danger, width: 2),
        ),
      ),
      validator: validator,
    );
  }
}
