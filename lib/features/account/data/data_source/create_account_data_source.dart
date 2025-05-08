import 'package:flutter/material.dart';
import 'package:in_time_app/core/network/api_consumer.dart';
import 'package:in_time_app/core/network/end_points.dart';
import 'package:in_time_app/features/account/data/models/arguments/login_params.dart';
import 'package:in_time_app/features/account/data/models/arguments/register_params.dart';
import 'package:in_time_app/features/account/data/models/arguments/verify_code_params.dart';
import 'package:in_time_app/features/account/data/models/user_model.dart';

import '../models/arguments/reset_passwprd_params.dart';

abstract class CreateAccountDataSource {
  Future<String> register({required RegisterParams params});
  Future<UserModel> login({required LoginParams params});
  Future<String> forgetPassword({required String phone});
  Future<String> verifyCode({required VerifyCodeParams params});
  Future<String> resetPassword({required ResetPasswordParams params});
}

class CreateAccountDataSourceImpl implements CreateAccountDataSource {
  final ApiConsumer _apiConsumer;
  const CreateAccountDataSourceImpl(this._apiConsumer);

  @override
  Future<UserModel> login({required LoginParams params}) async {
    final response =
        await _apiConsumer.post(path: EndPoints.login, body: params.toJson());
    // SecureStorage.saveToken(response.data['data']['token']);
    return UserModel.fromJson(response.data['data']['user']);
  }

  @override
  Future<String> register({required RegisterParams params}) async {
    final response = await _apiConsumer.post(
        path: EndPoints.register, body: params.toJson());

    // SecureStorage.saveToken(response.data['data']['token']);
    // AppConstants.userToken = response.data['data']['token'];
    return response.data['message'];
  }

  @override
  Future<String> forgetPassword({required String phone}) async {
    final response = await _apiConsumer
        .post(path: EndPoints.forgetPassword, body: {'mobile': phone});
    debugPrint('forgetPassword response: ${response.data}');
    return response.data['data']['code'].toString();
  }

  @override
  Future<String> verifyCode({required VerifyCodeParams params}) async {
    final response = await _apiConsumer.post(
        path: EndPoints.verifyCode, body: params.toJson());
    return response.data['data']['token'];
  }

  @override
  Future<String> resetPassword({required ResetPasswordParams params}) async {
    final response = await _apiConsumer.post(
        path: EndPoints.resetPassword, body: params.toJson());
    return response.data['message'];
  }
}
