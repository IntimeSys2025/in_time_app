import 'package:flutter/material.dart';
import 'package:in_time_app/core/helpers/extension.dart';
import 'package:in_time_app/core/utils/app_colors.dart';
import '../../../../core/utils/app_font_size.dart';

class ProfileAction extends StatelessWidget {
  final String title;
  final bool showArrow;
  final Widget icon;
  final void Function() onPressed;

  const ProfileAction(
      {super.key,
      required this.title,
      required this.icon,
      required this.onPressed,  this.showArrow = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          // color: AppColors.kBackgroundCard
      ),
      child: GestureDetector(
        onTap: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                icon,
                10.widthSpace,
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: AppFontSize.fontSize16,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            if(showArrow)
            const Icon(
              Icons.arrow_forward_ios,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}
