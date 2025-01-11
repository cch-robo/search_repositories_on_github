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
    try {
      header.keys.map((String key) {
        _dio.options.headers[key] = header[key];
      });
      final Response<Map<String, dynamic>> response =
          await _dio.get<Map<String, dynamic>>(
        path,
        queryParameters: queries ?? <String, dynamic>{},
      );

      return response;
    } on DioException catch (exception) {
      debugLog('[GET] DioException - ${exception.message}', cause: exception);
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

      return response;
    } on DioException catch (exception) {
      debugLog('[POST] DioException - ${exception.message}', cause: exception);
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
}
