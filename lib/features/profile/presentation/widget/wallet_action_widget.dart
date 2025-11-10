import 'package:flutter/cupertino.dart';
import 'package:in_time_app/core/utils/app_colors.dart';

class WalletActionWidget extends StatelessWidget {
  final String title;
  final Function() onPressed;
  final bool isSelected;
  const WalletActionWidget(
      {super.key,
      required this.title,
      required this.onPressed,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        // margin: EdgeInsets.all(10),
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
        decoration: BoxDecoration(
            // shape: BoxShape.circle,
            color: isSelected ? AppColors.tagGreen : AppColors.transparent,
            borderRadius: BorderRadius.circular(10)),
        child: Text(
          title,
          style:
              TextStyle(color: isSelected ? AppColors.white : AppColors.kGray),
        ),
      ),
    );
  }
}
