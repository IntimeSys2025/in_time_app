import 'package:in_time_app/core/utils/type_def.dart';
import 'package:in_time_app/features/account/data/models/user_model.dart';
import 'package:in_time_app/features/profile/data/models/help_center_model.dart';
import 'package:in_time_app/features/profile/data/models/privacy_policy_model.dart';
import 'package:in_time_app/features/profile/data/models/terms_conditions_model.dart';

import '../../data/models/arguments/update_profile_params.dart';
import '../../data/models/arguments/upload_profile_pic_params.dart';

abstract class ProfileRepo{
  FutureResult<ContentPagesModel> getTermsConditions();
  FutureResult<ContentPagesModel> getPrivacyPolicy();
  FutureResult<List<HelpCenterModel>> getHelpCenter();
  FutureResult<ContentPagesModel> getTermsConditionsInTime();
  FutureResult<ContentPagesModel> getPrivacyPolicyInTime();
  FutureResult<List<HelpCenterModel>> getHelpCenterInTime();
  FutureResult<UserModel> updateProfile({required UpdateProfileParams params});
  FutureResult<UserModel> uploadProfilePic({required UploadProfilePicParams params});
}