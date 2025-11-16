import 'package:dartz/dartz.dart';
import 'package:in_time_app/core/utils/type_def.dart';
import 'package:in_time_app/features/account/data/models/user_model.dart';
import 'package:in_time_app/features/profile/data/data_source/profile_remote_data_source.dart';
import 'package:in_time_app/features/profile/data/models/arguments/update_profile_params.dart';
import 'package:in_time_app/features/profile/data/models/help_center_model.dart';
import 'package:in_time_app/features/profile/data/models/privacy_policy_model.dart';
import 'package:in_time_app/features/profile/data/models/terms_conditions_model.dart';
import 'package:in_time_app/features/profile/domain/repositories/profile_repo.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/network_status.dart';
import '../models/arguments/upload_profile_pic_params.dart';

class ProfileRepoImpl implements ProfileRepo{
  final ProfileRemoteDataSource _profileRemoteDataSource;
  final NetworkStatus _networkStatus;

  const ProfileRepoImpl(this._profileRemoteDataSource, this._networkStatus);

  @override
  FutureResult<List<HelpCenterModel>> getHelpCenter()async {
    try {
      final result = await _profileRemoteDataSource.getHelpCenter();
      return Right(result);
    } on Failure catch (error) {
      return Left(
          ServerFailure(message: error.message, statusCode: error.statusCode));
    }
  }

  @override
  FutureResult<ContentPagesModel> getPrivacyPolicy() async{
    try {
      final result = await _profileRemoteDataSource.getPrivacyPolicy();
      return Right(result);
    } on Failure catch (error) {
      return Left(
          ServerFailure(message: error.message, statusCode: error.statusCode));
    }
  }

  @override
  FutureResult<ContentPagesModel> getTermsConditions() async{
    try {
      final result = await _profileRemoteDataSource.getTermsCondition();
      return Right(result);
    } on Failure catch (error) {
      return Left(
          ServerFailure(message: error.message, statusCode: error.statusCode));
    }
  }

  @override
  FutureResult<UserModel> updateProfile({required UpdateProfileParams params}) async{
    try {
      final result = await _profileRemoteDataSource.updateProfile(params: params);
      return Right(result);
    } on Failure catch (error) {
      return Left(
          ServerFailure(message: error.message, statusCode: error.statusCode));
    }
  }

  @override
  FutureResult<UserModel> uploadProfilePic({required UploadProfilePicParams params}) async{
    try {
      final result = await _profileRemoteDataSource.uploadProfilePic(params: params);
      return Right(result);
    } on Failure catch (error) {
      return Left(
          ServerFailure(message: error.message, statusCode: error.statusCode));
    }
  }



}