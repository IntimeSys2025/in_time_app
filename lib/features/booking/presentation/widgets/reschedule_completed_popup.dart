import 'package:flutter/material.dart';
import 'package:in_time_app/core/helpers/extension.dart';
import 'package:in_time_app/core/shared_widgets/app_button_widget.dart';
import 'package:in_time_app/core/utils/app_colors.dart';

class RescheduleCompletedPopup extends StatelessWidget {
  final bool isCancelBooking;
  const RescheduleCompletedPopup({super.key,  this.isCancelBooking = false});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircleAvatar(
              radius: 45,
              backgroundColor: Color(0xFFE6F3E6),
              child:
                  Icon(Icons.check_circle_sharp, color: Colors.green, size: 65),
            ),
            16.heightSpace,
             Text(
             isCancelBooking ?'Refund Completed': 'Reschedule Completed',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            24.heightSpace,
            AppButtonWidget(
                title: 'Thank You',
                onPressed: () {
                  Navigator.pop(context);
                }),
          ],
        ),
      ),
    );
  }
}
