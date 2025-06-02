import 'package:in_time_app/core/utils/type_def.dart';
import 'package:in_time_app/core/utils/use_case.dart';
import 'package:in_time_app/features/home/domain/repositories/home_repo.dart';

class GetCategoriesUseCase extends UseCaseWithoutParams {
  final HomeRepo _repo;
  GetCategoriesUseCase(this._repo);

  @override
  FutureResult call() {
    return _repo.getCategories();
  }
}
