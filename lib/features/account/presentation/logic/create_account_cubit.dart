import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_time_app/core/network/api_consumer.dart';
import 'package:in_time_app/core/utils/app_constants.dart';
import 'package:in_time_app/features/account/data/models/arguments/login_params.dart';
import 'package:in_time_app/features/account/data/models/arguments/verify_code_params.dart';
import 'package:in_time_app/features/account/data/models/failure_register_model.dart';
import 'package:in_time_app/features/account/domain/use_cases/check_tenant_use_case.dart';
import 'package:in_time_app/features/account/domain/use_cases/forget_password_use_case.dart';
import 'package:in_time_app/features/account/domain/use_cases/login_use_case.dart';
import 'package:in_time_app/features/account/domain/use_cases/register_use_case.dart';
import 'package:in_time_app/features/account/domain/use_cases/reset_password.dart';
import 'package:in_time_app/features/account/domain/use_cases/verify_code_use_case.dart';
import 'package:intl_phone_field/phone_number.dart';
import '../../../../core/network/end_points.dart';
import '../../../../core/service_locator/service_locator.dart';
import '../../../../core/services/biometric_service.dart';
import '../../../../core/storage/secure_storage.dart';
import '../../data/models/arguments/register_params.dart';
import '../../data/models/arguments/reset_passwprd_params.dart';
import '../../data/models/user_model.dart';
import 'package:intl/intl.dart';
part 'create_account_state.dart';

class CreateAccountCubit extends Cubit<CreateAccountState> {
  final RegisterUseCase _registerUseCase;
  final LoginUseCase _loginUseCase;
  final ForgetPasswordUseCas _forgetPasswordUseCase;
  final VerifyCodeUseCas _verifyCodeUseCas;
  final ResetPasswordUseCas _resetPasswordUseCas;
  final CheckTenantUseCas _checkTenantUseCas;
  CreateAccountCubit(
      this._registerUseCase,
      this._loginUseCase,
      this._forgetPasswordUseCase,
      this._verifyCodeUseCas,
      this._resetPasswordUseCas,
      this._checkTenantUseCas)
      : super(CreateAccountInitial());
  final phoneNumberFormKey = GlobalKey<FormState>();
  final loginForm = GlobalKey<FormState>();

  /// register form
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  PhoneNumber? signUpPhone;
  TextEditingController passwordSignUpController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController additionalPhoneController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  PhoneNumber? signUpAdditionalPhone;

  String? gender;
  DateTime? dateOfBirth;
  bool termsAccepted = false;
  bool privacyAccepted = false;

  setDateOfBirth(DateTime date) {
    debugPrint('Date time:: $date');
    dateOfBirth = date;
    String formattedDate = DateFormat('yyyy-MM-dd', 'en').format(date);
    // String formattedDate = DateFormat.yMMMMd().format(date);
    dateOfBirthController.text = formattedDate;
  }

  bool availableDate() {
    if (dateOfBirth == null) {
      return false;
    }
    // final today = DateTime.now();
    // final eighteenYearsAgo = DateTime(today.year - 18, today.month, today.day);
    return dateOfBirth!.isBefore(DateTime.now());
  }

