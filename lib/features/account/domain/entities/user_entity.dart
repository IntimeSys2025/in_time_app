import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_entity.g.dart';

@JsonSerializable()
class UserEntity extends Equatable {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'username')
  final String username;
  @JsonKey(name: 'country_code')
  final String countryCode;
  @JsonKey(name: 'phone')
  final String phone;
  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'user_role')
  final int userRole;
  @JsonKey(name: 'user_type')
  final int userType;
  @JsonKey(name: 'updated_at')
  final String updatedAt;
  @JsonKey(name: 'created_at')
  final String createdAt;

  const UserEntity({
    required this.id,
    required this.username,
    required this.countryCode,
    required this.phone,
    required this.email,
    required this.userRole,
    required this.userType,
    required this.updatedAt,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
        username,
        countryCode,
        phone,
        email,
        userRole,
        userType,
        updatedAt,
        createdAt,
        id
      ];
}
