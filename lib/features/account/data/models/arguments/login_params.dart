import 'package:equatable/equatable.dart';

class LoginParams extends Equatable {
  final String mobile;
  final String password;
  final bool rememberMe;

  const LoginParams({
  required this.mobile,
    required this.password,
    required this.rememberMe
  });
  Map<String, dynamic> toJson() {
    return {
      'mobile': mobile,
      'password': password,
      'remember_me': rememberMe
    };
  }
  @override
  List<Object?> get props => [mobile, password, rememberMe];
}
