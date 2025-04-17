
import 'package:in_time_app/core/utils/type_def.dart';
import 'package:in_time_app/core/utils/use_case.dart';
import 'package:in_time_app/features/account/data/models/arguments/register_params.dart';
import 'package:in_time_app/features/account/domain/repositories/create_account_repo.dart';

class RegisterUseCase extends UseCaseWithParams<dynamic, RegisterParams> {
  final CreateAccountRepo _repo;
  RegisterUseCase(this._repo);
  @override
  FutureResult call(RegisterParams params) async{
    return _repo.register(params: params);
  }
}
