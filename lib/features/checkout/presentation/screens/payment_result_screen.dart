import 'package:flutter/material.dart';
import 'package:in_time_app/core/helpers/extension.dart';
import 'package:in_time_app/core/shared_widgets/app_button_widget.dart';
import 'package:in_time_app/core/shared_widgets/app_text_button.dart';
import 'package:in_time_app/core/utils/app_colors.dart';
import 'package:in_time_app/features/checkout/presentation/screens/payment_details_screen.dart';

import '../../../../core/utils/app_font_size.dart';

class PaymentResultScreen extends StatelessWidget {
  final bool paymentSuccess;
  const PaymentResultScreen({super.key, required this.paymentSuccess});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            paymentSuccess
                ? const CircleAvatar(
                    radius: 50,
                    backgroundColor: AppColors.kLightGreen,
                    child: Icon(
                      Icons.check_circle,
                      size: 100,
                      color: AppColors.kGreenButton,
                    ),
                  )
                : CircleAvatar(
                    radius: 60,
                    backgroundColor: AppColors.kRed.withOpacity(0.2),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: AppColors.kRed,
                      child: Icon(
                        Icons.highlight_remove_outlined,
                        size: 50,
                        color: AppColors.white,
                      ),
                    ),
                  ),
            20.heightSpace,
            Text(
              paymentSuccess ? 'Payment Successfully' : 'Payment Failed',
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: AppFontSize.fontSize24,
                  fontWeight: FontWeight.w700),
            ),
            20.heightSpace,
            const Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
              style: TextStyle(color: AppColors.moreLightGrey),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 10,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppButtonWidget(
                  title: 'See Detail',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PaymentDetailsScreen(),
                        ));
                  }),
              AppTextButton(title: 'Go To Home')
            ],
          ),
        ),
      ),
    );
  }
}
