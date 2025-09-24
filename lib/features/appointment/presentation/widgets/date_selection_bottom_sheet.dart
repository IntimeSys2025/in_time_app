import 'dart:collection';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_time_app/core/helpers/extension.dart';
import 'package:in_time_app/core/shared_widgets/app_button_widget.dart';
import 'package:in_time_app/core/utils/app_colors.dart';
import 'package:in_time_app/core/utils/app_font_size.dart';
import 'package:in_time_app/features/appointment/presentation/logic/appointment_cubit.dart';
import 'package:in_time_app/features/appointment/presentation/widgets/available_time_widget.dart';
import 'package:table_calendar/table_calendar.dart';

class DateSelectionBottomSheet extends StatefulWidget {
  const DateSelectionBottomSheet({super.key});

  @override
  State<DateSelectionBottomSheet> createState() =>
      _DateSelectionBottomSheetState();
}

class _DateSelectionBottomSheetState extends State<DateSelectionBottomSheet> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  // final Set<DateTime> _highlightedDays = {
  //   DateTime(2025, 8, 15),
  //   DateTime(2025, 8, 22),
  //   DateTime(2025, 8, 25),
  // };

  int getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
  }

  @override
  Widget build(BuildContext context) {
    final appointmentCubit = BlocProvider.of<AppointmentCubit>(context);
    final _events = LinkedHashMap<DateTime, List>(
      equals: isSameDay,
      hashCode: getHashCode,
    )..addAll(appointmentCubit.eventsList);

    List getEventForDay(DateTime day) {
      return _events[day] ?? [];
    }

    return BlocBuilder<AppointmentCubit, AppointmentState>(
      buildWhen: (previous, current) =>
          current is GetAvailableAppointmentInDateLoadingState ||
          current is GetAvailableAppointmentInDateFailureState ||
          current is GetAvailableAppointmentInDateSuccessState ||
          current is UpdateSelectedTimeState,
      builder: (context, state) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.96,
          minChildSize: 0.5,
          maxChildSize: 0.96,
          builder: (context, scrollController) {
            // return Text('data');
            return Container(
              decoration: const BoxDecoration(color: AppColors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.moreLightGrey,
                      blurRadius: 10,
                      spreadRadius: 10,
                      offset: Offset(0.0, 1.0)
                    )
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: BlocListener<AppointmentCubit, AppointmentState>(
                    listener: (BuildContext context, AppointmentState state) {
                      if (state is ConfirmDateAndTimeSuccessState) {
                        Navigator.pop(context);
                      } else if (state is ConfirmDateAndTimeFailureState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(state.message),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize
                          .min, // Ensures the sheet only takes needed height
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          'Select Date & Time',
                          style: TextStyle(
                            fontSize: AppFontSize.fontSize18,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        TableCalendar(
                          firstDay: DateTime.now().toUtc(),
                          // lastDay: DateTime.utc(2030, 8, 31),
                          lastDay: DateTime.now().toUtc().add(Duration(days: 365)),
                          eventLoader: getEventForDay,
                          focusedDay: _focusedDay,
                          calendarFormat: _calendarFormat,
                          selectedDayPredicate: (day) {
                            return isSameDay(_selectedDay, day);
                          },
                          onDaySelected: (selectedDay, focusedDay) {
                            debugPrint(
                              'Selected day: ${selectedDay}',
                            );
                            appointmentCubit.getAvailableTimesInDate(
                                date: selectedDay);
                            setState(() {
                              _selectedDay = selectedDay;
                              _focusedDay =
                                  focusedDay; // Update the focused day
                            });
                          },
                          onFormatChanged: (format) {
                            if (_calendarFormat != format) {
                              setState(() {
                                _calendarFormat = format;
                              });
                            }
                          },
                          onPageChanged: (focusedDay) {
                            _focusedDay = focusedDay;
                          },
                          calendarStyle: CalendarStyle(
                            todayDecoration: BoxDecoration(
                              color: Colors.grey[300],
                              shape: BoxShape.circle,
                            ),
                            selectedDecoration: const BoxDecoration(
                              color: AppColors.kGreenButton,
                              shape: BoxShape.circle,
                            ),
                            defaultDecoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            weekendDecoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            holidayDecoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),

                        const Text(
                          'Time for the appointment',
                          style: TextStyle(
                            fontSize: AppFontSize.fontSize18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        10.heightSpace,
                        state is GetAvailableAppointmentInDateLoadingState
                            ? const Center(
                                child: CupertinoActivityIndicator(),
                              )
                            : appointmentCubit.times.isEmpty
                                ? Center(
                                    child:
                                        Text('No available times for this date',
                                            style: TextStyle(
                                              fontSize: AppFontSize.fontSize16,
                                              color: Colors.grey.shade600,
                                            )),
                                  )
                                : Wrap(
                                    children: [
                                      ...List.generate(
                                        appointmentCubit.times.length,
                                        (index) {
                                          final time =
                                              appointmentCubit.times[index];
                                          String dateFormat =
                                              DateFormat('yyyy-MM-dd').format(
                                                  appointmentCubit
                                                          .selectedDate ??
                                                      DateTime.now());
                                          DateTime dateTime = DateTime.parse("$dateFormat ${time.startTime}");
                                          String timeFormat = DateFormat('h:mm a').format(dateTime);

                                          return AvailableTimeWidget(
                                            // time: 'From ${time.startTime} \nTo ${time.endTime}',
                                            // time: time.startTime.toString(),
                                            time: timeFormat,
                                            // isSelected: index == 0 ? true : false,
                                            isSelected: (appointmentCubit
                                                        .selectedTime?.id ??
                                                    -1) ==
                                                time.id,
                                            onTap: () {
                                              appointmentCubit.setTime(
                                                  time: time,
                                                  selectedTimeFormatted:
                                                      timeFormat);
                                            },
                                          );
                                        },
                                      )
                                    ],
                                  ),
                        20.heightSpace,
                        if (appointmentCubit.selectedDate != null &&
                            appointmentCubit.selectedTime != null)
                          Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: AppButtonWidget(
                                  title: 'Confirm',
                                  onPressed: () {
                                    appointmentCubit.confirmDateAndTime();
                                  }))

                        //       await showDatePicker(
                        // context: context,
                        // initialDate: DateTime.now(),
                        // firstDate: DateTime(1900),
                        // lastDate: DateTime.now(),
                        // );
                      ],
                    )),
              ),
            );
          },
        );
      },
    );
  }
}
