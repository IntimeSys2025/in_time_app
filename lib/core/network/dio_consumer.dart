import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:in_time_app/core/network/end_points.dart';
import 'package:in_time_app/core/utils/app_constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../error/failure.dart';
import '../error/remote_exception_handler.dart';
import '../utils/api_type.dart';
import 'api_consumer.dart';

class DioConsumer implements ApiConsumer {
  final Dio providerDio;
  final Dio tenantDio;
  DioConsumer({required this.providerDio, required this.tenantDio}) {
    /// init provider url
    (providerDio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      final client = HttpClient();
      client.badCertificateCallback = (cert, host, port) => true;
      return client;
    };

    providerDio.options
      ..baseUrl = EndPoints.baseUrl
      ..headers = {
        // 'accept': 'application/json',
        'accept': 'multipart/form-data',
        // 'content-type': 'application/json',
        'Access-control-Allow-Origin': '*'
      }
      ..sendTimeout = const Duration(seconds: 200)
      ..receiveTimeout = const Duration(seconds: 200);

    ///add authorization token
    providerDio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        if (AppConstants.userToken != '') {
          options.headers['Authorization'] = 'Bearer ${AppConstants.userToken}';

        }
        return handler.next(options);
      },
    ));


    /// Add pretty DioLogger to log all the requests and responses
    if (!kReleaseMode) {
      providerDio.interceptors.addAll([
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
        )
      ]);
    }

    /// init tenant url
    (tenantDio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      final client = HttpClient();
      client.badCertificateCallback = (cert, host, port) => true;
      return client;
    };

    tenantDio.options
      ..baseUrl = EndPoints.tenantBaseUrl
      ..headers = {
        // 'accept': 'application/json',
        'accept': 'multipart/form-data',
        // 'content-type': 'application/json',
        'Access-control-Allow-Origin': '*',
        'audience' : 'user'
      }
      ..sendTimeout = const Duration(seconds: 200)
      ..receiveTimeout = const Duration(seconds: 200);

    ///add authorization token
    tenantDio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        if (AppConstants.userToken != '') {
          options.headers['Authorization'] = 'Bearer ${AppConstants.userToken}';

        }
        return handler.next(options);
      },
    ));


    /// Add pretty DioLogger to log all the requests and responses
    if (!kReleaseMode) {
      tenantDio.interceptors.addAll([
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
        )
      ]);
    }
  }
  Dio _getDio(ApiType apiType) {
    switch (apiType) {
      case ApiType.provider:
        return providerDio;
      case ApiType.tenant:
      default:
        return tenantDio;
    }
  }

  @override
  Future<Response> get(
      {required String path,
      Object? data,
      Map<String, dynamic>? queryParameters,
        ApiType apiType = ApiType.provider}) async {
    try {
      // final response =
      //     await dio.get(path, data: data, queryParameters: queryParameters);
      // return response;
      final response = await _getDio(apiType).get(
          path,
          queryParameters: queryParameters,
          data: data
      );
      return response;

    } on DioException catch (error) {
      throw ServerFailure(
          message: RemoteExceptionHandler.handleException(error),
          statusCode: error.response?.statusCode ?? -1);
    }
  }

  // @override
  // Future<Response> put(
  //     {required String path,
  //     Object? body,
  //     Map<String, dynamic>? queryParameters}) async {
  //   try {
  //     final response =
  //         await dio.put(path, data: body, queryParameters: queryParameters);
  //     return response;
  //   } on DioException catch (error) {
  //     throw ServerFailure(
  //         message: RemoteExceptionHandler.handleException(error),
  //         statusCode: error.response?.statusCode ?? -1);
  //   }
  // }
  //
  // @override
  // Future<Response> delete(
  //     {required String path,
  //     Object? data,
  //     Map<String, dynamic>? queryParameters}) async {
  //   try {
  //     final response =
  //         await dio.delete(path, data: data, queryParameters: queryParameters);
  //     return response;
  //   } on DioException catch (error) {
  //     throw ServerFailure(
  //         message: RemoteExceptionHandler.handleException(error),
  //         statusCode: error.response?.statusCode ?? -1);
  //   }
  // }

  // @override
  // Future<Response> patch(
  //     {required String path,
  //     Object? body,
  //     Map<String, dynamic>? queryParameters}) {
  //   // TODO: implement patch
  //   throw UnimplementedError();
  // }

  @override
  Future<Response> post(
      {required String path,
      Object? body,
      Map<String, dynamic>? queryParameters,
        ApiType apiType = ApiType.provider}) async {
    try {

      // final response =
      //     await dio.post(path, queryParameters: queryParameters, data: body);
      // return response;
      final response = await _getDio(apiType).post(
          path,
          queryParameters: queryParameters,
          data: body
      );
      return response;
    } on DioException catch (error) {
      throw ServerFailure(
          message: RemoteExceptionHandler.handleException(error),
          statusCode: error.response?.statusCode ?? -1);
    }
  }

  // @override
  // Dio dio = Dio();
}
