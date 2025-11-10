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
        backgroundColor: AppColors.white,
        title: const Text('Notifications'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
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
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return NotificationItem(
                    isEven: index.isEven,
                    title: const Text.rich(
                      TextSpan(
                          text: 'Reminder! ',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                          children: [
                            TextSpan(
                                text: 'Get ready for your appointment at 9am',
                                style: TextStyle(fontWeight: FontWeight.normal))
                          ]),
                    ),
                    // title: 'Reminder! Get ready for your appointment at 9am',
                    time: 'Just Now',
                    icon: index.isEven
                        ? Icons.calendar_today
                        : Icons.monetization_on_outlined);
              },
            ),

            // ListView(
            //   // padding: EdgeInsets.symmetric(horizontal: 16.0),
            //   children: [
            //     const Padding(
            //       padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
            //       child: Text(
            //         'Newest',
            //         style: TextStyle(
            //             fontWeight: FontWeight.w600,
            //             fontSize: AppFontSize.fontSize18),
            //       ),
            //     ),
            //     const NotificationItem(
            //         title: 'Reminder! Get ready for your appointment at 9am',
            //         time: 'Just Now',
            //
            //         icon: Icons.calendar_today),
            //     10.heightSpace,
            //     const Padding(
            //       padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
            //       child: Text(
            //         'Oldest',
            //         style: TextStyle(
            //             fontWeight: FontWeight.w600,
            //             fontSize: AppFontSize.fontSize18),
            //       ),
            //     ),
            //     const NotificationItem(
            //         title: 'Payment at Famous Barber was successful!',
            //         time: '08:23 AM',
            //         date: '12/2/2024',
            //         icon: Icons.wallet),
            //     10.heightSpace,
            //     const NotificationItem(
            //         title: 'Reminder! Get ready for your appointment at 9am',
            //         time: 'Just Now',
            //         icon: Icons.calendar_today),
            //     10.heightSpace,
            //     const NotificationItem(
            //         title: 'Reminder! Get ready for your appointment at 9am',
            //         time: 'Just Now',
            //         icon: Icons.calendar_today),
            //     10.heightSpace,
            //     const NotificationItem(
            //         title: 'Reminder! Get ready for your appointment at 9am',
            //         time: 'Just Now',
            //         icon: Icons.calendar_today),
            //     10.heightSpace,
            //     const NotificationItem(
            //         title: 'Reminder! Get ready for your appointment at 9am',
            //         time: 'Just Now',
            //         icon: Icons.calendar_today),
            //     10.heightSpace,
            //     const NotificationItem(
            //         title: 'Reminder! Get ready for your appointment at 9am',
            //         time: 'Just Now',
            //         icon: Icons.calendar_today),
            //     10.heightSpace,
            //     const NotificationItem(
            //         title: 'Reminder! Get ready for your appointment at 9am',
            //         time: 'Just Now',
            //         icon: Icons.calendar_today),
            //   ],
            // ),
          ),
        ],
      ),
    );
  }
}
