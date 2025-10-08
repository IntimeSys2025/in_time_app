import 'package:flutter/material.dart';
import 'package:in_time_app/core/helpers/extension.dart';
import 'package:in_time_app/core/utils/app_colors.dart';
import 'package:in_time_app/core/utils/app_font_size.dart';

class EmptyBooking extends StatelessWidget {
  const EmptyBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      // mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircleAvatar(
          radius: 35,
          backgroundColor: AppColors.kLightGreen3,
          child: Icon(
            Icons.sentiment_dissatisfied_outlined,
            color: AppColors.white,
            size: 50,
          ),
        ),
        30.heightSpace,
        const Text('You don’t have an Appointment !',style: TextStyle(
          color: AppColors.black,
          fontSize: AppFontSize.fontSize16,
          fontWeight: FontWeight.w600
        ),),
        10.heightSpace,
        const Text('Browse the services and pick up one',style: TextStyle(
          fontSize: AppFontSize.fontSize12,
          color: AppColors.kGray
        ),),

      ],
    );
  }
}
