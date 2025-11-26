import 'package:equatable/equatable.dart';
import 'package:in_time_app/features/home/data/models/partner_details_model.dart';
import 'package:in_time_app/features/home/data/models/partner_model.dart';

import '../../data/models/sub_service_model.dart';

sealed class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class HomeInitial extends HomeState {}

final class GetCategoriesSuccessState extends HomeState {
  GetCategoriesSuccessState();
}

final class GetSlidersSuccessState extends HomeState {
  GetSlidersSuccessState();
}

final class GetHomeDataLoadingState extends HomeState {
  GetHomeDataLoadingState();
}

final class GetServicesSuccessState extends HomeState {
  GetServicesSuccessState();
}

final class GetSubServicesLoadingState extends HomeState {
  GetSubServicesLoadingState();
}

final class GetSubServicesSuccessState extends HomeState {
  final SubServiceModel subServiceModel;
  GetSubServicesSuccessState({required this.subServiceModel});
}

final class FilterServices extends HomeState {
  FilterServices();
}

final class ToggleViewAllServices extends HomeState {
  ToggleViewAllServices();
}

final class GetPartnerLoadingState extends HomeState{

}
final class GetPartnerSuccessState extends HomeState {
  final List<PartnerModel> partners;
  GetPartnerSuccessState({required this.partners});
}

final class GetPartnerFailureState extends HomeState {
  final String errorMessage;
  GetPartnerFailureState({required this.errorMessage});
}

final class GetPartnerDetailsLoadingState extends HomeState {
  GetPartnerDetailsLoadingState();
}

final class GetPartnerDetailsSuccessState extends HomeState {
  final PartnerDetailsModel partnerDetails;
  GetPartnerDetailsSuccessState({required this.partnerDetails});
}

final class GetPartnerDetailsFailureState extends HomeState {
  final String errorMessage;
  GetPartnerDetailsFailureState({required this.errorMessage});
}
