import 'package:flutter/material.dart';
import 'package:in_time_app/core/helpers/extension.dart';
import 'package:in_time_app/core/shared_widgets/app_button_widget.dart';
import 'package:in_time_app/core/utils/app_colors.dart';

import '../../../../core/utils/app_font_size.dart';

class CustomBottomSheet extends StatelessWidget {
  final String title;
  final Function() onPressed;

  const CustomBottomSheet(
      {super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50), topRight: Radius.circular(50))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 70,
              height: 4,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: AppFontSize.fontSize20,
                fontWeight: FontWeight.bold,
                color: AppColors.kRed,
              ),
            ),
            16.heightSpace,
            Text(
              'Are you sure want to $title ?',
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: AppFontSize.fontSize16,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AppButtonWidget(
                  title: 'Cancel',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  backgroundColor: AppColors.white,
                  borderColor: AppColors.kRed,
                  textColor: AppColors.kRed,
                  width: MediaQuery.of(context).size.width * 0.35,
                  border: BorderRadius.circular(15),
                ),
                AppButtonWidget(
                  title: title,
                  onPressed: onPressed,
                  backgroundColor: AppColors.kRed,
                  width: MediaQuery.of(context).size.width * 0.35,
                  border: BorderRadius.circular(15),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
