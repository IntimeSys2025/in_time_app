import 'package:in_time_app/core/network/api_consumer.dart';
import 'package:in_time_app/features/account/data/models/user_model.dart';
import 'package:in_time_app/features/profile/data/models/arguments/update_profile_params.dart';
import 'package:in_time_app/features/profile/data/models/help_center_model.dart';
import 'package:in_time_app/features/profile/data/models/privacy_policy_model.dart';
import 'package:in_time_app/features/profile/data/models/terms_conditions_model.dart';

import '../../../../core/network/end_points.dart';

abstract class ProfileRemoteDataSource {
  Future<ContentPagesModel> getTermsCondition();
  Future<ContentPagesModel> getPrivacyPolicy();
  Future<List<HelpCenterModel>> getHelpCenter();
  Future<UserModel> updateProfile({required UpdateProfileParams params});
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final ApiConsumer _apiConsumer;
  ProfileRemoteDataSourceImpl(this._apiConsumer);

  @override
  Future<ContentPagesModel> getTermsCondition() async {
    final response = await _apiConsumer.get(path: EndPoints.getTermsCondition);
    return ContentPagesModel.fromJson(response.data['data']);
  }

  @override
  Future<ContentPagesModel> getPrivacyPolicy() async {
    final response = await _apiConsumer.get(path: EndPoints.getPrivacyPolicy);
    return ContentPagesModel.fromJson(response.data['data']);
  }

  @override
  Future<List<HelpCenterModel>> getHelpCenter() async {
    final response = await _apiConsumer.get(path: EndPoints.getHelpCenter);
    final List<HelpCenterModel> helpCenterData = [];
    for (var element in response.data['data']) {
      helpCenterData.add(HelpCenterModel.fromJson(element));
    }
    return helpCenterData;
  }

  @override
  Future<UserModel> updateProfile({required UpdateProfileParams params}) async {
    final response = await _apiConsumer.post(path: EndPoints.updateProfile);
    return UserModel.fromJson(response.data['data']['user']);
  }
}
