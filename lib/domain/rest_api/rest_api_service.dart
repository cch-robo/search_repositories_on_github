import 'package:dio/dio.dart';
import 'package:search_repositories_on_github/domain/error/domain_exception.dart';
import 'package:search_repositories_on_github/foundation/publications.dart';

class RestApiService {
  RestApiService();

  final Dio _dio = Dio(
    BaseOptions(
      // 接続タイムアウト
      connectTimeout: const Duration(seconds: 5),
      // データ送信タイムアウト
      sendTimeout: const Duration(seconds: 5),
      // データ受信タイムアウト
      receiveTimeout: const Duration(seconds: 60),
    ),
  );

  Future<Response<Map<String, dynamic>>> get({
    required String path,
    Map<String, String> header = const <String, String>{},
    Map<String, dynamic>? queries,
  }) async {
    _debugRequest('[GET]', queries);
    try {
      header.keys.map((String key) {
        _dio.options.headers[key] = header[key];
      });
      final Response<Map<String, dynamic>> response =
          await _dio.get<Map<String, dynamic>>(
        path,
        queryParameters: queries ?? <String, dynamic>{},
      );
      _debugResponse('[GET]', response);

      return response;
    } on DioException catch (exception) {
      _debugDioException('[GET]', exception);
      // タイムアウト
      if (exception.type == DioExceptionType.connectionTimeout ||
          exception.type == DioExceptionType.sendTimeout ||
          exception.type == DioExceptionType.receiveTimeout) {}
      throw DomainException(
        '',
        type: DomainExceptionType.dioException,
        cause: exception,
      );
    }
  }

  Future<Response<Map<String, dynamic>>> post({
    required String path,
    required Map<String, dynamic> data,
    Map<String, String> header = const <String, String>{},
    Map<String, dynamic>? queries,
  }) async {
    _debugRequest('[POST]', queries);
    try {
      header.keys.map((String key) {
        _dio.options.headers[key] = header[key];
      });
      final Response<Map<String, dynamic>> response =
          await _dio.post<Map<String, dynamic>>(
        path,
        data: data,
        queryParameters: queries ?? <String, dynamic>{},
      );
      _debugResponse('[POST]', response);

      return response;
    } on DioException catch (exception) {
      _debugDioException('[POST]', exception);
      // タイムアウト
      if (exception.type == DioExceptionType.connectionTimeout ||
          exception.type == DioExceptionType.sendTimeout ||
          exception.type == DioExceptionType.receiveTimeout) {}
      throw DomainException(
        '',
        type: DomainExceptionType.dioException,
        cause: exception,
      );
    }
  }

  void _debugRequest(String method, Map<String, dynamic>? data) {
    debugLog('\n$method request - data=${data ?? ""}\n');
  }

  void _debugResponse(String method, Response<Map<String, dynamic>> response,
      {bool isDetail = false,}) {
    debugLog(
      '\n$method response {\n'
      '    request.uri: ${response.requestOptions.uri}\n'
      '    response.statusCode: ${response.statusCode ?? ""}\n'
      '    response.data: ${response.data ?? ""}\n'
      '    response.headers: ${isDetail ? response.headers : "- omission -"}\n'
      '}\n',
    );
  }

  void _debugDioException(String method, DioException exception) {
    debugLog(
      '\n$method exception {\n'
      '    requestOptions.path: ${exception.requestOptions.path}\n'
      '    requestOptions.data: ${exception.requestOptions.data ?? ""}\n'
      '    message: ${exception.message ?? ""}\n'
      '    response.statusCode: ${exception.response?.statusCode ?? ""}\n'
      '    response.data: ${exception.response?.data ?? ""}\n'
      '    error: ${exception.error}\n'
      '    stackTrace: ${exception.stackTrace}\n'
      '}\n',
      cause: exception,
    );
  }
}
