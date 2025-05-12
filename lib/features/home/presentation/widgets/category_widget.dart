import 'package:flutter/material.dart';
import 'package:in_time_app/core/utils/app_colors.dart';

class CategoryCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;

  const CategoryCard(
      {super.key,
      required this.icon,
      required this.label,
      this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: isSelected?AppColors.kGreenBackground:AppColors.kCategoryColor, // Green
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: isSelected?AppColors.white:AppColors.lightGrey, size: 30),
          const SizedBox(height: 8),
          Text(
            label,
            style:   TextStyle(
              color: isSelected?AppColors.white:AppColors.lightGrey,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
