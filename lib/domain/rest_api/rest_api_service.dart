import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
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
      // タイムアウト
      if (exception.type == DioExceptionType.connectionTimeout ||
          exception.type == DioExceptionType.sendTimeout ||
          exception.type == DioExceptionType.receiveTimeout) {
        debugLog('[GET] request timed out', cause: exception);
      } else {
        _debugDioException('[GET]', exception);
      }
      throw DefaultException('[GET] DioException', cause: exception);
    } catch (e) {
      _debugUnExpected('get', e);
      throw DefaultError('[GET] unexpected', cause: e);
    }
  }

  Future<Response<Map<String, dynamic>>> post({
    required String path,
    required Map<String, dynamic> data,
    Map<String, String> header = const <String, String>{},
    Map<String, dynamic>? queries,
  }) async {
    _debugRequest('[POST]', data);
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
      // タイムアウト
      if (exception.type == DioExceptionType.connectionTimeout ||
          exception.type == DioExceptionType.sendTimeout ||
          exception.type == DioExceptionType.receiveTimeout) {
        debugLog('[POST] request timed out', cause: exception);
      } else {
        _debugDioException('[POST]', exception);
      }
      throw DefaultException('[POST] DioException', cause: exception);
    } catch (e) {
      _debugUnExpected('[POST]', e);
      throw DefaultError('[POST] unexpected', cause: e);
    }
  }

  void _debugRequest(String method, Map<String, dynamic>? data) {
    if (!kDebugMode) {
      return;
    }
    debugLog(
      'debug - $method request - data=${data ?? ""}\n',
    );
  }

  void _debugResponse(String method, Response<Map<String, dynamic>> response) {
    if (!kDebugMode) {
      return;
    }
    debugLog(
      'debug - $method response {\n'
      '    request.uri: ${response.requestOptions.uri}\n'
      '    response.statusCode: ${response.statusCode ?? ""}\n'
      '    response.data: ${response.data ?? ""}\n'
      '    response.headers: ${response.headers}\n'
      '}\n',
    );
  }

  void _debugDioException(String method, DioException exception) {
    if (!kDebugMode) {
      return;
    }
    debugLog(
      'debug - $method exception {\n'
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

  void _debugUnExpected(String method, Object exception) {
    if (!kDebugMode) {
      return;
    }
    debugLog(
      'debug - $method unexpected',
      cause: exception,
    );
  }
}
