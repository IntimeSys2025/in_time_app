import 'package:flutter/material.dart';
import 'package:in_time_app/core/helpers/extension.dart';
import 'package:in_time_app/core/utils/app_constants.dart';
import 'package:in_time_app/features/profile/presentation/screens/account_security_screen.dart';
import 'package:in_time_app/features/profile/presentation/screens/notification_screen.dart';
import 'package:in_time_app/features/profile/presentation/screens/personal_data_screen.dart';
import 'package:in_time_app/features/profile/presentation/screens/wallet_screen.dart';
import 'package:in_time_app/features/profile/presentation/widget/profile_action.dart';

import '../../../account/presentation/screens/loginScreen.dart';

class PersonalInfoSection extends StatelessWidget {
  const PersonalInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Personal Info'),
        8.heightSpace,
        ProfileAction(
            title: 'Personal Data',
            icon: const Icon(Icons.person_2_outlined),
            onPressed: () {
              if(AppConstants.userToken ==''){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ));
                return;
              }
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PersonalDataScreen(),
                  ));
            }),
        ProfileAction(
            title: 'Wallet', icon: const Icon(Icons.wallet), onPressed: () {
          if(AppConstants.userToken ==''){
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ));
            return;
          }
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WalletScreen(),
              ));
        }),
        ProfileAction(
            title: 'Account Security',
            icon: const Icon(Icons.security_outlined),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AccountSecurityScreen(),
                  ));
            }),
        ProfileAction(
            title: 'Notification',
            icon: const Icon(Icons.notifications_none),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NotificationsScreen(),
                  ));
            }),
      ],
    );
  }
}
