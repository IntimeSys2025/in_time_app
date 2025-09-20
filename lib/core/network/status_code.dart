sealed class StatusCode {
  static const int ok = 200;
  static const int noContent = 201;

  static const int badRequest = 400;
  static const int unauthorized = 401;
  static const int forbidden = 403;
  static const int notFound = 404;
  static const int conflict = 409;
  static const int noInternet = 100;
  static const int internalServerError = 500;
  static const int unprocessableEntity = 422;
}
