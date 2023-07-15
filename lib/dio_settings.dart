import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioSettings {

  DioSettings(){
    setup();
  }

  Dio dio = Dio(BaseOptions(
      baseUrl: "https://api.thecatapi.com/v1/images",
      contentType: 'application/json',
      connectTimeout: const Duration(milliseconds: 20000),
      receiveTimeout: const Duration(milliseconds: 2000)));

  void setup() async {
    final interceptors = dio.interceptors;
    interceptors.clear();

    final logInterceptors = LogInterceptor(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true);
    final headerInterceptors = QueuedInterceptorsWrapper(
      onRequest: (options, handler) => handler.next(options),
      onError: (DioException error, handler) {
        handler.next(error);
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
    );
    interceptors.addAll([if (kDebugMode) logInterceptors, headerInterceptors]);
  }
}
