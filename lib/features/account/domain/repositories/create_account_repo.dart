import 'package:in_time_app/core/utils/type_def.dart';
import 'package:in_time_app/features/account/data/models/arguments/login_params.dart';
import 'package:in_time_app/features/account/data/models/arguments/register_params.dart';
import 'package:in_time_app/features/account/data/models/user_model.dart';

import '../../data/models/arguments/reset_passwprd_params.dart';
import '../../data/models/arguments/verify_code_params.dart';

abstract class CreateAccountRepo {
  FutureResult<String> register({required RegisterParams params});
  FutureResult<UserModel> login({required LoginParams params});
  FutureResult<String> forgetPassword({required String phone});
  FutureResult<String> verifyCode({required VerifyCodeParams params});
  FutureResult<String> resetPassword({required ResetPasswordParams params});
  FutureResult<String> logout();
  FutureResult<String> getCheckTenant({required String tenantId});

}
