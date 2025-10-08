import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_time_app/core/helpers/extension.dart';
import 'package:in_time_app/core/utils/app_colors.dart';
import 'package:in_time_app/features/booking/presentation/widgets/action_item.dart';
import 'package:in_time_app/features/booking/presentation/widgets/booking_item.dart';
import 'package:in_time_app/features/booking/presentation/widgets/empty_booking.dart';
import 'package:in_time_app/features/booking/presentation/widgets/reschedule_completed_popup.dart';

import '../../../appointment/presentation/logic/appointment_cubit.dart';
import '../../../appointment/presentation/widgets/cart_item_widget.dart';
import '../../../appointment/presentation/widgets/date_selection_bottom_sheet.dart';

class MyBookingScreen extends StatelessWidget {
  const MyBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appointmentCubit = BlocProvider.of<AppointmentCubit>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Booking'),
        centerTitle: true,
      ),
      body: BlocConsumer<AppointmentCubit, AppointmentState>(
          listener: (context, state) async {
        if (state is ConfirmRescheduleBookingState) {
          showBottomSheet(
            context: context,
            builder: (context) {
              return const DateSelectionBottomSheet(isReschedule: true,);
            },
          );
        }
        if (state is SuccessRescheduleBookingState) {
          showDialog(
            context: context,
            builder: (context) {
              return const RescheduleCompletedPopup();
            },
          );
        }
        if (state is CancelBookingState) {
          showDialog(
            context: context,
            builder: (context) {
              return const RescheduleCompletedPopup(isCancelBooking: true,);
            },
          );
        }
      }, builder: (context, state) {
        return Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColors.kLightGray,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Expanded(
                      child: ActionItem(
                          title: 'Upcoming', onTap: () {}, selected: true)),
                  Expanded(
                      child: ActionItem(
                          title: 'History', onTap: () {}, selected: false)),
                ],
              ),
            ),
            20.heightSpace,
            Expanded(
                child: (appointmentCubit.subServicesBooked.isNotEmpty)
                    ? ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: appointmentCubit.subServicesBooked.length,
                        itemBuilder: (context, index) {
                          final subServiceModel =
                              appointmentCubit.subServicesBooked[index];
                          return BookingItem(item: subServiceModel);
                          return CartItemWidget(
                            item: subServiceModel,
                            showBookButton: true,
                            isCheckout: false,
                          );
                        },
                      )
                    : EmptyBooking())
          ],
        );
      }),
    );
  }
}
