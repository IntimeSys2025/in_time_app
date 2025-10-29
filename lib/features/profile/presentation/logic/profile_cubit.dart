import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_time_app/core/utils/app_constants.dart';
import 'package:in_time_app/features/account/domain/use_cases/logout_use_case.dart';
import 'package:in_time_app/features/profile/data/models/help_center_model.dart';
import 'package:in_time_app/features/profile/domain/use_case/get_help_center_use_case.dart';
import 'package:in_time_app/features/profile/domain/use_case/get_privacy_use_case.dart';
import 'package:in_time_app/features/profile/domain/use_case/get_terms_use_case.dart';

import '../../data/models/terms_conditions_model.dart';
part 'profile_states.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final TermsConditionsUseCase _termsConditionsUseCase;
  final PrivacyPolicyUseCase _privacyPolicyUseCase;
  final HelpCenterUseCase _helpCenterUseCase;
  final LogoutUseCase _logoutUseCase;
  ProfileCubit(this._termsConditionsUseCase, this._privacyPolicyUseCase,
      this._helpCenterUseCase, this._logoutUseCase)
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
    final result = await _logoutUseCase.call();
    result.fold(
      (failure) {},
      (success) {
        AppConstants.userToken =='';
        AppConstants.isLoggedIn = false;
        emit(LogoutSuccessState(message: success));
      },
    );
  }
}
