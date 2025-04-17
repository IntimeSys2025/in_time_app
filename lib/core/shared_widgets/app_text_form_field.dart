import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextFormFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final TextAlign textAlign;
  final InputDecoration? decoration;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? label;
  final String? labelText;
  final TextStyle? labelStyle;
  final String? Function(String?)? validator;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final void Function()? onEditingComplete;
  final void Function(String)? onFieldSubmitted;
  final void Function(String?)? onSaved;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final int? maxLines;
  final AutovalidateMode? autoValidateMode;
  final bool autofocus;
  final bool? enabled;
  final bool readOnly;
  final String? initialValue;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final int? maxLength;
  final bool obscureText;
  final TextAlignVertical? textAlignVertical;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? contentPadding;

  const AppTextFormFieldWidget({
    this.controller,
    this.textAlign = TextAlign.start,
    this.decoration,
    this.prefixIcon,
    this.suffixIcon,
    this.hintText,
    this.hintStyle,
    this.label,
    this.labelText,
    this.labelStyle,
    this.validator,
    this.onTap,
    this.onChanged,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    this.textInputAction = TextInputAction.next,
    this.focusNode,
    this.maxLines = 1,
    this.autoValidateMode,
    this.autofocus = false,
    this.enabled = true,
    this.readOnly = false,
    this.initialValue,
    this.inputFormatters,
    this.keyboardType,
    this.maxLength,
    this.obscureText = false,
    this.textAlignVertical,
    this.backgroundColor,
    this.contentPadding,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textAlign: textAlign,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: hintStyle,
        labelText: labelText,
        label: label,
        labelStyle: labelStyle,
        filled: backgroundColor != null,
        fillColor: backgroundColor,
        contentPadding: contentPadding,
      ),
      validator: validator,
      onTapOutside: (_){
        FocusScope.of(context).unfocus();
      },
      onTap: onTap,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      onFieldSubmitted: onFieldSubmitted,
      onSaved: onSaved,
      textInputAction: textInputAction,
      focusNode: focusNode,
      maxLines: maxLines,
      autovalidateMode: autoValidateMode,
      autofocus: autofocus,
      enabled: enabled,
      readOnly: readOnly,
      initialValue: initialValue,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      maxLength: maxLength,
      obscureText: obscureText,
      textAlignVertical: textAlignVertical,
    );

  }
}
