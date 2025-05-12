import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_font_size.dart';

class AppButtonWidget extends StatelessWidget {
  final String title;
  final double width;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final BorderRadius border;
  final void Function()? onPressed;
  final double padding;

  const AppButtonWidget(
      {super.key,
      required this.title,
      required this.onPressed,
      this.width = double.infinity,
      this.backgroundColor = AppColors.kGreenButton,
      this.textColor = AppColors.white,
      this.border =const BorderRadius.all(Radius.circular(10)),
        this.padding = 10,  this.borderColor = AppColors.transparent
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 40,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: padding),
            backgroundColor: backgroundColor,
            elevation: 20,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: borderColor, width: 2),
              // borderRadius: BorderRadius.all(Radius.circular(10)),
              borderRadius: border,
            ),
          ),
          onPressed: onPressed,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: AppFontSize.fontSize14,
              color: textColor,
              // fontWeight: FontWeight.w500,
            ),
          )),
    );
  }
}
