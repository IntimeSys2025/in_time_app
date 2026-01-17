import 'package:dio/dio.dart';

import '../utils/api_type.dart';

abstract class ApiConsumer {
  // late final Dio dio;
  Future<Response> get(
      {required String path,
      Object? data,
      Map<String, dynamic>? queryParameters,
        ApiType apiType = ApiType.tenant,});

  Future<Response> post(
      {required String path,
      Object? body,
      Map<String, dynamic>? queryParameters,
        ApiType apiType = ApiType.tenant,});

  // Future<Response> put(
  //     {required String path,
  //     Object? body,
  //     Map<String, dynamic>? queryParameters});
  //
  // Future<Response> patch(
  //     {required String path,
  //     Object? body,
  //     Map<String, dynamic>? queryParameters});
  //
  // Future<Response> delete(
  //     {required String path,
  //     Object? data,
  //     Map<String, dynamic>? queryParameters});
}
