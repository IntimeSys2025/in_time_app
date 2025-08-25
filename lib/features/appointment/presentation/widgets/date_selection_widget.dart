import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_time_app/core/utils/app_colors.dart';
import 'package:in_time_app/features/appointment/presentation/logic/appointment_cubit.dart';
import 'package:in_time_app/features/appointment/presentation/widgets/payment_summary_widget.dart';

import 'date_selection_bottom_sheet.dart';

class DateTimeSelectorWidget extends StatelessWidget {
  const DateTimeSelectorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appointmentCubit = BlocProvider.of<AppointmentCubit>(context);
    return ListTile(
      tileColor: AppColors.white,
      leading: const Icon(Icons.calendar_today,
          color: Colors.green), // Icon matching the image
      title: const Text(
        'Select Date & Time',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
      subtitle: Text(
        // (appointmentCubit.selectedDate != null && appointmentCubit.selectedTime != null)
        (appointmentCubit.selectedService != null && appointmentCubit.selectedService!.selectedTime != null)
            ? '${DateFormat('MMMM d, yyyy').format(appointmentCubit.selectedService!.selectedDate!)} - ${appointmentCubit.selectedTimeFormat12Hours}'
            : 'Choose date & time to book',
        style: TextStyle(
          fontSize: 14,
          color: Colors.grey[600],
        ),
      ),
      trailing:
          const Icon(Icons.chevron_right, color: Colors.grey), // Right arrow
      onTap: () {
        appointmentCubit.toggleShowBottomSheet();
        debugPrint('DateTimeSelectorWidget tapped1');
        // DateSelectionBottomSheet();
        showBottomSheet(
          context: context,
          builder: (context) {
            return const DateSelectionBottomSheet();
          },
        );
      }, // Triggered when the widget is tapped
    );
  }
}
