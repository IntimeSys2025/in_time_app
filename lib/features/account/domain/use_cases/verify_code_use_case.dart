import 'package:in_time_app/core/utils/type_def.dart';
import 'package:in_time_app/core/utils/use_case.dart';
import 'package:in_time_app/features/account/data/models/arguments/verify_code_params.dart';
import 'package:in_time_app/features/account/domain/repositories/create_account_repo.dart';

class VerifyCodeUseCas extends UseCaseWithParams<dynamic, VerifyCodeParams> {
  final CreateAccountRepo _repo;
  VerifyCodeUseCas(this._repo);
  @override
  FutureResult call(VerifyCodeParams params) {
    return _repo.verifyCode(params: params);
  }
}
