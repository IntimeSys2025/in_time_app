import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
class Failure extends Equatable {
  final String message;
  final int statusCode;

  const Failure({required this.message, required this.statusCode});
  @override
  List<Object?> get props => [message, statusCode];
}

@immutable
class ServerFailure extends Failure {
  const ServerFailure({required super.message, required super.statusCode});
}

@immutable
class LocalFailure extends Failure {
  const LocalFailure({required super.message, required super.statusCode});
}
