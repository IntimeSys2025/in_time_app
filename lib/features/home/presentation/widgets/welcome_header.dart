import 'package:flutter/material.dart';
import 'package:in_time_app/features/account/presentation/screens/loginScreen.dart';

import '../../../../core/utils/app_constants.dart';
import '../../../profile/presentation/screens/notification_screen.dart';

class WelcomeHeader extends StatelessWidget {
  final bool showNotificationIcon;
  const WelcomeHeader({super.key,  this.showNotificationIcon = true});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Profile photo and text
         Row(
          children: [
            // Profile photo
            const CircleAvatar(
              radius: 35,
              child: Icon(Icons.person,
              size: 50,),
              // backgroundImage: NetworkImage(
              //   AppConstants.imageURL,
              // ),
            ),
            const SizedBox(width: 12),
            // Welcome Text
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if(AppConstants.userToken!= '' )
                const Text(
                  "Hi,Welcome Back,",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                (AppConstants.userToken!= '' )?
                Text(
                  AppConstants.fullName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ):TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                }, child: const Text('Sign in',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),)),
              ],
            ),
          ],
        ),
        // Notification bell icon
        if(showNotificationIcon)
        GestureDetector(
          onTap: () {
            if(AppConstants.userToken == ''){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen(),));
              return;
            }
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotificationsScreen(),
                ));
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: const Icon(Icons.notifications_none),
          ),
        ),
      ],
    );
  }
}
