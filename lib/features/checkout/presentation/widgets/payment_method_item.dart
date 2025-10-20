import 'package:flutter/material.dart';
import 'package:in_time_app/core/utils/app_asset_path.dart';
import 'package:in_time_app/core/utils/app_colors.dart';

class PaymentMethodItem extends StatelessWidget {
  final String title;
  final String? subTitle;
  final bool isSelected;
  const PaymentMethodItem(
      {super.key, required this.title, this.isSelected = false, this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            border: Border.all(
                color: isSelected
                    ? AppColors.kGreenBackground
                    : AppColors.kLightGray,
                width: 2),
            borderRadius: BorderRadius.circular(15)),
        child: ListTile(
          title:  Text(title),
          subtitle: (subTitle != null) ? Text(subTitle!) : null,
          leading: Image.asset(AppAsset.wallet, height: 50),
          onTap: () {},
          trailing: isSelected
              ? const Icon(
                  Icons.check_circle,
                  color: AppColors.kGreenBackground,
                )
              : null,
        )

        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Row(
        //     children: [
        //       Image.asset(AppAsset.wallet, height: 50), // Replace with actual asset path
        //       16.widthSpace,
        //       Text(
        //         'Apple Pay',
        //         style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        //       ),
        //     ],
        //   ),
        // ),
        );
  }
}
