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

class CreateAccountSuccess extends CreateAccountState {}

class CreateAccountFailure extends CreateAccountState {}

class RegisterAccountLoadingState extends CreateAccountState {}

class RegisterAccountSuccessState extends CreateAccountState {}

class RegisterAccountFailureState extends CreateAccountState {
  final String errorMessage;
  RegisterAccountFailureState({required this.errorMessage});
}

class SignInLoadingState extends CreateAccountState {}

class SignInSuccessState extends CreateAccountState {}

class SignInFailureState extends CreateAccountState {
  final String errorMessage;
  SignInFailureState({required this.errorMessage});
}
