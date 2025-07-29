import 'package:flutter/material.dart';

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
        border: const OutlineInputBorder(),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
      ),
      validator: validator,
    );
  }
}
