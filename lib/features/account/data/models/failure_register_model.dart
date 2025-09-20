// import 'package:equatable/equatable.dart';
//
// class FailureRegisterModel extends Equatable {
//   final String message;
//   final String nameError;
//   final String mobileError;
//   final String passwordError;
//   final String dateBirthError;
//   const FailureRegisterModel({
//     required this.message,
//     required this.nameError,
//     required this.mobileError,
//     required this.passwordError,
//     required this.dateBirthError,
//   });
//   @override
//   List<Object?> get props => [
//     message,
//     nameError,
//     mobileError,
//     passwordError,
//     dateBirthError
//   ];
// }

import 'package:equatable/equatable.dart';

class FailureRegisterModel extends Equatable {
  const FailureRegisterModel({
    required this.message,
    required this.errors,
  });

  final String? message;
  final Errors? errors;

  FailureRegisterModel copyWith({
    String? message,
    Errors? errors,
  }) {
    return FailureRegisterModel(
      message: message ?? this.message,
      errors: errors ?? this.errors,
    );
  }

  factory FailureRegisterModel.fromJson(Map<String, dynamic> json){
    return FailureRegisterModel(
      message: json["message"],
      errors: json["errors"] == null ? null : Errors.fromJson(json["errors"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "message": message,
    "errors": errors?.toJson(),
  };

  @override
  List<Object?> get props => [
    message, errors, ];
}

class Errors extends Equatable {
  Errors({
     required this.firstName,
    required this.mobile,
    required this.password,
    required this.dateOfBirth,
  });

   List<String> firstName = [];
   List<String> mobile = [];
   List<String> password = [];
   List<String> dateOfBirth = [];

  Errors copyWith({
    List<String>? firstName,
    List<String>? mobile,
    List<String>? password,
    List<String>? dateOfBirth,
  }) {
    return Errors(
      firstName: firstName ?? this.firstName,
      mobile: mobile ?? this.mobile,
      password: password ?? this.password,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
    );
  }

  factory Errors.fromJson(Map<String, dynamic> json){
    return Errors(
      firstName: json["first_name"] == null ? [] : List<String>.from(json["first_name"]!.map((x) => x)),
      mobile: json["mobile"] == null ? [] : List<String>.from(json["mobile"]!.map((x) => x)),
      password: json["password"] == null ? [] : List<String>.from(json["password"]!.map((x) => x)),
      dateOfBirth: json["date_of_birth"] == null ? [] : List<String>.from(json["date_of_birth"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
    "first_name": firstName.map((x) => x).toList(),
    "mobile": mobile.map((x) => x).toList(),
    "password": password.map((x) => x).toList(),
    "date_of_birth": dateOfBirth.map((x) => x).toList(),
  };

  @override
  List<Object?> get props => [
    firstName, mobile, password, dateOfBirth, ];
}
