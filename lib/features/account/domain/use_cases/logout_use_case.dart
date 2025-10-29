
import 'package:in_time_app/core/utils/type_def.dart';
import 'package:in_time_app/core/utils/use_case.dart';
import 'package:in_time_app/features/account/domain/repositories/create_account_repo.dart';

class LogoutUseCase extends UseCaseWithoutParams {
  final CreateAccountRepo _repo;

  LogoutUseCase(this._repo);

  @override
  FutureResult call() async{
    return _repo.logout();
  }
}
