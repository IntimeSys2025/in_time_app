import 'package:in_time_app/core/network/api_consumer.dart';
import 'package:in_time_app/core/utils/api_type.dart';
import 'package:in_time_app/features/account/data/models/user_model.dart';
import 'package:in_time_app/features/profile/data/models/arguments/update_profile_params.dart';
import 'package:in_time_app/features/profile/data/models/help_center_model.dart';
import 'package:in_time_app/features/profile/data/models/privacy_policy_model.dart';
import 'package:in_time_app/features/profile/data/models/terms_conditions_model.dart';

import '../../../../core/network/end_points.dart';
import '../models/arguments/upload_profile_pic_params.dart';

abstract class ProfileRemoteDataSource {
  Future<ContentPagesModel> getTermsCondition();
  Future<ContentPagesModel> getPrivacyPolicy();
  Future<List<HelpCenterModel>> getHelpCenter();
  Future<ContentPagesModel> getTermsConditionInTime();
  Future<ContentPagesModel> getPrivacyPolicyInTime();
  Future<List<HelpCenterModel>> getHelpCenterInTime();
  Future<UserModel> updateProfile({required UpdateProfileParams params});
  Future<UserModel> uploadProfilePic({required UploadProfilePicParams params});
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
    final response = await _apiConsumer.post(path: EndPoints.updateProfile,
    body: params.toJson());
    return UserModel.fromJson(response.data['data']['user']);
  }

  @override
  Future<UserModel> uploadProfilePic({required UploadProfilePicParams params}) async{
    final response = await _apiConsumer.post(path: EndPoints.uploadProfilePic,
        body: params.profilePicture);
    return UserModel.fromJson(response.data['data']['user']);
  }

  @override
  Future<List<HelpCenterModel>> getHelpCenterInTime()async {
    final response = await _apiConsumer.get(path: EndPoints.getHelpCenterTenant,apiType: ApiType.tenant);
    final List<HelpCenterModel> helpCenterData = [];
    for (var element in response.data['data']) {
      helpCenterData.add(HelpCenterModel.fromJson(element));
    }
    return helpCenterData;
  }

  @override
  Future<ContentPagesModel> getPrivacyPolicyInTime() async{
    final response = await _apiConsumer.get(path: EndPoints.getPrivacyPolicyTenant,apiType: ApiType.tenant);
    return ContentPagesModel.fromJson(response.data['data']);
  }

  @override
  Future<ContentPagesModel> getTermsConditionInTime() async{
    final response = await _apiConsumer.get(path: EndPoints.getTermsConditionTenant,apiType: ApiType.tenant);
    return ContentPagesModel.fromJson(response.data['data']);
  }
}
