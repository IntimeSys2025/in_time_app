import 'package:flutter/material.dart';
import 'package:in_time_app/core/utils/app_constants.dart';

import '../../../../core/utils/app_font_size.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListTile(
      leading: const CircleAvatar(
        radius: 30,
        child: Icon(Icons.person,size: 40,),

        // backgroundImage: NetworkImage(
        //   'https://c8.alamy.com/comp/TC2FPE/young-man-avatar-cartoon-character-profile-picture-TC2FPE.jpg',
        //   // errorBuilder: (context, error, stackTrace) {
        //   //   return const Icon(Icons.person);
        //   // },
        //   // scale: 0.1
        //
        // ),


      ),
      title: Text(
        AppConstants.fullName,
        style: const TextStyle(
            fontSize: AppFontSize.fontSize20, fontWeight: FontWeight.w600),
      ),
      subtitle: Text(AppConstants.userMobile ?? ''),
    );
  }
}
