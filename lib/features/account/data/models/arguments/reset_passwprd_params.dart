import 'package:equatable/equatable.dart';

class ResetPasswordParams extends Equatable {
  final String token;
  final String password;
  final String passwordConfirmation;

  const ResetPasswordParams({
    required this.token,
    required this.passwordConfirmation,
    required this.password,
  });

  @override
  List<Object?> get props => [token, passwordConfirmation, password];

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'password': password,
      'password_confirmation': passwordConfirmation,
    };
  }
}
