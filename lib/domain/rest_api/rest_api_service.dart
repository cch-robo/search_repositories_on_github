import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:search_repositories_on_github/foundation/debug/debug_logger.dart';
import 'package:search_repositories_on_github/foundation/error/default_error.dart';

class RestApiService {
  RestApiService();

  final Dio _dio = Dio();

  Future<Response<Map<String, dynamic>>> get({
    required String path,
    Map<String, String> header = const <String, String>{},
    Map<String, dynamic>? queries,
  }) async {
    _debugRequest('get', queries);
    try {
      header.keys.map((String key) {
        _dio.options.headers[key] = header[key];
      });
      final Response<Map<String, dynamic>> response =
          await _dio.get<Map<String, dynamic>>(
        path,
        queryParameters: queries ?? {},
      );
      _debugResponse('get', response);

      return response;
    } on DioException catch (exception) {
      _debugDioException('get', exception);
      throw DefaultException('', cause: exception);
    } catch (e) {
      _debugUnExpected('get', e);
      throw DefaultError('get unexpected', cause: e);
    }
  }

  Future<Response<Map<String, dynamic>>> post({
    required String path,
    Map<String, String> header = const <String, String>{},
    required Map<String, dynamic> data,
    Map<String, dynamic>? queries,
  }) async {
    _debugRequest('post', data);
    _debugRequest('post', queries);
    try {
      header.keys.map((String key) {
        _dio.options.headers[key] = header[key];
      });
      final Response<Map<String, dynamic>> response =
          await _dio.post<Map<String, dynamic>>(
        path,
        data: data,
        queryParameters: queries ?? {},
      );
      _debugResponse('post', response);

      return response;
    } on DioException catch (exception) {
      _debugDioException('post', exception);
      throw DefaultException('', cause: exception);
    } catch (e) {
      _debugUnExpected('post', e);
      throw DefaultError('post unexpected', cause: e);
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
