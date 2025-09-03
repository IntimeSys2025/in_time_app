import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_time_app/features/home/data/models/category_model.dart';
import 'package:in_time_app/features/home/data/models/partner_model.dart';
import 'package:in_time_app/features/home/data/models/slider_model.dart';
import 'package:in_time_app/features/home/data/models/sub_service_model.dart';
import 'package:in_time_app/features/home/domain/use_cases/appointments_use_case.dart';
import 'package:in_time_app/features/home/domain/use_cases/get_categories_use_case.dart';
import 'package:in_time_app/features/home/domain/use_cases/get_partners_use_case.dart';
import 'package:in_time_app/features/home/domain/use_cases/get_services_use_case.dart';
import 'package:in_time_app/features/home/domain/use_cases/get_slider_use_case.dart';
import 'package:in_time_app/features/home/domain/use_cases/sub_service_use_case.dart';
import 'package:in_time_app/features/home/presentation/logic/home_states.dart';
import '../../data/models/service_model.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetCategoriesUseCase _getCategoriesUseCase;
  final GetSliderUseCase _getSliderUseCase;
  final GetServiceUseCase _getServiceUseCase;
  final SubServiceUseCase _subServiceUseCase;
  final AppointmentsUseCas _appointmentsUseCas;
  final PartnersUseCase _partnersUseCase;
  HomeCubit(
      this._getCategoriesUseCase,
      this._getSliderUseCase,
      this._getServiceUseCase,
      this._subServiceUseCase,
      this._appointmentsUseCas,
      this._partnersUseCase)
      : super(HomeInitial());

  List<CategoryModel> categories = [];

  void getCategories() async {
    emit(GetHomeDataLoadingState());

    // emit(HomeLoading());
    final result = await _getCategoriesUseCase();
    result.fold(
      (failure) {
        // emit(HomeError(failure.message));
      },
      (categoriesData) {
        categories = categoriesData;
        emit(GetCategoriesSuccessState());
        // emit(HomeSuccess(categories));
      },
    );
  }

  int selectedCategoryIndex = -1;
  void changeCategory(int index) {
    selectedCategoryIndex = index;
    debugPrint('Selected Category Index: $selectedCategoryIndex');
    // categories[index].isSelected = !categories[index].isSelected;
    emit(HomeInitial());
    emit(GetCategoriesSuccessState());
  }

  List<SliderModel> sliders = [];

  void getSliders() async {
    emit(GetHomeDataLoadingState());

    final result = await _getSliderUseCase.call();
    result.fold(
      (failure) {
        // emit(HomeError(failure.message));
      },
      (slidersData) {
        sliders = slidersData;
        emit(GetSlidersSuccessState());
      },
    );
  }

  List<ServiceModel> services = [];
  void getServices() async {
    emit(GetHomeDataLoadingState());
    final result = await _getServiceUseCase.call();
    result.fold(
      (failure) {
        // emit(HomeError(failure.message));
      },
      (servicesData) {
        services = servicesData;
        filteredServices = services;
        debugPrint('Services::: ${services.length}');
        emit(GetServicesSuccessState());
      },
    );
  }

  final TextEditingController searchController = TextEditingController();
  List<ServiceModel> filteredServices = [];

  void filterServices() {
    final query = searchController.text.toLowerCase();
    // setState(() {
    filteredServices = services
        .where((item) => item.title.toLowerCase().contains(query))
        .toList();
    // });
    debugPrint('Filtered Items::: ${filteredServices.length}');
    emit(HomeInitial());
    emit(FilterServices());
  }

  SubServiceModel? subService;
  Future<void> getSubServices({required int id}) async {
    emit(GetSubServicesLoadingState());
    final result = await _subServiceUseCase.call(id);
    result.fold(
      (failure) {
        // emit(HomeError(failure.message));
      },
      (subServiceData) {
        subService = subServiceData;
        debugPrint('SubService::: ${subServiceData.toJson()}');
        emit(HomeInitial());
        if (subService != null) {
          emit(GetSubServicesSuccessState(subServiceModel: subService!));
        }
      },
    );
  }

  // Future<void> getAvailableAppointments(int id) async {
  //   final result = await _appointmentsUseCas.call(id);
  //   result.fold(
  //     (failure) {
  //       // emit(HomeError(failure.message));
  //     },
  //     (appointmentsData) {
  //       debugPrint('Appointments::: ${appointmentsData.length}');
  //       // emit(GetSubServicesSuccessState());
  //     },
  //   );
  // }
  bool isViewAllServices = false;
  void toggleViewAllServices() {
    isViewAllServices = true;
    // emit(HomeInitial());
    emit(ToggleViewAllServices());
  }

  List<PartnerModel> partners = [];
  void getPartners() async {
    final result = await _partnersUseCase.call(null);

    result.fold(
      (failure) {
        debugPrint('Failure: ${failure.message}');
      },
      (success) {
        partners = success;
        debugPrint('Success:: ${partners.length}');
      },
    );
  }
}
