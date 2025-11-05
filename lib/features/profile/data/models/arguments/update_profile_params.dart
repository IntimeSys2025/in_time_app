import 'package:equatable/equatable.dart';

class UpdateProfileParams extends Equatable {
  final String? firstName;
  final String? lastName;
  final String? mobile;
  final String? additionalMobile;
  final String? password;
  final String? oldPassword;
  final String? dateBirth;
  final String? gender;

  const UpdateProfileParams({
    this.lastName,
    this.mobile,
    this.additionalMobile,
    this.password,
    this.oldPassword,
    this.dateBirth,
    this.gender,
    this.firstName,
  });
  Map<String, dynamic> toJson() {
    return {
      "first_name": firstName,
      "last_name": lastName,
      "mobile": mobile,
      "additional_mobile": additionalMobile,
      "password": password,
      "old_password": oldPassword,
      "date_of_birth": dateBirth //"1993-07-28"
      ,
      "gender": gender
    };
  }

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        mobile,
        additionalMobile,
        password,
        oldPassword,
        dateBirth,
        gender
      ];
}
