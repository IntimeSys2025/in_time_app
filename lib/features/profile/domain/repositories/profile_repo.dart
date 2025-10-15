import 'package:in_time_app/core/utils/type_def.dart';
import 'package:in_time_app/features/profile/data/models/help_center_model.dart';
import 'package:in_time_app/features/profile/data/models/privacy_policy_model.dart';
import 'package:in_time_app/features/profile/data/models/terms_conditions_model.dart';

abstract class ProfileRepo{
  FutureResult<ContentPagesModel> getTermsConditions();
  FutureResult<ContentPagesModel> getPrivacyPolicy();
  FutureResult<List<HelpCenterModel>> getHelpCenter();
}