import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:in_time_app/core/error/failure.dart';
import 'package:in_time_app/core/localization/locale_keys.g.dart';
import 'package:in_time_app/core/network/network_status.dart';
import 'package:in_time_app/core/network/status_code.dart';
import 'package:in_time_app/core/utils/type_def.dart';
import 'package:in_time_app/features/account/data/data_source/create_account_data_source.dart';
import 'package:in_time_app/features/account/data/models/arguments/login_params.dart';
import 'package:in_time_app/features/account/data/models/arguments/register_params.dart';
import 'package:in_time_app/features/account/data/models/user_model.dart';
import 'package:in_time_app/features/account/domain/repositories/create_account_repo.dart';

class CreateAccountRepoImpl implements  CreateAccountRepo {
  final CreateAccountDataSource _remoteDataSource;
  final NetworkStatus _networkStatus;
  CreateAccountRepoImpl(this._remoteDataSource, this._networkStatus);

  @override
  FutureResult<UserModel> login({required LoginParams params}) async{
    if(await _networkStatus.isConnected){
      try{
        final result = await _remoteDataSource.login(params: params);
        return Right(result);
      }on Failure catch(error){
        return Left(ServerFailure(
          message: error.message,
          statusCode: error.statusCode
        ));
      }

    }else{
      return Left(ServerFailure(
        message: LocaleKeys.noInternet.tr(),
        statusCode: StatusCode.noInternet
      ));
    }
  }

  @override
  FutureResult<UserModel> register({required RegisterParams params}) async {
    if (await _networkStatus.isConnected) {
      try {
        final result = await _remoteDataSource.register(params: params);
        return Right(result);
      } on Failure catch (error) {
        return Left(ServerFailure(
            message: error.message, statusCode: error.statusCode));
      }
    } else {
      return Left(ServerFailure(
          message: LocaleKeys.noInternet.tr(),
          statusCode: StatusCode.noInternet));
    }
  }
}
