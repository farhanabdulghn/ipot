import 'package:dio/dio.dart';
import 'package:ipot/api/base_api.dart';
import 'package:ipot/utils/functions.dart';

enum RequestType { get, post, put, patch, delete }

final cancelRequestToken = CancelToken();

class ApiServer<T> {
  final Dio _dio;

  ApiServer._(this._dio);

  static ApiServer getInstance() {
    return ApiServer._(ApiClient.instance.dio);
  }

  ///[payload] ==> payload , [endPoint] ==> path or uri
  ///[requestType] ==> This is the enum created earlier
  ///[payload] ==> data/object that will be sent to
  ///[options] ==> this will help us add extra headers should the API
  ///need it when making a request.
  Future<Response<T>> callService({
    required RequestType requestType,
    required String endPoint,
    T? payload,
    Map<String, dynamic>? queryParams,
    Options? options,
    String? exception,
  }) async {
    final stackTrace = StackTrace.current.toString().split('\n');
    final callerFrame = stackTrace[1];
    final regex = RegExp(r'([A-Za-z_][A-Za-z0-9_]*)\.([A-Za-z_][A-Za-z0-9_]*)');
    final match = regex.firstMatch(callerFrame);
    final className = match!.group(1);
    final methodName = match.group(2);

    try {
      late Response<T> response;

      switch (requestType) {
        case RequestType.get:
          response = await _dio.get<T>(
            endPoint,
            queryParameters: queryParams,
            options: options,
            cancelToken: cancelRequestToken,
          );
          break;
        case RequestType.post:
          response = await _dio.post<T>(
            endPoint,
            data: payload,
            queryParameters: queryParams,
            options: options,
            cancelToken: cancelRequestToken,
          );
          break;
        case RequestType.put:
          response = await _dio.put<T>(
            endPoint,
            data: payload,
            queryParameters: queryParams,
            options: options,
            cancelToken: cancelRequestToken,
          );
          break;
        case RequestType.patch:
          response = await _dio.patch<T>(
            endPoint,
            data: payload,
            queryParameters: queryParams,
            options: options,
            cancelToken: cancelRequestToken,
          );
          break;
        case RequestType.delete:
          response = await _dio.delete<T>(
            endPoint,
            data: payload,
            queryParameters: queryParams,
            options: options,
            cancelToken: cancelRequestToken,
          );
          break;
      }

      return response;
    } on DioException catch (e) {
      final error =
          '$className#$methodName err : ${e.response?.data['message']}';
      Functions.errorPrint(error);

      throw Exception(exception ?? error);
    } catch (e) {
      final error = '$className#$methodName err : $e';
      Functions.errorPrint(error);
      throw Exception(exception ?? error);
    }
  }
}
