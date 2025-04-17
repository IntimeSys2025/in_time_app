import 'package:in_time_app/core/utils/type_def.dart';
import 'package:in_time_app/features/account/data/models/arguments/login_params.dart';
import 'package:in_time_app/features/account/data/models/arguments/register_params.dart';
import 'package:in_time_app/features/account/data/models/user_model.dart';

abstract class CreateAccountRepo {
  FutureResult<UserModel> register({required RegisterParams params});
  FutureResult<UserModel> login({required LoginParams params});
}
