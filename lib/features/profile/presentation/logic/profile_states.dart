part of 'profile_cubit.dart';

class ProfileState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialProfileState extends ProfileState {}

class UpdateSecurityKey extends ProfileState {}

class GetContentPagesLoading extends ProfileState {}

class GetContentPagesSuccess extends ProfileState {
  final String title;
  // final ContentPagesModel content;
  List<ContentPagesModel> contents;
  GetContentPagesSuccess({required this.title, required this.contents});
}

class GetContentPagesFailure extends ProfileState {}

class GetHelpCenterSuccess extends ProfileState {
  final List<HelpCenterModel> tenantData;
  final List<HelpCenterModel> inTimeData;
  GetHelpCenterSuccess( {required this.tenantData,required this.inTimeData});
}

class LogoutSuccessState extends ProfileState {
  final String message;
  LogoutSuccessState({required this.message});
}

class LogoutFailureState extends ProfileState {
  final String message;
  LogoutFailureState({required this.message});
}

class LogoutLoadingState extends ProfileState {
  LogoutLoadingState();
}

class UpdateProfileLoadingState extends ProfileState {}

class UpdateProfileSuccessState extends ProfileState {}

class UpdateProfileFailureState extends ProfileState {
  final String errorMessage;
  UpdateProfileFailureState({required this.errorMessage});
}

class ResetPasswordLoadingState extends ProfileState {}

class ResetPasswordSuccessState extends ProfileState {
  final String successMessage;
  ResetPasswordSuccessState({required this.successMessage});
}

class ResetPasswordFailureState extends ProfileState {
  final String errorMessage;
  ResetPasswordFailureState({required this.errorMessage});
}
class SelectedProfilePicState extends ProfileState{
  final File image;
   SelectedProfilePicState({required this.image});
}
class UploadProfilePicLoadingState extends ProfileState{}
class UploadProfilePicSuccessState extends ProfileState{}
class UploadProfilePicFailureState extends ProfileState{
  final String errorMessage;
  UploadProfilePicFailureState({required this.errorMessage});
}
