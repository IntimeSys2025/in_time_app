import 'package:in_time_app/core/utils/type_def.dart';
import 'package:in_time_app/core/utils/use_case.dart';
import 'package:in_time_app/features/profile/data/models/arguments/upload_profile_pic_params.dart';
import '../repositories/profile_repo.dart';

class UploadProfilePicUseCase extends UseCaseWithParams<dynamic,UploadProfilePicParams>{
  final ProfileRepo _repo;
  UploadProfilePicUseCase(this._repo);

  @override
  FutureResult call(UploadProfilePicParams params) {
   return _repo.uploadProfilePic(params: params);
  }
}