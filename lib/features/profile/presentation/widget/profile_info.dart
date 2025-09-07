import 'package:flutter/material.dart';

import '../../../../core/utils/app_font_size.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      leading: CircleAvatar(
        radius: 30,
        backgroundImage: NetworkImage(
          'https://c8.alamy.com/comp/TC2FPE/young-man-avatar-cartoon-character-profile-picture-TC2FPE.jpg',
          // errorBuilder: (context, error, stackTrace) {
          //   return const Icon(Icons.person);
          // },
          // scale: 0.1

        ),


      ),
      title: Text(
        'Test Test',
        style: TextStyle(
            fontSize: AppFontSize.fontSize20, fontWeight: FontWeight.w600),
      ),
      subtitle: Text('adnan@gmail.com'),
    );
  }
}
