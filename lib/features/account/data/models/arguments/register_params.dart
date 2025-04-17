import 'package:equatable/equatable.dart';

class RegisterParams extends Equatable {
  final String name;
  final String countryCode;
  final String phone;
  final String email;
  final String password;
  // TODO  add image

  const RegisterParams({
    required this.name,
    required this.countryCode,
    required this.phone,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'country_code': countryCode,
      'phone': phone,
      'email': email,
      'password': password,
      'image': null,
    };
  }
  @override
  List<Object?> get props => [];
}
