import 'package:dio/dio.dart';

abstract class ApiConsumer {
  late final Dio dio;
  Future<Response> get(
      {required String path,
      Object? data,
      Map<String, dynamic>? queryParameters,});

  Future<Response> post(
      {required String path,
      Object? body,
      Map<String, dynamic>? queryParameters,});

  Future<Response> put(
      {required String path,
      Object? body,
      Map<String, dynamic>? queryParameters});

  Future<Response> patch(
      {required String path,
      Object? body,
      Map<String, dynamic>? queryParameters});

  Future<Response> delete(
      {required String path,
      Object? data,
      Map<String, dynamic>? queryParameters});
}
