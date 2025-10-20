import 'package:flutter/material.dart';
import 'package:in_time_app/core/helpers/extension.dart';
import 'package:in_time_app/core/shared_widgets/app_button_widget.dart';
import 'package:in_time_app/core/utils/app_colors.dart';
import 'package:in_time_app/core/utils/app_font_size.dart';
import 'package:in_time_app/features/checkout/presentation/widgets/payment_method_item.dart';

class ChoosePaymentDialogue extends StatelessWidget {
  const ChoosePaymentDialogue({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Column(
        children: [
          10.heightSpace,
          const Text(
            'Payment Methods',
            style: TextStyle(
                fontSize: AppFontSize.fontSize18, fontWeight: FontWeight.w600),
          ),
          20.heightSpace,
          const PaymentMethodItem(
            title: 'Apple Pay',
            isSelected: true,
          ),
          const PaymentMethodItem(
            title: 'Google Pay',
          ),
          const PaymentMethodItem(
            title: 'PayPal',
          ),
          10.heightSpace,
          // const PaymentMethodItem(
          //   title: 'Stripe',
          // ),
          Align(
              alignment: Alignment.bottomCenter,
              child: AppButtonWidget(
                  title: 'Confirm',
                  onPressed: () {
                    Navigator.pop(context);
                  }))
        ],
      ),
    );
  }
}
