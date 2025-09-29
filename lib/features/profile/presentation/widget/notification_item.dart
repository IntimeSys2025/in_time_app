import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';

class NotificationItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final String time;
  const NotificationItem(
      {super.key, required this.title, required this.icon, required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.kLightGreen,
      child:  ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.green,
          child: Icon(icon, color: Colors.white),
        ),
        title: Text(title),
        subtitle: Text(time),
      ),
    );
  }
}
