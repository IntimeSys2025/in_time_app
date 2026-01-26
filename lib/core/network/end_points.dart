sealed class EndPoints {
  // static const String baseUrl = 'https://intime.todobest.online/';
  static const String baseUrl = 'https://srv1136069.hstgr.cloud/';



  static const String login = '/api/user/login';
  static const String register = 'api/user/register';
  static const String forgetPassword = 'api/user/forgetPassword';
  static const String verifyCode = 'api/user/verifyCode';
  static const String resetPassword = 'api/user/resetPassword';
  static const String logout = 'api/user/logout';
  static const String getCategories = 'api/frontend/categories';
  static const String getSliders = 'api/frontend/sliders';
  static const String getServices = 'api/frontend/services';
  static const String getSubServices = 'api/frontend/sub-services';
  static const String getAvailableAppointments =
      'api/frontend/available-appointments';
  static const String getAvailableTimeInDate =
      'api/frontend/available-appointments';
  static const String getPartners = 'api/frontend/partners/list';
  static const String getPartnerDetails = 'api/frontend/partners/details/';

  static const String getTermsCondition =
      'api/frontend/content/terms-conditions';
  static const String getPrivacyPolicy = 'api/frontend/content/privacy-policy';
  static const String getHelpCenter = 'api/frontend/content/help-center';
  static const String updateProfile = 'api/user/updateProfile';
  static const String uploadProfilePic = 'api/user/uploadProfileImage';

  /// tenant
  static const String getTermsConditionTenant = 'api/public/content/terms-conditions';
  static const String getPrivacyPolicyTenant = 'api/public/content/privacy-policy';
  static const String getHelpCenterTenant = 'api/public/content/help-center';
  static const String getCheckTenant = 'api/check-tenant';

}
