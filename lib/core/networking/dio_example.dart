import 'package:dio/adapter.dart';
import 'package:dio/adapter_browser.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

const int _timeoutDuration = 10000;

Dio configureDio(
  String url,
) {
  final dio = Dio(BaseOptions(
    baseUrl: url,
    connectTimeout: _timeoutDuration,
    receiveTimeout: _timeoutDuration,
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
    },
  ));
  dio.httpClientAdapter = kIsWeb ? BrowserHttpClientAdapter() : DefaultHttpClientAdapter();

  if (kDebugMode) {
    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true, requestHeader: true));
  }

  return dio;
}
