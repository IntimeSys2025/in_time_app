import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:in_time_app/core/network/end_points.dart';
import 'package:in_time_app/core/utils/app_constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../error/failure.dart';
import '../error/remote_exception_handler.dart';
import 'api_consumer.dart';

class DioConsumer implements ApiConsumer {
  DioConsumer(String baseUrl) {
    /// init tenant url
    (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      final client = HttpClient();
      client.badCertificateCallback = (cert, host, port) => true;
      return client;
    };
    debugPrint('X-Tenant-Id :: ${AppConstants.providerId}');

    dio.options
      ..baseUrl = EndPoints.baseUrl
      ..headers = {
        // 'accept': 'application/json',
        'accept': 'multipart/form-data',
        // 'content-type': 'application/json',
        'Access-control-Allow-Origin': '*',
        'audience': 'user',
        'X-Tenant-Id': AppConstants.providerId
      }
      ..sendTimeout = const Duration(seconds: 200)
      ..receiveTimeout = const Duration(seconds: 200);

    ///add authorization token
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        if (AppConstants.userToken != '') {
          options.headers['Authorization'] = 'Bearer ${AppConstants.userToken}';
        }
        return handler.next(options);
      },
    ));

    /// Add pretty DioLogger to log all the requests and responses
    if (!kReleaseMode) {
      dio.interceptors.addAll([
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
        )
      ]);
    }
  }

  @override
  Future<Response> get({
    required String path,
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response =
          await dio.get(path, data: data, queryParameters: queryParameters);
      return response;
    } on DioException catch (error) {
      throw ServerFailure(
          message: RemoteExceptionHandler.handleException(error),
          statusCode: error.response?.statusCode ?? -1);
    }
  }

  @override
  Future<Response> put(
      {required String path,
      Object? body,
      Map<String, dynamic>? queryParameters}) async {
    try {
      final response =
          await dio.put(path, data: body, queryParameters: queryParameters);
      return response;
    } on DioException catch (error) {
      throw ServerFailure(
          message: RemoteExceptionHandler.handleException(error),
          statusCode: error.response?.statusCode ?? -1);
    }
  }

  @override
  Future<Response> delete(
      {required String path,
      Object? data,
      Map<String, dynamic>? queryParameters}) async {
    try {
      final response =
          await dio.delete(path, data: data, queryParameters: queryParameters);
      return response;
    } on DioException catch (error) {
      throw ServerFailure(
          message: RemoteExceptionHandler.handleException(error),
          statusCode: error.response?.statusCode ?? -1);
    }
  }

  @override
  Future<Response> patch(
      {required String path,
      Object? body,
      Map<String, dynamic>? queryParameters}) {
    // TODO: implement patch
    throw UnimplementedError();
  }

  @override
  Future<Response> post({
    required String path,
    Object? body,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response =
          await dio.post(path, queryParameters: queryParameters, data: body);
      return response;
    } on DioException catch (error) {
      throw ServerFailure(
          message: RemoteExceptionHandler.handleException(error),
          statusCode: error.response?.statusCode ?? -1);
    }
  }

  @override
  Dio dio = Dio();
}
