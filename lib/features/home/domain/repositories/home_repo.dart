import 'package:in_time_app/features/home/data/models/category_model.dart';
import 'package:in_time_app/features/home/data/models/slider_model.dart';
import 'package:in_time_app/features/home/data/models/sub_service_model.dart';
import '../../../../core/utils/type_def.dart';
import '../../data/models/appointment_model.dart';
import '../../data/models/service_model.dart';

abstract class HomeRepo {
  FutureResult<List<CategoryModel>> getCategories();
  FutureResult<List<SliderModel>> getSliders();
  FutureResult<List<ServiceModel>> getServices();
  FutureResult<SubServiceModel> getSubServices({required int id});
  FutureResult<List<AppointmentModel>> getAvailableAppointments({required int id});
}