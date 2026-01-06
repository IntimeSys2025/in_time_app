import 'package:in_time_app/core/utils/type_def.dart';
import 'package:in_time_app/core/utils/use_case.dart';
import 'package:in_time_app/features/profile/domain/repositories/profile_repo.dart';

class PrivacyPolicyInTimeUseCase extends UseCaseWithoutParams {
  final ProfileRepo _profileRepo;
  PrivacyPolicyInTimeUseCase(this._profileRepo);

  @override
  FutureResult call() {
    return _profileRepo.getPrivacyPolicyInTime();
  }
}
