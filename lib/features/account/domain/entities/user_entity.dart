import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_entity.g.dart';

@JsonSerializable()
class UserEntity extends Equatable {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'mobile')
  final String mobile;
  @JsonKey(name: 'additional_mobile')
  final String additionalMobile;
  @JsonKey(name: 'first_name')
  final String firstName;
  @JsonKey(name: 'last_name')
  final String lastName;
  @JsonKey(name: 'date_of_birth')
  final String dateBirth;
  @JsonKey(name: 'gender')
  final String gender;
  @JsonKey(name: 'token')
  final String token;
  @JsonKey(name: 'remember_me')
  final bool rememberMe;

  const UserEntity(
      {required this.id,
      required this.mobile,
      required this.additionalMobile,
      required this.firstName,
      required this.lastName,
      required this.dateBirth,
      required this.gender,
      required this.token,
      required this.rememberMe});

  @override
  List<Object?> get props => [
        id,
        mobile,
        additionalMobile,
        firstName,
        lastName,
        dateBirth,
        gender,
        token,
        rememberMe
      ];
}
