import 'package:equatable/equatable.dart';

class VerifyCodeParams extends Equatable {
  final String mobile;
  final String code;

  const VerifyCodeParams({
    required this.mobile,
    required this.code,
  });

  @override
  List<Object?> get props => [mobile, code ];

  Map<String, dynamic> toJson() {
    return {
      'mobile': mobile,
      'code': code,
    };
  }
}
