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
    final data = <String, dynamic>{};

    if (firstName != null && firstName!.isNotEmpty) {
      data['first_name'] = firstName;
    }
    if (lastName != null && lastName!.isNotEmpty) {
      data['last_name'] = lastName;
    }
    if (mobile != null && mobile!.isNotEmpty) {
      data['mobile'] = mobile;
    }
    if (additionalMobile != null && additionalMobile!.isNotEmpty) {
      data['additional_mobile'] = additionalMobile;
    }
    if (password != null && password!.isNotEmpty) {
      data['password'] = password;
    }
    if (oldPassword != null && oldPassword!.isNotEmpty) {
      data['old_password'] = oldPassword;
    }
    if (dateBirth != null && dateBirth!.isNotEmpty) {
      data['date_of_birth'] = dateBirth;
    }
    if (gender != null && gender!.isNotEmpty) data['gender'] = gender;

    return data;
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
