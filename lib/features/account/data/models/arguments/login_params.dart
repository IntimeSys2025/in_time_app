import 'package:equatable/equatable.dart';

class LoginParams extends Equatable {
  final String phone;

  const LoginParams({
    required this.phone,
  });
  Map<String, dynamic> toJson() {
    return {
      'phone': phone,
    };
  }
  @override
  List<Object?> get props => [phone];
}
