import 'dart:io';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:in_time_app/core/utils/app_constants.dart';
import 'package:in_time_app/features/account/domain/use_cases/logout_use_case.dart';
import 'package:in_time_app/features/profile/data/models/arguments/update_profile_params.dart';
import 'package:in_time_app/features/profile/data/models/arguments/upload_profile_pic_params.dart';
import 'package:in_time_app/features/profile/data/models/help_center_model.dart';
import 'package:in_time_app/features/profile/domain/use_case/get_help_center_intime_use_case.dart';
import 'package:in_time_app/features/profile/domain/use_case/get_help_center_use_case.dart';
import 'package:in_time_app/features/profile/domain/use_case/get_privacy_intime_use_case.dart';
import 'package:in_time_app/features/profile/domain/use_case/get_privacy_use_case.dart';
import 'package:in_time_app/features/profile/domain/use_case/get_terms_intime_use_case.dart';
import 'package:in_time_app/features/profile/domain/use_case/get_terms_use_case.dart';
import 'package:in_time_app/features/profile/domain/use_case/update_profile_use_case.dart';
import 'package:in_time_app/features/profile/domain/use_case/upload_profile_pic_use_case.dart';
import 'package:intl_phone_field/phone_number.dart';
import '../../../../core/storage/secure_storage.dart';
import '../../data/models/terms_conditions_model.dart';
part 'profile_states.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final TermsConditionsUseCase _termsConditionsUseCase;
  final PrivacyPolicyUseCase _privacyPolicyUseCase;
  final HelpCenterUseCase _helpCenterUseCase;
  final TermsConditionInTimesUseCase _termsConditionInTimesUseCase;
  final PrivacyPolicyInTimeUseCase _privacyPolicyInTimeUseCase;
  final HelpCenterInTimeUseCase _helpCenterInTimeUseCase;
  final LogoutUseCase _logoutUseCase;
  final UpdateProfileUseCase _updateProfileUseCase;
  final UploadProfilePicUseCase _uploadProfilePicUseCase;
  ProfileCubit(
      this._termsConditionsUseCase,
      this._privacyPolicyUseCase,
      this._helpCenterUseCase,
      this._logoutUseCase,
      this._updateProfileUseCase,
      this._uploadProfilePicUseCase,
      this._termsConditionInTimesUseCase,
      this._privacyPolicyInTimeUseCase,
      this._helpCenterInTimeUseCase)
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

  // ContentPagesModel? termsConditions;
  // ContentPagesModel? termsConditionsInTime;

  /// store T&C for provider, tenant
  List<ContentPagesModel> contentPageList = [];

  void getTermsConditions() async {
    emit(GetContentPagesLoading());
    contentPageList = [];
    final result = await Future.wait(
        [_termsConditionsUseCase.call(), _termsConditionInTimesUseCase.call()]);
    for (var element in result) {
      element.fold(
        (l) {
          emit(GetContentPagesFailure());
        },
        (success) {
          contentPageList.add(success);
        },
      );
    }
    emit(GetContentPagesSuccess(
        title: 'Terms & Conditions', contents: contentPageList));
  }

  void getPrivacyPolicy() async {
    emit(GetContentPagesLoading());
    contentPageList = [];
    final result = await Future.wait(
        [_privacyPolicyUseCase.call(), _privacyPolicyInTimeUseCase.call()]);
    for (var element in result) {
      element.fold(
        (l) {
          emit(GetContentPagesFailure());
        },
        (success) {
          contentPageList.add(success);
        },
      );
    }
    emit(GetContentPagesSuccess(
        title: 'Privacy & Policy', contents: contentPageList));
  }
  // List<HelpCenterModel> helpCenterData = [];

  void getHelpCenter() async {
    emit(GetContentPagesLoading());
    List<HelpCenterModel> tenantData = [];
    List<HelpCenterModel> inTimeData = [];
    final result = await Future.wait(
        [_helpCenterUseCase.call(), _helpCenterInTimeUseCase.call()]);
    result.first.fold(
      (failure) {
        emit(GetContentPagesFailure());
      },
      (success) {
        tenantData = success;
      },
    );
    result.last.fold(
          (failure) {
        emit(GetContentPagesFailure());
      },
          (success) {
        inTimeData = success;
      },
    );

    // final result = await _helpCenterUseCase.call();
    // result.fold(
    //   (failure) {
    //     emit(GetContentPagesFailure());
    //   },
    //   (success) {
    //     emit(GetHelpCenterSuccess(tenantData: success));
    //     // emit(GetContentPagesSuccess(title: 'Privacy & Policy',content: success));
    //   },
    // );

    emit(GetHelpCenterSuccess(tenantData: tenantData, inTimeData: inTimeData));
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
    if (oldPasswordController.text == newPasswordController.text) {
      // emit(CreateAccountInitial());
      emit(ResetPasswordFailureState(
          errorMessage: 'Old and new passwords cannot be the same'));
      return;
    }
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
        emit(ResetPasswordFailureState(
            errorMessage: "The given data was invalid."));
      },
      (success) {
        debugPrint('Update profile:: $success');
        emit(ResetPasswordSuccessState(successMessage: 'Password updated'));
      },
    );
  }

  final TextEditingController searchQController = TextEditingController();
  void searchHelpCenter() {}

  /// select profile pic from gallery
  File? imageFile;
  final picker = ImagePicker();
  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      emit(InitialProfileState());
      emit(SelectedProfilePicState(image: imageFile!));
    }

    // emit(PickedImageState());
  }

  void updateProfilePic() async {
    emit(UploadProfilePicLoadingState());

    emit(UploadProfilePicLoadingState());
    if (imageFile == null) {
      debugPrint('No image selected.');
      return;
    }

    String fileName = imageFile!.path.split('/').last;
    FormData formData = FormData.fromMap({
      // 'id': int.parse(userId!),
      'image':
          await MultipartFile.fromFile(imageFile!.path, filename: fileName),
    });

    final result = await _uploadProfilePicUseCase(
      UploadProfilePicParams(profilePicture: formData),
    );
    result.fold(
      (failure) {
        // emit(UploadProfilePicFailureState(errorMessage: failure.message));
        emit(UploadProfilePicFailureState(
            errorMessage:
                'Failed to upload profile image, Choose another one'));
      },
      (user) {
        emit(UploadProfilePicSuccessState());
      },
    );
  }

  @override
  Future<void> close() {
    contentPageList = [];
    oldPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    dateOfBirthController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    return super.close();
  }
}
