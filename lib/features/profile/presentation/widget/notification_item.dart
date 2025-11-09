import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';

class NotificationItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final String? date;
  final String time;
  const NotificationItem(
      {super.key, required this.title, required this.icon, required this.time,  this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.kLightGreen.withOpacity(0.7),
      child:  ListTile(
        leading: CircleAvatar(
          backgroundColor: AppColors.kGreenButton,
          child: Icon(icon, color: Colors.white),
        ),
        trailing: Column(
           crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            if(date != null)
              Text(date!),
            Text(time),

          ],
        ),
        title: Text(title),
        // subtitle: Text(time),
      ),
    );
  }
}
