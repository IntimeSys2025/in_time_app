import 'package:in_time_app/core/utils/type_def.dart';
import 'package:in_time_app/core/utils/use_case.dart';
import 'package:in_time_app/features/home/domain/repositories/home_repo.dart';

class SubServiceUseCase extends UseCaseWithParams<dynamic, int> {
  final HomeRepo _repo;

  SubServiceUseCase(this._repo);

  @override
  FutureResult call(int params) {
    return _repo.getSubServices(id: params);
  }
}
