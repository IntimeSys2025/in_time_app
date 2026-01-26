import 'package:in_time_app/core/utils/type_def.dart';
import 'package:in_time_app/core/utils/use_case.dart';

import '../../../profile/domain/repositories/profile_repo.dart';
import '../repositories/create_account_repo.dart';

class CheckTenantUseCas extends UseCaseWithParams<String, String> {
  final CreateAccountRepo _repo;
  CheckTenantUseCas(this._repo);

  @override
  FutureResult<String> call(String params) {
    return _repo.getCheckTenant(tenantId: params);
  }
}
