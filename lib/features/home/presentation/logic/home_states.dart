import 'package:equatable/equatable.dart';

import '../../data/models/sub_service_model.dart';

sealed class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class HomeInitial extends HomeState {}

final class GetCategoriesSuccessState extends HomeState {
  GetCategoriesSuccessState();
}

final class GetSlidersSuccessState extends HomeState{
   GetSlidersSuccessState();
}
final class GetHomeDataLoadingState extends HomeState{
  GetHomeDataLoadingState();
}
final class GetServicesSuccessState extends HomeState{
  GetServicesSuccessState();
}
final class GetSubServicesLoadingState extends HomeState{
  GetSubServicesLoadingState();
}
final class GetSubServicesSuccessState extends HomeState {
  final SubServiceModel subServiceModel;
  GetSubServicesSuccessState({required this.subServiceModel});
}
final class FilterServices extends HomeState{
  FilterServices();
}
