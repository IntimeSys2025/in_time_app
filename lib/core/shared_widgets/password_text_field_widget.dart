import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class AppPasswordTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final bool obscureText;
  final Widget suffixIcon;

  const AppPasswordTextFieldWidget(
      {super.key,
      required this.controller,
      required this.obscureText,
      required this.suffixIcon, required this.title});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validatePassword,
      decoration: InputDecoration(
        focusColor: AppColors.green,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.green)),
        labelText: title,
        suffixIcon: suffixIcon,
      ),
    );
  }
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    final passwordRegex = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{8,}$',
    );

    if (!passwordRegex.hasMatch(value)) {
      return 'Password must be at least 8 characters,\ninclude uppercase, lowercase, number, and special character';
    }

    return null; // Password is valid
  }
}
