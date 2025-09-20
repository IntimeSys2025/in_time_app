import 'package:in_time_app/core/utils/type_def.dart';
import 'package:in_time_app/core/utils/use_case.dart';
import 'package:in_time_app/features/home/domain/repositories/home_repo.dart';

class PartnerDetailsUseCase extends UseCaseWithParams<dynamic, String> {
  final HomeRepo _repo;
  PartnerDetailsUseCase(this._repo);

  @override
  FutureResult call(String params) {
    return _repo.getPartnerDetails(partnerId: params);
  }
}