  void register() async {
    emit(RegisterAccountLoadingState());

    if (phoneNumberFormKey.currentState!.validate()) {
      if (passwordSignUpController.text != confirmPasswordController.text) {
        emit(CreateAccountInitial());
        emit(RegisterAccountFailureState(
            errorMessage: 'passwords do not match'));
        return;
      }
      if (signUpPhone?.number == null) {
        emit(CreateAccountInitial());
        emit(RegisterAccountFailureState(
            errorMessage: 'Please enter a valid phone number'));
        return;
      }
      if (gender == null) {
        emit(CreateAccountInitial());
        emit(RegisterAccountFailureState(
            errorMessage: 'please choose your gender'));
        return;
      }
      if (!availableDate()) {
        debugPrint('age::: ${availableDate()}');
        emit(CreateAccountInitial());
        emit(RegisterAccountFailureState(
            errorMessage: 'Please enter a valid date of birth'));
        return;
      }
      if (termsAccepted == false) {
        emit(CreateAccountInitial());
        emit(RegisterAccountFailureState(
            errorMessage: 'Please accept the terms and conditions'));
        return;
      }
      if (privacyAccepted == false) {
        emit(CreateAccountInitial());
        emit(RegisterAccountFailureState(
            errorMessage: 'Please accept the privacy policy'));
        return;
      }

      final result = await _registerUseCase.call(
        RegisterParams(
            firstName: firstNameController.text,
            lastName: lastNameController.text,
            mobile: signUpPhone?.completeNumber ?? '',
            password: passwordSignUpController.text,
            passwordConfirmation: confirmPasswordController.text,
            dateBirth: dateOfBirthController.text ?? DateTime.now().toString(),
            gender: gender ?? ''),
      );
      result.fold(
        (failure) {
          final FailureRegisterModel message = failure.message;
          emit(CreateAccountInitial());
          emit(RegisterAccountFailureState(
              errorMessage: message.message ?? 'The given data was invalid.',
              failure: message));
        },
        (user) async {
          loginPhone = signUpPhone;
          passwordController = passwordSignUpController;
          rememberMe = false;

          logIn(fromSignUp: true);

          emit(RegisterAccountSuccessState());
        },
      );

      /// new
      // final Map<String, dynamic> result = await callRegisterApi(
      //     params: RegisterParams(
      //         firstName: firstNameController.text,
      //         lastName: lastNameController.text,
      //         mobile: signUpPhone?.completeNumber ?? '',
      //         password: passwordSignUpController.text,
      //         passwordConfirmation: confirmPasswordController.text,
      //         dateBirth:
      //             dateOfBirthController.text ?? DateTime.now().toString(),
      //         gender: gender ?? ''));
      // if (result["status_code"] == 200) {
      //   loginPhone = signUpPhone;
      //   passwordController = passwordSignUpController;
      //   rememberMe = false;
      //
      //   logIn(fromSignUp: true);
      //   emit(RegisterAccountSuccessState());
      // } else {
      //   final FailureRegisterModel failure =
      //       FailureRegisterModel.fromJson(result["data"]);
      //
      //   emit(CreateAccountInitial());
      //   emit(RegisterAccountFailureState(
      //       errorMessage: failure.message ?? 'The given data was invalid.',
      //       failure: failure));
      // }
    }
  }

  void changePasswordVisibility({required bool isVisible}) {
    emit(ChangePasswordVisibilityState(isVisible: isVisible));
  }

  /// login form
  PhoneNumber? loginPhone;
  // final TextEditingController passwordLoginController = TextEditingController();
  bool rememberMe = false;

  changeRememberMeVal() {
    rememberMe = !rememberMe;
    emit(CreateAccountInitial());
    emit(ChangRememberMeState(isRememberMe: rememberMe));
  }

  TextEditingController passwordController = TextEditingController();
  void logIn({bool? fromSignUp}) async {
    if (loginPhone?.number == null) {
      emit(CreateAccountInitial());
      emit(SignInFailureState(
          errorMessage: 'Please enter a valid phone number'));
      return;
    }
    emit(SignInLoadingState());
    final result = await _loginUseCase.call(LoginParams(
        mobile: loginPhone?.completeNumber ?? '',
        password: passwordController.text,
        rememberMe: rememberMe));
    result.fold(
      (failure) {
        emit(SignInFailureState(
            errorMessage: 'Invalid phone number or password'));
      },
      (success) {
        saveUserData(user: success);
        if (fromSignUp == false || fromSignUp == null) {
          passwordController.clear();
          // loginPhone = PhoneNumber( number: '', countryISOCode: 'EG', countryCode: '+20');
          // loginPhone?.number = '';
          emit(SignInSuccessState());
        }
      },
    );
  }

  void loginUsingBiometric() async {
    /// biometric
    final biometricService = BiometricService();
    try {
      if (await biometricService.canAuthenticate()) {
        final success = await biometricService.authenticate();

        if (success) {
          debugPrint('Biometric succeed');
          emit(SignInSuccessState());
        } else {
          debugPrint('Biometric failed');
          emit(SignInFailureState(errorMessage: 'Try again'));
        }
      }
    } catch (e) {
      debugPrint('Biometric: $e');
    }
  }

  saveUserData({required UserModel user}) async {
    if (rememberMe) {
      saveBoolValue(key: 'loggedIn', value: user.rememberMe);
    }
    saveStringValue(key: 'user_id', value: user.id.toString());
    saveStringValue(
        key: 'user_name', value: '${user.firstName} ${user.lastName}');
    saveStringValue(key: 'mobile', value: user.mobile);
    saveStringValue(key: 'token', value: user.token);
    saveStringValue(key: 'additional_mobile', value: user.additionalMobile);
    saveStringValue(key: 'date_of_birth', value: user.dateBirth);
    AppConstants.isLoggedIn = await getBoolValue(key: 'loggedIn');
    AppConstants.userToken = (await getStringValue(key: 'token')) ?? '';
    AppConstants.fullName = await getStringValue(key: 'user_name') ?? '';
  }

