import 'package:flutter/material.dart';
import 'package:in_time_app/core/helpers/extension.dart';
import 'package:in_time_app/core/utils/app_colors.dart';
import 'package:in_time_app/core/utils/app_font_size.dart';

import '../widget/notification_item.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              // padding: EdgeInsets.symmetric(horizontal: 16.0),
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
                  child: Text(
                    'Newest',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: AppFontSize.fontSize18),
                  ),
                ),
                const NotificationItem(
                    title: 'Reminder! Get ready for your appointment at 9am',
                    time: 'Just Now',
                    icon: Icons.calendar_today),
                10.heightSpace,
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
                  child: Text(
                    'Oldest',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: AppFontSize.fontSize18),
                  ),
                ),
                const NotificationItem(
                    title: 'Payment at Famous Barber was successful!',
                    time: '12/2/2024  08:23 AM',
                    icon: Icons.wallet),
                10.heightSpace,
                const NotificationItem(
                    title: 'Reminder! Get ready for your appointment at 9am',
                    time: 'Just Now',
                    icon: Icons.calendar_today),
                10.heightSpace,
                const NotificationItem(
                    title: 'Reminder! Get ready for your appointment at 9am',
                    time: 'Just Now',
                    icon: Icons.calendar_today),
                10.heightSpace,
                const NotificationItem(
                    title: 'Reminder! Get ready for your appointment at 9am',
                    time: 'Just Now',
                    icon: Icons.calendar_today),
                10.heightSpace,
                const NotificationItem(
                    title: 'Reminder! Get ready for your appointment at 9am',
                    time: 'Just Now',
                    icon: Icons.calendar_today),
                10.heightSpace,
                const NotificationItem(
                    title: 'Reminder! Get ready for your appointment at 9am',
                    time: 'Just Now',
                    icon: Icons.calendar_today),
                10.heightSpace,
                const NotificationItem(
                    title: 'Reminder! Get ready for your appointment at 9am',
                    time: 'Just Now',
                    icon: Icons.calendar_today),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
