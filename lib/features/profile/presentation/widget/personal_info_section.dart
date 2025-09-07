import 'package:flutter/material.dart';
import 'package:in_time_app/core/helpers/extension.dart';
import 'package:in_time_app/features/profile/presentation/screens/personal_data_screen.dart';
import 'package:in_time_app/features/profile/presentation/widget/profile_action.dart';

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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PersonalDataScreen(),
                  ));
            }),
        ProfileAction(
            title: 'Wallet', icon: const Icon(Icons.wallet), onPressed: () {}),
        ProfileAction(
            title: 'Account Security',
            icon: const Icon(Icons.security_outlined),
            onPressed: () {}),
        ProfileAction(
            title: 'Notifacation',
            icon: const Icon(Icons.notifications_none),
            onPressed: () {}),
      ],
    );
  }
}
