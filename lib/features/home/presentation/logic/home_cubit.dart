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
import '../../domain/use_cases/get_partner_details_use_case.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetCategoriesUseCase _getCategoriesUseCase;
  final GetSliderUseCase _getSliderUseCase;
  final GetServiceUseCase _getServiceUseCase;
  final SubServiceUseCase _subServiceUseCase;
  final AppointmentsUseCas _appointmentsUseCas;
  final PartnersUseCase _partnersUseCase;
  final PartnerDetailsUseCase _partnerDetailsUseCase;
  HomeCubit(
      this._getCategoriesUseCase,
      this._getSliderUseCase,
      this._getServiceUseCase,
      this._subServiceUseCase,
      this._appointmentsUseCas,
      this._partnersUseCase,
      this._partnerDetailsUseCase)
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
        // debugPrint('Services::: ${services.length}');
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
  final ScrollController scrollController = ScrollController();
  void scrollToEnd({required double offset}) {
    debugPrint('Scroll to End');
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
        scrollController.animateTo(
          offset,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
      else {
        print('ScrollController is not attached to any scroll views.');
      }
    });
  }
  void toggleViewAllServices() {
    isViewAllServices = true;
    // scrollToEnd(offset: scrollController.position.maxScrollExtent);
    // emit(HomeInitial());
    emit(ToggleViewAllServices());
  }

  List<PartnerModel> partners = [];
  void getPartners() async {
    emit(GetPartnerLoadingState());
    final result = await _partnersUseCase.call(null);

    result.fold(
      (failure) {
        emit(GetPartnerFailureState(errorMessage: failure.message));
        debugPrint('Failure: ${failure.message}');
      },
      (success) {
        partners = success;
        emit(GetPartnerSuccessState(partners: partners));
        debugPrint('Success:: ${partners.length}');
      },
    );
  }

  void getPartnerDetails({required String partnerId}) async {
    emit(GetPartnerDetailsLoadingState());
    final result = await _partnerDetailsUseCase.call(partnerId);

    result.fold(
      (failure) {
        emit(GetPartnerDetailsFailureState(errorMessage: failure.message));

        debugPrint('Failure: ${failure.message}');
      },
      (success) {
        // partners = success;
        emit(GetPartnerDetailsSuccessState(partnerDetails: success));
        filteredServices  = success.services ?? [];
        // debugPrint('Success:: ${success.toJson()}');
      },
    );
    // emit(HomeInitial());
  }
}
