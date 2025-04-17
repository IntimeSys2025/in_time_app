
import 'package:in_time_app/core/utils/type_def.dart';
import 'package:in_time_app/core/utils/use_case.dart';
import 'package:in_time_app/features/account/data/models/arguments/login_params.dart';
import 'package:in_time_app/features/account/domain/repositories/create_account_repo.dart';

class LoginUseCase extends UseCaseWithParams<dynamic, LoginParams> {
  final CreateAccountRepo _repo;

  LoginUseCase(this._repo);

  @override
  FutureResult call(LoginParams params) async{
    return _repo.login(params: params);
  }
}
