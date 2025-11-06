import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_time_app/core/utils/app_constants.dart';
import 'package:in_time_app/features/account/domain/use_cases/logout_use_case.dart';
import 'package:in_time_app/features/profile/data/models/arguments/update_profile_params.dart';
import 'package:in_time_app/features/profile/data/models/help_center_model.dart';
import 'package:in_time_app/features/profile/domain/use_case/get_help_center_use_case.dart';
import 'package:in_time_app/features/profile/domain/use_case/get_privacy_use_case.dart';
import 'package:in_time_app/features/profile/domain/use_case/get_terms_use_case.dart';
import 'package:in_time_app/features/profile/domain/use_case/update_profile_use_case.dart';
import 'package:intl_phone_field/phone_number.dart';

import '../../../../core/storage/secure_storage.dart';
import '../../data/models/terms_conditions_model.dart';
part 'profile_states.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final TermsConditionsUseCase _termsConditionsUseCase;
  final PrivacyPolicyUseCase _privacyPolicyUseCase;
  final HelpCenterUseCase _helpCenterUseCase;
  final LogoutUseCase _logoutUseCase;
  final UpdateProfileUseCase _updateProfileUseCase;
  ProfileCubit(this._termsConditionsUseCase, this._privacyPolicyUseCase,
      this._helpCenterUseCase, this._logoutUseCase, this._updateProfileUseCase)
      : super(InitialProfileState());

  bool rememberPass = false;
  bool faceId = false;
  bool biometric = false;

  void toggleSwitch(String key, bool value) {
    // final updatedState = Map<String, bool>.from(state);
    // updatedState[key] = value;
    if (key == 'rememberPassword') {
      rememberPass = value;
      // return;
    } else if (key == 'faceId') {
      faceId = value;
      // return;
    } else if (key == 'biometricId') {
      biometric = value;
      // return;
    }
    emit(InitialProfileState());
    emit(UpdateSecurityKey());
  }

  void getTermsConditions() async {
    emit(GetContentPagesLoading());
    final result = await _termsConditionsUseCase.call();
    result.fold(
      (failure) {
        emit(GetContentPagesFailure());
      },
      (success) {
        emit(GetContentPagesSuccess(
            title: 'Terms & Conditions', content: success));
      },
    );
  }

  void getPrivacyPolicy() async {
    emit(GetContentPagesLoading());
    final result = await _privacyPolicyUseCase.call();
    result.fold(
      (failure) {
        emit(GetContentPagesFailure());
      },
      (success) {
        emit(GetContentPagesSuccess(
            title: 'Privacy & Policy', content: success));
      },
    );
  }
  // List<HelpCenterModel> helpCenterData = [];

  void getHelpCenter() async {
    emit(GetContentPagesLoading());
    final result = await _helpCenterUseCase.call();
    result.fold(
      (failure) {
        emit(GetContentPagesFailure());
      },
      (success) {
        // helpCenterData = success;
        emit(GetHelpCenterSuccess(data: success));
        // emit(GetContentPagesSuccess(title: 'Privacy & Policy',content: success));
      },
    );
  }

  void logout() async {
    emit(LogoutLoadingState());
    final result = await _logoutUseCase.call();
    result.fold(
      (failure) {
        // debugPrint('ggg: ${failure.message}');
        emit(LogoutFailureState(message: failure.message));
      },
      (success) {
        AppConstants.userToken == '';
        AppConstants.isLoggedIn = false;
        saveStringValue(key: 'user_id', value: '');
        saveStringValue(key: 'user_name', value: '');
        saveStringValue(key: 'mobile', value: '');
        saveStringValue(key: 'token', value: '');
        // AppConstants.isLoggedIn = await getBoolValue(key: 'loggedIn');
        // AppConstants.userToken = (await getStringValue(key: 'token')) ?? '';
        // AppConstants.fullName = await getStringValue(key: 'user_name') ?? '';

        emit(LogoutSuccessState(message: success));
      },
    );
  }

  TextEditingController firstNameController =
      TextEditingController(text: AppConstants.fullName.split(' ').first);
  TextEditingController lastNameController =
      TextEditingController(text: AppConstants.fullName.split(' ').last);
  TextEditingController dateOfBirthController =
      TextEditingController(text: AppConstants.dateOfBirth);
  PhoneNumber? mobile;
  PhoneNumber? additionalMobile;

  void updateProfile() async {
    emit(UpdateProfileLoadingState());
    final result = await _updateProfileUseCase.call(UpdateProfileParams(
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      dateBirth: dateOfBirthController.text,
      // mobile: ,
      gender: "female",
    ));
    result.fold(
      (failure) {
        emit(UpdateProfileFailureState(errorMessage: failure.message));
      },
      (success) {
        debugPrint('Update profile:: ${success}');
        emit(UpdateProfileSuccessState());
      },
    );
  }

  final resetPasswordFormKey = GlobalKey<FormState>();
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  void resetPassword() async {
    emit(ResetPasswordLoadingState());
    // emit(ResetPasswordSuccessState());
    if (newPasswordController.text != confirmPasswordController.text) {
      // emit(CreateAccountInitial());
      emit(ResetPasswordFailureState(errorMessage: 'passwords do not match'));
      return;
    }
    final result = await _updateProfileUseCase.call(UpdateProfileParams(
      oldPassword: oldPasswordController.text,
      password: newPasswordController.text
      // firstName: firstNameController.text,
      // lastName: lastNameController.text,
      // dateBirth: dateOfBirthController.text,
      // // mobile: ,
      // gender: "female",
    ));
    result.fold(
      (failure) {
        emit(ResetPasswordFailureState(errorMessage: "The given data was invalid."));
      },
      (success) {
        debugPrint('Update profile:: ${success}');
        emit(ResetPasswordSuccessState(successMessage: 'Password updated'));
      },
    );
  }
}
