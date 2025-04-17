import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';

import '../localization/locale_keys.g.dart';
import '../network/status_code.dart';

abstract class RemoteExceptionHandler {
  static String handleException(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return LocaleKeys.connectionTimeout.tr();
      case DioExceptionType.sendTimeout:
        return LocaleKeys.sendTimeout.tr();
      case DioExceptionType.receiveTimeout:
        return LocaleKeys.receiveTimeout.tr();
      case DioExceptionType.badResponse:
        switch (error.response?.statusCode) {
          case StatusCode.badRequest:
            return LocaleKeys.badRequest.tr();
          case StatusCode.unauthorized:
            return LocaleKeys.unauthorized.tr();
          case StatusCode.forbidden:
            return LocaleKeys.forbidden.tr();
          case StatusCode.notFound:
            return LocaleKeys.notFound.tr();
          case StatusCode.conflict:
            return LocaleKeys.conflict.tr();
          case StatusCode.internalServerError:
            return LocaleKeys.internalServerError.tr();
          default:
            return LocaleKeys.serverError.tr();
        }
      case DioExceptionType.cancel:
        return LocaleKeys.cancel.tr();
      case DioExceptionType.unknown:
        return LocaleKeys.unknown.tr();
      case DioExceptionType.badCertificate:
        return LocaleKeys.badCertificate.tr();
      case DioExceptionType.connectionError:
        return LocaleKeys.connectionError.tr();
      default:
        return LocaleKeys.unexpectedError.tr();
    }
  }
}
