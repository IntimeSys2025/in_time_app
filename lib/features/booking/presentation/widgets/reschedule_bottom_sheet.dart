import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_time_app/core/helpers/extension.dart';
import '../../../../core/shared_widgets/app_button_widget.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_font_size.dart';
import '../../../appointment/presentation/logic/appointment_cubit.dart';
import '../../../home/data/models/sub_service_model.dart';

class RescheduleBottomSheet extends StatelessWidget {
  final bool isCancelBooking;
  final SubServiceModel? item;
  const RescheduleBottomSheet({super.key,  this.isCancelBooking = false,  this.item});

  @override
  Widget build(BuildContext context) {
    final appointmentCubit = BlocProvider.of<AppointmentCubit>(context);

    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
                width: 50,
                child: Divider(
                  thickness: 5,
                )),
            10.heightSpace,
             Text(
             isCancelBooking ?'Cancel Booking': 'Reschedule Booking',
              style: const TextStyle(
                  color: AppColors.kGreenButton,
                  fontSize: AppFontSize.fontSize18,
                  fontWeight: FontWeight.w600),
            ),
            20.heightSpace,
             Text(
              'Are you sure want to ${isCancelBooking ? 'cancel' :'reschedule'} your Appointment ?',
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: AppFontSize.fontSize18, fontWeight: FontWeight.w600),
            ),
            20.heightSpace,
             Text(
              '${isCancelBooking ? 'Cancellation':'Reschedule'} fees have to be paid based on the',
              textAlign: TextAlign.center,
            ),
            TextButton(
              child: const Text(
                'provider policy',
                style: TextStyle(decoration: TextDecoration.underline),
              ),
              onPressed: () {},
            ),
            Row(
              children: [
                Expanded(
                  child: AppButtonWidget(
                    title: 'Cancel',
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    borderColor: AppColors.kGreenButton,
                    backgroundColor: AppColors.white,
                    textColor: AppColors.kGreenButton,
                  ),
                ),
                10.widthSpace,
                Expanded(
                  child: AppButtonWidget(
                    title: 'Confirm',
                    onPressed: () {
                      if(isCancelBooking && item!= null){
                        appointmentCubit.cancelBooking(item: item);
                      }else{
                        appointmentCubit.rescheduleBooking();

                      }
                      Navigator.pop(context);

                    },
                    backgroundColor: AppColors.kGreenButton,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
