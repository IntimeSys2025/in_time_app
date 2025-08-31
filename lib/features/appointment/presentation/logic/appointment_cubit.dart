import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_time_app/features/home/data/models/available_times_in_date_model.dart';
import 'package:in_time_app/features/home/domain/use_cases/get_appointment_in_date.dart';
import '../../../home/data/models/appointment_model.dart';
import '../../../home/data/models/sub_service_model.dart';
import '../../../home/domain/use_cases/appointments_use_case.dart';
part 'appointment_states.dart';

class AppointmentCubit extends Cubit<AppointmentState> {
  final AppointmentsUseCas _appointmentsUseCas;
  final GetAvailableTimesInDateUseCase _getAvailableTimesInDateUseCase;

  AppointmentCubit(
      this._appointmentsUseCas, this._getAvailableTimesInDateUseCase)
      : super(AppointmentInitial());

  bool showDateSelector = false;

  // void toggleDateSelector() {
  //   showDateSelector = true;
  //   // calculateTotalPrice();
  //   emit(ShowDateSelectorStates());
  // }
  bool showBottomSheet = false;
  void toggleShowBottomSheet() {
    showBottomSheet = !showBottomSheet;
    emit(ShowDateSelectorStates());
  }

  List<SubServiceModel> subServicesBooked = [];
  void addSubServiceBooked({required SubServiceModel subService}) {
    debugPrint('subService:::: ${subService.toJson()},');
    int index1 = subServicesBooked.indexWhere(
      (element) => element.service.id == subService.service.id,
    );
    if (index1 != -1) {
      // subServicesBooked[index1].subServices.addAll(subService.subServices);
      int index = subServicesBooked[index1].subServices.indexWhere(
            (element) => element.id == subService.subServices.first.id,
      );
      if (index != -1) {
        subServicesBooked[index1].subServices.addAll(subService.subServices);
      } else {
        subServicesBooked[index1].subServices.addAll(subService.subServices);
      }
    } else {
      subServicesBooked.add(subService);
    }
  }
  void removeSubServiceBooked({required int serviceId, required int subServiceId}) {
    int index = subServicesBooked.indexWhere(
          (element) => element.service.id == serviceId,
    );
    debugPrint('index: $index');
    if (index != -1) {
      subServicesBooked[index].subServices.removeWhere((element) => element.id == subServiceId,);
      debugPrint('subServicesBooked: ${subServicesBooked.first.subServices},');
    } else {
      // subServicesBooked.add(subService);
      // emit(AddSubServiceBookedState());
    }
  }
  void removeServiceFromCart({required int serviceId}) {
    subServicesBooked.removeWhere((element) => element.service.id == serviceId,);
    debugPrint('removeSubServicesBooked: ${subServicesBooked},');
    emit(RefreshCartScreenState());
  }
  double totalPrice = 0.0;
  void calculateTotalPriceForService({required SubServiceModel service}) {
    totalPrice = 0;
    // for (var service in subServicesBooked) {
      for (var subService in service.subServices) {
        totalPrice += subService.price;
      }
    // }
    // emit(CalculateTotalPriceState(totalPrice: totalPrice));
  }

  List<AvailableAppointmentModel> availableAppointments = [];
  Map<DateTime, List> eventsList = {};

  Future<void> getAvailableAppointments(int id) async {
    final result = await _appointmentsUseCas.call(id);
    result.fold(
      (failure) {
        // emit(HomeError(failure.message));
      },
      (appointmentsData) {
        availableAppointments = appointmentsData;
        for (var element in availableAppointments) {
          eventsList.putIfAbsent(
              DateTime.parse(element.startDateTime), () => ['1']);
        }
      },
    );
  }

  List<AvailableTimesInDateModel> times = [];
  DateTime? selectedDate;
  AvailableTimesInDateModel? selectedTime;

  Future<void> getAvailableTimesInDate(
      {int id = 1, required DateTime date}) async {
    selectedDate = date;
    emit(GetAvailableAppointmentInDateLoadingState());

    final result = await _getAvailableTimesInDateUseCase.call({
      'id': id,
      'date': DateFormat('yyyy-MM-dd').format(date),
    });
    result.fold(
      (failure) {
        emit(GetAvailableAppointmentInDateFailureState());

        // emit(HomeError(failure.message));
      },
      (success) {
        debugPrint('success: $success');
        times = success;
        emit(GetAvailableAppointmentInDateSuccessState());
      },
    );
  }

   String? selectedTimeFormat12Hours;

  // String setSelectedTimeFormat12Hours(String time) {
  //   DateTime dateTime = DateTime.parse("$dateFormat ${time.startTime}");
  //   String timeFormat = DateFormat('h:mm a').format(dateTime);
  // }
  void setTime({required AvailableTimesInDateModel time , required String selectedTimeFormatted}) async {
    selectedTime = time;
    selectedTimeFormat12Hours = selectedTimeFormatted;
    if(selectedService != null){
      selectedService?.selectedTimeFormat12Hours = selectedTimeFormat12Hours;

    }
    emit(AppointmentInitial());
    emit(UpdateSelectedTimeState());
  }

  bool showGoToCartButton = false;
  void confirmDateAndTime() {
    if (selectedDate == null) {
      emit(ConfirmDateAndTimeFailureState(
          message: 'Please select a valid date'));
      return;
    }
    if (selectedTime == null) {
      emit(ConfirmDateAndTimeFailureState(
          message: 'Please select a valid time'));
      return;
    }
    if (selectedDate != null && selectedTime != null) {
      showGoToCartButton = true;
      if(selectedService != null){
        selectedService?.selectedDate = selectedDate;
        selectedService?.selectedTime = selectedTime;
      }


      // toggleShowBottomSheet();
      emit(ConfirmDateAndTimeSuccessState());
    }
  }

  SubServiceModel? selectedService;
  void setSelectedService({required SubServiceModel service}){
    selectedService = service;
    calculateTotalPriceForService(service: service);
  }
}
