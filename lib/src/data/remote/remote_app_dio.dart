import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final remoteAppDioProvider = Provider((_) => RemoteAppDio.instance);

class RemoteAppDio with DioMixin implements Dio {
  RemoteAppDio._([BaseOptions? options]) {
    options = BaseOptions(
      baseUrl: 'http://localhost:8000',
      contentType: 'application/json; charset=utf-8',
      connectTimeout: 30000,
      sendTimeout: 30000,
      receiveTimeout: 30000,
    );

    this.options = options;
    interceptors.add(InterceptorsWrapper(onRequest: (options, handler) async {
      options.headers.addAll({
        'Token': 'd760509584dc24e89e157dd3b2b97d71794f148f0a865e060ba97051dd8b7c94',
      });
      options.queryParameters.addAll({
        'key': 'bc745a913a6eClientKasir057bf25f2e5fbf927a8eb8972966074cfecb40',
      });
      handler.next(options);
    }));

    if (kDebugMode) {
      interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
    }

    httpClientAdapter = DefaultHttpClientAdapter();
  }

  static Dio get instance => RemoteAppDio._();
}
