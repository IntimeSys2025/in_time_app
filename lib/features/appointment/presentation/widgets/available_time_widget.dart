import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_font_size.dart';

class AvailableTimeWidget extends StatelessWidget {
  final String time;
  final bool isSelected;
  final VoidCallback? onTap;
  const AvailableTimeWidget({super.key, required this.time, required this.isSelected, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: isSelected ? AppColors.kGreenButton:AppColors.moreLightGrey,
          ),
        ),
        child: Text(
          time,
          style: TextStyle(fontSize: AppFontSize.fontSize16),
        ),
      ),
    );
  }
}
