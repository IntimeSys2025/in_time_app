import 'package:equatable/equatable.dart';

class RegisterParams extends Equatable {
  final String firstName;
  final String lastName;
  final String mobile;
  final String password;
  final String passwordConfirmation;
  final String dateBirth;
  final String gender;
  // TODO  add image

  const RegisterParams(
      {required this.firstName,
      required this.lastName,
      required this.mobile,
      required this.password,
      required this.passwordConfirmation,
      required this.dateBirth,
      required this.gender});

  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'mobile': mobile,
      'password': password,
      'password_confirmation': passwordConfirmation,
      'date_of_birth': dateBirth,
      'gender': gender
    };
  }

  @override
  List<Object?> get props => [];
}
