import 'package:in_time_app/core/utils/type_def.dart';
import 'package:in_time_app/core/utils/use_case.dart';
import 'package:in_time_app/features/profile/data/models/arguments/update_profile_params.dart';
import 'package:in_time_app/features/profile/domain/repositories/profile_repo.dart';

class UpdateProfileUseCase
    extends UseCaseWithParams<dynamic, UpdateProfileParams> {
  final ProfileRepo _repo;

  UpdateProfileUseCase(this._repo);

  @override
  FutureResult call(UpdateProfileParams params) async {
    return _repo.updateProfile(params: params);
  }
}
