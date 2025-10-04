import 'package:flutter/material.dart';
import 'package:in_time_app/core/utils/app_asset_path.dart';
import 'package:in_time_app/core/utils/app_colors.dart';

class DoctorInfoCard extends StatelessWidget {
  const DoctorInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text(' Amir El-Sayed'),
      subtitle:  Text('Specialist Cardiology',style: TextStyle(
        color: AppColors.kGreenButton
      ),),
      leading: Image.asset(AppAsset.doctorImage),
    );
  }
}
