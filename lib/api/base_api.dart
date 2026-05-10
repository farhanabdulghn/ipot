import 'package:dio/dio.dart';

class BaseApi {
  final String baseUrl;

  BaseApi(this.baseUrl);

  Dio _dio() {
    return Dio(
        BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 45),
          sendTimeout: const Duration(seconds: 30),
          headers: {
            'Content-Type': 'application/json;charset=UTF-8',
            'Charset': 'utf-8',
          },
        ),
      )
      ..interceptors.addAll([
        InterceptorsWrapper(
          onRequest: (options, handler) async {
            return handler.next(options);
          },
          onError: (error, handler) {
            return handler.next(error);
          },
        ),
      ]);
  }

  Dio get dio => _dio();
}

class ApiClient extends BaseApi {
  ApiClient() : super('https://web-production-bd69d.up.railway.app/api/v1');
  static ApiClient? _instance;
  static ApiClient get instance => _instance == null ? ApiClient() : _instance!;
}
