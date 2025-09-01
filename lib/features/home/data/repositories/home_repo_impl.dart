import 'package:dartz/dartz.dart';
import 'package:in_time_app/core/error/failure.dart';
import 'package:in_time_app/core/network/network_status.dart';
import 'package:in_time_app/core/utils/type_def.dart';
import 'package:in_time_app/features/home/data/models/appointment_model.dart';
import 'package:in_time_app/features/home/data/models/available_times_in_date_model.dart';
import 'package:in_time_app/features/home/data/models/category_model.dart';
import 'package:in_time_app/features/home/data/models/partner_model.dart';
import 'package:in_time_app/features/home/data/models/service_model.dart';
import 'package:in_time_app/features/home/data/models/slider_model.dart';
import 'package:in_time_app/features/home/data/models/sub_service_model.dart';
import '../../domain/repositories/home_repo.dart';
import '../data_sources/home_remote_data_source.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSource _remoteDataSource;
  final NetworkStatus _networkStatus;

  HomeRepoImpl(this._remoteDataSource, this._networkStatus);

  @override
  FutureResult<List<CategoryModel>> getCategories() async {
    try {
      final result = await _remoteDataSource.getCategories();
      return Right(result);
    } on Failure catch (error) {
      return Left(
          ServerFailure(message: error.message, statusCode: error.statusCode));
    }
  }

  @override
  FutureResult<List<SliderModel>> getSliders() async {
    try {
      final result = await _remoteDataSource.getSliders();
      return Right(result);
    } on Failure catch (error) {
      return Left(
          ServerFailure(message: error.message, statusCode: error.statusCode));
    }
  }

  @override
  FutureResult<List<ServiceModel>> getServices() async {
    try {
      final result = await _remoteDataSource.getServices();
      return Right(result);
    } on Failure catch (error) {
      return Left(
          ServerFailure(message: error.message, statusCode: error.statusCode));
    }
  }

  @override
  FutureResult<List<AvailableAppointmentModel>> getAvailableAppointments(
      {required int id}) async {
    try {
      final result = await _remoteDataSource.getAvailableAppointments(id: id);
      return Right(result);
    } on Failure catch (error) {
      return Left(
          ServerFailure(message: error.message, statusCode: error.statusCode));
    }
  }

  @override
  FutureResult<SubServiceModel> getSubServices({required int id}) async {
    try {
      final result = await _remoteDataSource.getSubServices(id: id);
      return Right(result);
    } on Failure catch (error) {
      return Left(
          ServerFailure(message: error.message, statusCode: error.statusCode));
    }
  }

  @override
  FutureResult<List<AvailableTimesInDateModel>> getAvailableTimesInDate(
      {required Map<String, dynamic> params}) async {
    try {
      final result =
          await _remoteDataSource.getAvailableTimesInDate(params: params);
      return Right(result);
    } on Failure catch (error) {
      return Left(
          ServerFailure(message: error.message, statusCode: error.statusCode));
    }
  }

  @override
  FutureResult<List<PartnerModel>> getPartners({String? categoryId}) async {
    try {
      final result =
          await _remoteDataSource.getPartners(categoryId: categoryId);
      return Right(result);
    } on Failure catch (error) {
      return Left(
          ServerFailure(message: error.message, statusCode: error.statusCode));
    }
  }
}
