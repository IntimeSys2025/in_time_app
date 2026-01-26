part of 'create_account_cubit.dart';

class CreateAccountState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CreateAccountInitial extends CreateAccountState {}

class OTPCodeSentState extends CreateAccountState {}

class VerificationFailedState extends CreateAccountState {
  final String errorMessage;
  VerificationFailedState({required this.errorMessage});
}

// class CreateAccountSuccess extends CreateAccountState {}

// class CreateAccountFailure extends CreateAccountState {}

class RegisterAccountLoadingState extends CreateAccountState {}

class RegisterAccountSuccessState extends CreateAccountState {}

class RegisterAccountFailureState extends CreateAccountState {
  final String errorMessage;
  FailureRegisterModel? failure;
  RegisterAccountFailureState({required this.errorMessage, this.failure});
}

class SignInLoadingState extends CreateAccountState {}

class SignInSuccessState extends CreateAccountState {}

class SignInFailureState extends CreateAccountState {
  final String errorMessage;
  SignInFailureState({required this.errorMessage});
}

class ChangePasswordVisibilityState extends CreateAccountState {
  final bool isVisible;
  ChangePasswordVisibilityState({this.isVisible = false});
}

class ChangRememberMeState extends CreateAccountState {
  final bool isRememberMe;
  ChangRememberMeState({this.isRememberMe = false});
}

class ForgetPasswordLoadingState extends CreateAccountState {}

class ForgetPasswordSuccessState extends CreateAccountState {
  final String successMessage;
  ForgetPasswordSuccessState({required this.successMessage});
}

class ForgetPasswordFailureState extends CreateAccountState {
  final String errorMessage;
  ForgetPasswordFailureState({required this.errorMessage});
}

class VerifyCodeLoadingState extends CreateAccountState {}

class VerifyCodeSuccessState extends CreateAccountState {
  final String successMessage;
  VerifyCodeSuccessState({required this.successMessage});
}

class VerifyCodeFailureState extends CreateAccountState {
  final String errorMessage;
  VerifyCodeFailureState({required this.errorMessage});
}

class CheckTenantIdLoadingState extends CreateAccountState {}

class CheckTenantIdSuccessState extends CreateAccountState {}

class CheckTenantIdFailureState extends CreateAccountState {
  final String errorMessage;
  CheckTenantIdFailureState({required this.errorMessage});
}

// class ResetPasswordLoadingState extends CreateAccountState {}
//
// class ResetPasswordSuccessState extends CreateAccountState {
//   final String successMessage;
//   ResetPasswordSuccessState({required this.successMessage});
// }
//
// class ResetPasswordFailureState extends CreateAccountState {
//   final String errorMessage;
//   ResetPasswordFailureState({required this.errorMessage});
// }
