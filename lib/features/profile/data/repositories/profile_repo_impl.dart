import 'package:dartz/dartz.dart';
import 'package:in_time_app/core/utils/type_def.dart';
import 'package:in_time_app/features/profile/data/data_source/profile_remote_data_source.dart';
import 'package:in_time_app/features/profile/data/models/help_center_model.dart';
import 'package:in_time_app/features/profile/data/models/privacy_policy_model.dart';
import 'package:in_time_app/features/profile/data/models/terms_conditions_model.dart';
import 'package:in_time_app/features/profile/domain/repositories/profile_repo.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/network_status.dart';

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


}