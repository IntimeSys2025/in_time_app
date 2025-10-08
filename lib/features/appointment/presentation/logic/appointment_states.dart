part of 'appointment_cubit.dart';

sealed class AppointmentState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class AppointmentInitial extends AppointmentState {}

final class ShowDateSelectorStates extends AppointmentState {}

final class RefreshCartScreenState extends AppointmentState {}

final class GetAvailableAppointmentInDateLoadingState
    extends AppointmentState {}

final class GetAvailableAppointmentInDateSuccessState
    extends AppointmentState {}

final class GetAvailableAppointmentInDateFailureState
    extends AppointmentState {}

class UpdateSelectedTimeState extends AppointmentState {}

class ConfirmDateAndTimeFailureState extends AppointmentState {
  final String message;

  ConfirmDateAndTimeFailureState({required this.message});

  @override
  List<Object?> get props => [message];
}

class ConfirmDateAndTimeSuccessState extends AppointmentState {}

class ConfirmRescheduleBookingState extends AppointmentState {}

class SuccessRescheduleBookingState extends AppointmentState {}

class CancelBookingState extends AppointmentState {}
