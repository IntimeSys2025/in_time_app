import 'package:in_time_app/features/account/domain/entities/user_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';
@JsonSerializable(explicitToJson: true)
class UserModel extends UserEntity {
  const UserModel(
      {required super.id,
        required super.username,
        required super.countryCode,
        required super.phone,
        required super.email,
        required super.userRole,
        required super.userType,
        required super.updatedAt,
        required super.createdAt});
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
