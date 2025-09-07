import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final Widget? icon;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final int maxLines;
  final int minLines;
  final bool readOnly;
  final bool obscureText;

  const AppTextField({
    super.key,
    required this.hintText,
    this.inputFormatters,
    required this.controller,
    this.validator,
    this.onChanged,
    this.maxLines = 1,
    this.minLines = 1,
    this.readOnly = false,
    this.icon,required this.labelText, required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,

      maxLines: maxLines,
      minLines: minLines,
      controller: controller,
      readOnly: readOnly,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: icon,

        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      validator: validator,
      onChanged: (value) {},
    );
  }
}
