import 'package:flutter/material.dart';
import 'package:in_time_app/core/utils/app_colors.dart';
import 'package:in_time_app/core/utils/app_font_size.dart';
import 'package:in_time_app/features/profile/presentation/widget/custom_bottom_sheet.dart';
import 'package:in_time_app/features/profile/presentation/widget/profile_action.dart';

class ManageAccountSection extends StatelessWidget {
  const ManageAccountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileAction(
            title: 'Logout',
            icon: const Icon(
              Icons.logout,
              color: AppColors.kRed,
            ),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                ),
                builder: (BuildContext context) {
                  return CustomBottomSheet(title: 'Logout',onPressed: (){},);
                },
              );

            },
        showArrow: false,),
        ProfileAction(
          title: 'Delete Account ',
          icon:  const Text(
           'X',
            style: TextStyle(color: AppColors.kRed,
              fontSize: AppFontSize.fontSize24
            ),
          ),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              backgroundColor: Colors.white,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              ),
              builder: (BuildContext context) {
                return CustomBottomSheet(title: 'Delete Account',onPressed: (){},);
              },
            );
          },
          showArrow: false,)
      ],
    );
  }
}
