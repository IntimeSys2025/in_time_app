import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';

class NotificationItem extends StatelessWidget {
  final bool isEven;
  final Widget title;
  final IconData icon;
  final String? date;
  final String time;
  const NotificationItem(
      {super.key,
      required this.title,
      required this.icon,
      required this.time,
      this.date,
      required this.isEven});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(vertical: 5),
      color: isEven ? AppColors.kLightGreen.withOpacity(0.7):AppColors.white,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: AppColors.kGreenButton,
          child: Icon(icon, color: Colors.white),
        ),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (date != null) Text(date!),
            Text(time),
          ],
        ),
        title: title,
        // subtitle: Text(time),
      ),
    );
  }
}