  /// forget password section
  PhoneNumber? forgetPasswordPhone;
  void forgetPassword() async {
    emit(ForgetPasswordLoadingState());
    debugPrint('forgetPasswordPhone:: ${forgetPasswordPhone?.number}');
    if (forgetPasswordPhone?.number != null) {
      final result = await _forgetPasswordUseCase
          .call(forgetPasswordPhone!.completeNumber.toString());
      result.fold(
        (failure) {
          emit(ForgetPasswordFailureState(
              errorMessage: 'The mobile number is not valid'));
        },
        (success) {
          code = success;
          emit(ForgetPasswordSuccessState(
              successMessage:
                  'The Confirmation code has been sent to the mobile you entered'));
        },
      );
    } else {
      emit(ForgetPasswordFailureState(
          errorMessage: 'Please enter phone number'));
    }
  }

  /// verify code
  String? code;
  void verifyCode() async {
    emit(VerifyCodeLoadingState());
    // if (code != null && code!.isNotEmpty && code!.length < 6) {
    final result = await _verifyCodeUseCas.call(VerifyCodeParams(
        mobile: forgetPasswordPhone!.completeNumber.toString(),
        code: code ?? ''));
    result.fold(
      (failure) {
        emit(VerifyCodeFailureState(errorMessage: failure.message));
      },
      (success) {
        AppConstants.userToken = success;
        emit(VerifyCodeSuccessState(successMessage: success));
      },
    );
    // } else {
    //   emit(VerifyCodeFailureState(errorMessage: 'Please enter a valid code'));
    // }
  }

  /// reset password

  final resetPasswordFormKey = GlobalKey<FormState>();
  TextEditingController resetPasswordController = TextEditingController();
  TextEditingController resetConfirmPasswordController =
      TextEditingController();
  // void resetPassword() async {
  //   emit(ResetPasswordLoadingState());
  //   emit(ResetPasswordSuccessState(successMessage: 'success'));
  //   // if (resetPasswordController.text != resetConfirmPasswordController.text) {
  //   //   emit(CreateAccountInitial());
  //   //   emit(ResetPasswordFailureState(errorMessage: 'passwords do not match'));
  //   //   return;
  //   // }
  //   // final result = await _resetPasswordUseCas.call(ResetPasswordParams(
  //   //     password: resetPasswordController.text,
  //   //     passwordConfirmation: resetConfirmPasswordController.text,
  //   //     token: AppConstants.userToken));
  //   // result.fold(
  //   //   (failure) {
  //   //     emit(ResetPasswordFailureState(errorMessage: failure.message));
  //   //   },
  //   //   (success) {
  //   //     emit(ResetPasswordSuccessState(successMessage: success));
  //   //   },
  //   // );
  // }

  /// check tenant Id
  Future<void> checkTenantId({required String tenantId}) async {
    // await ServiceLocator.init();
    emit(CheckTenantIdLoadingState());
    final result = await _checkTenantUseCas.call(tenantId);
    result.fold(
      (failure) {
        emit(CheckTenantIdFailureState(errorMessage: failure.message));
      },
      (success) {
        saveStringValue(key: 'tenant_id', value: success);
        emit(CheckTenantIdSuccessState());
      },
    );
  }
}

// Future<Map<String, dynamic>> callRegisterApi(
//     {required RegisterParams params}) async {
//   final Dio dio = Dio();
//   Response response = await dio
//       .post('${EndPoints.baseUrl}${EndPoints.register}', data: params.toJson());
//   return {"status_code": response.statusCode, "data": response.data};
//   // try {
//   //   return {"status_code": response.statusCode, "data": response.data};
//   //
//   //   print(response.data);
//   // } catch (e) {
//   //   print('Error: $e');
//   //   return {"status_code": 400, "data": "Server Error"};
//   // }
//
//   // final response = await sl<ApiConsumer>()
//   //     .post(path: EndPoints.register, body: params.toJson());
//   // return {"status_code": response.statusCode, "data": response.data};
// }
