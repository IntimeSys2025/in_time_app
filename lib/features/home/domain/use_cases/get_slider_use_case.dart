import 'package:in_time_app/core/utils/type_def.dart';
import 'package:in_time_app/core/utils/use_case.dart';
import '../repositories/home_repo.dart';

class GetSliderUseCase extends UseCaseWithoutParams {
  final HomeRepo _repo;
  GetSliderUseCase(this._repo);
  @override
  FutureResult call() {
    return _repo.getSliders();
  }
}
