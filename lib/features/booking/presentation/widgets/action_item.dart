import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_font_size.dart';

class ActionItem extends StatelessWidget {
  final String title;
  final Function() onTap;
  final bool selected;
  const ActionItem(
      {super.key,
      required this.title,
      required this.onTap,
      required this.selected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        decoration: BoxDecoration(
          color: selected ? AppColors.kLightGreen3 : null,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: selected ? AppColors.white : AppColors.kLightBlack,
              fontSize: AppFontSize.fontSize16,
            ),
          ),
        ),
      ),
    );
  }
}
