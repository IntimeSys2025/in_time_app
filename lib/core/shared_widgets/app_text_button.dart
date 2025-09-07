import 'package:flutter/material.dart';
import 'package:in_time_app/core/helpers/extension.dart';

import '../utils/app_colors.dart';

class AppTextButton extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  final Color textColor;
   AppTextButton({super.key, required this.title, this.onPressed,  this.textColor =AppColors.green});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: context.style14()?.copyWith(color: textColor),
      ),
    );
  }
}
