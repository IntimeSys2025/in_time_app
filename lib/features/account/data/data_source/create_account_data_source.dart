
import 'package:in_time_app/core/network/api_consumer.dart';
import 'package:in_time_app/core/network/end_points.dart';
import 'package:in_time_app/core/storage/secure_storage.dart';
import 'package:in_time_app/features/account/data/models/arguments/login_params.dart';
import 'package:in_time_app/features/account/data/models/arguments/register_params.dart';
import 'package:in_time_app/features/account/data/models/user_model.dart';

abstract class CreateAccountDataSource {
  Future<UserModel> register({required RegisterParams params});
  Future<UserModel> login({required LoginParams params});
}

class CreateAccountDataSourceImpl implements CreateAccountDataSource {
  final ApiConsumer _apiConsumer;
  const CreateAccountDataSourceImpl(this._apiConsumer);

  @override
  Future<UserModel> login({required LoginParams params}) async {
    final response = await _apiConsumer.post(path: EndPoints.login,
        body: params.toJson());
    SecureStorage.saveToken(response.data['data']['token']);
    return UserModel.fromJson(response.data['data']['user']);
  }

  @override
  Future<UserModel> register({required RegisterParams params}) async {
    final response = await _apiConsumer.post(path: EndPoints.register,
        body: params.toJson());

    // SecureStorage.saveToken(response.data['data']['token']);
    // AppConstants.userToken = response.data['data']['token'];
    return UserModel.fromJson(response.data['data']['user']);
  }
}
