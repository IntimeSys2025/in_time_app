import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_time_app/features/checkout/presentation/screens/payment_result_screen.dart';
import 'package:in_time_app/features/checkout/presentation/widgets/last_payment_used_widget.dart';

import '../../../../core/shared_widgets/app_button_widget.dart';
import '../../../appointment/presentation/logic/appointment_cubit.dart';
import '../../../appointment/presentation/widgets/cart_item_widget.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appointmentCubit = BlocProvider.of<AppointmentCubit>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        centerTitle: true,
      ),
      body: Column(

        children: [
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: appointmentCubit.subServicesBooked.length,
              // itemCount: 4,
              itemBuilder: (context, index) {
                final subServiceModel = appointmentCubit.subServicesBooked[index];
                return CartItemWidget(
                  item: subServiceModel,
                  showBookButton: true,
                  isCheckout: true,
                );
              },
            ),
          ),
          LastPaymentUsedWidget()
        ],
      ),
      bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
            child: AppButtonWidget(
                height: 60,
                title: 'Pay Now',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PaymentResultScreen(paymentSuccess: true),
                      ));
                }),
          )),
    );
  }
}
