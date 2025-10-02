import 'package:flutter/material.dart';
import 'package:in_time_app/core/shared_widgets/app_text_button.dart';
import 'package:in_time_app/core/utils/app_colors.dart';
import 'package:in_time_app/core/utils/app_font_size.dart';
import 'package:in_time_app/features/checkout/presentation/widgets/choose_payment_dialoge.dart';
import 'package:in_time_app/features/checkout/presentation/widgets/payment_method_item.dart';

class LastPaymentUsedWidget extends StatelessWidget {
  const LastPaymentUsedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 10),

      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Payment Method',
              style: TextStyle(
                fontSize: AppFontSize.fontSize18,
                fontWeight: FontWeight.w600
              ),),
              AppTextButton(
                title: 'Change',
                onPressed: (){
                  showModalBottomSheet(context: context, builder: (context) {
                    return ChoosePaymentDialogue();
                  },);

                },
              )
            ],
          ),
          const PaymentMethodItem(title: 'PayPal',subTitle: 'ameliawilson@gmail.com',)
        ],
      ),
    );
  }
}
