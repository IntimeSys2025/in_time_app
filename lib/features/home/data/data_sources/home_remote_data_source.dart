import 'package:in_time_app/features/home/data/models/appointment_model.dart';
import 'package:in_time_app/features/home/data/models/category_model.dart';
import 'package:in_time_app/features/home/data/models/service_model.dart';
import 'package:in_time_app/features/home/data/models/slider_model.dart';
import 'package:in_time_app/features/home/data/models/sub_service_model.dart';
import '../../../../core/network/api_consumer.dart';
import '../../../../core/network/end_points.dart';
import '../models/available_times_in_date_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<CategoryModel>> getCategories();
  Future<List<SliderModel>> getSliders();
  Future<List<ServiceModel>> getServices();
  Future<SubServiceModel> getSubServices({required int id});
  Future<List<AvailableAppointmentModel>> getAvailableAppointments(
      {required int id});
  Future<List<AvailableTimesInDateModel>> getAvailableTimesInDate(
      {required Map<String,dynamic> params});
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiConsumer _apiConsumer;

  HomeRemoteDataSourceImpl(this._apiConsumer);

  @override
  Future<List<CategoryModel>> getCategories() async {
    final response = await _apiConsumer.get(path: EndPoints.getCategories);
    final List<CategoryModel> categories = [];
    for (var element in response.data['data']) {
      categories.add(CategoryModel.fromJson(element));
    }
    return categories;
  }

  @override
  Future<List<SliderModel>> getSliders() async {
    final response = await _apiConsumer.get(path: EndPoints.getSliders);
    final List<SliderModel> sliders = [];
    for (var element in response.data['data']) {
      sliders.add(SliderModel.fromJson(element));
    }
    return sliders;
  }

  @override
  Future<List<ServiceModel>> getServices() async {
    final response = await _apiConsumer.get(path: EndPoints.getServices);
    final List<ServiceModel> services = [];
    for (var element in response.data['data']) {
      services.add(ServiceModel.fromJson(element));
    }
    return services;
  }

  @override
  Future<SubServiceModel> getSubServices({required int id}) async {
    final response =
        await _apiConsumer.get(path: '${EndPoints.getSubServices}/$id');
    return SubServiceModel.fromJson(response.data['data']);
  }

  @override
  Future<List<AvailableAppointmentModel>> getAvailableAppointments(
      {required int id}) async {
    final response = await _apiConsumer.get(
        path: '${EndPoints.getAvailableAppointments}/$id');
    final List<AvailableAppointmentModel> appointments = [];
    for (var element in response.data['data']) {
      appointments.add(AvailableAppointmentModel.fromJson(element));
    }
    return appointments;
  }

  @override
  Future<List<AvailableTimesInDateModel>> getAvailableTimesInDate(
      { required Map<String,dynamic> params}) async {
    final response = await _apiConsumer.post(
      path: '${EndPoints.getAvailableTimeInDate}/${params['id']}',
      body: {'date': params['date']},
    );
    final List<AvailableTimesInDateModel> appointments = [];
    for (var element in response.data['data']) {
      appointments.add(AvailableTimesInDateModel.fromJson(element));
    }
    return appointments;
  }
}
