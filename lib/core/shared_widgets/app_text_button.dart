import 'package:flutter/material.dart';
import 'package:in_time_app/core/helpers/extension.dart';

class AppTextButton extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  const AppTextButton({super.key, required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: context.style14()?.copyWith(color: Colors.white),
      ),
    );
  }
}
