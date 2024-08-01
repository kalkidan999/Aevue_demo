// ignore_for_file: constant_identifier_names

import 'package:dio/dio.dart';

import '../utils/utils.dart';

class CustomDioInterceptor extends Interceptor {
  // final Connectivity connectivity = Connectivity();

  CustomDioInterceptor();

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    printDebug("Request sent: ${options.method} ${options.path}");
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    printDebug(
        "Response received: ${response.statusCode} ${response.statusMessage}  ${response.realUri}");
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    printDebug("Response received: ${err.message} ${err.type} ");
    return super.onError(err, handler);
  }
}

class ErrorHandler implements Exception {
  final String message;

  const ErrorHandler(this.message);
}
