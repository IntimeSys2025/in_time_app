import 'package:in_time_app/core/utils/type_def.dart';
import 'package:in_time_app/core/utils/use_case.dart';
import 'package:in_time_app/features/home/domain/repositories/home_repo.dart';

class GetAvailableTimesInDateUseCase extends UseCaseWithParams<dynamic, Map<String,dynamic>> {
  final HomeRepo _repo;
  GetAvailableTimesInDateUseCase(this._repo);

  @override
  FutureResult call(Map<String, dynamic> params) {
  return _repo.getAvailableTimesInDate(params: params);
  }


}
