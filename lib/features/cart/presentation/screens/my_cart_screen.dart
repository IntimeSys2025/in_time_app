import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_time_app/features/cart/presentation/widgets/empty_cart_widget.dart';
import 'package:in_time_app/features/home/presentation/widgets/event_card.dart';

import '../../../appointment/presentation/logic/appointment_cubit.dart';
import '../../../appointment/presentation/widgets/cart_item_widget.dart';
import '../../../checkout/presentation/widgets/last_payment_used_widget.dart';

class MyCartScreen extends StatelessWidget {
  const MyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appointmentCubit = BlocProvider.of<AppointmentCubit>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        centerTitle: true,
      ),
      body: (appointmentCubit.subServicesBooked.isEmpty && appointmentCubit.bookedEvents.isEmpty)
          ? const EmptyCartWidget()
          : Column(
              children: [
                if(appointmentCubit.bookedEvents.isNotEmpty)
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: appointmentCubit.bookedEvents.length,
                    // itemCount: 4,
                    itemBuilder: (context, index) {
                      final event =
                      appointmentCubit.bookedEvents[index];
                      return EventBookingCard(
                        event: event,
                      );
                    },
                  ),
                ),
                if(appointmentCubit.subServicesBooked.isNotEmpty)
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: appointmentCubit.subServicesBooked.length,
                    // itemCount: 4,
                    itemBuilder: (context, index) {
                      final subServiceModel =
                          appointmentCubit.subServicesBooked[index];
                      return CartItemWidget(
                        item: subServiceModel,
                        showBookButton: true,
                        isCheckout: false,
                      );
                    },
                  ),
                ),
                // LastPaymentUsedWidget()
              ],
            ),
    );
  }
}
