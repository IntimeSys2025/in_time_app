import 'package:in_time_app/core/utils/type_def.dart';
import 'package:in_time_app/core/utils/use_case.dart';
import 'package:in_time_app/features/account/data/models/arguments/reset_passwprd_params.dart';
import 'package:in_time_app/features/account/domain/repositories/create_account_repo.dart';

class ResetPasswordUseCas extends UseCaseWithParams<dynamic, ResetPasswordParams> {
  final CreateAccountRepo _repo;
  ResetPasswordUseCas(this._repo);

  @override
  FutureResult call(ResetPasswordParams params) {
    return _repo.resetPassword(params: params);
  }

}
