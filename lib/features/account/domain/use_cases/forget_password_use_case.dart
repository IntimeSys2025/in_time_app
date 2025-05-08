import 'package:in_time_app/core/utils/type_def.dart';
import 'package:in_time_app/core/utils/use_case.dart';
import 'package:in_time_app/features/account/domain/repositories/create_account_repo.dart';

class ForgetPasswordUseCas extends UseCaseWithParams<dynamic, String> {
  final CreateAccountRepo _repo;
  ForgetPasswordUseCas(this._repo);
  @override
  FutureResult call(String params) {
    return _repo.forgetPassword(phone: params);
  }
}
