import 'package:dio/dio.dart';

class RestApiService {
  RestApiService();

  final Dio _dio = Dio();

  Future<Response?> get({
    required String path,
    Map<String, dynamic>? queries,
  }) async {
    try {
      final Response response = await _dio.get(
        path,
        queryParameters: queries ?? {},
      );

      return response;
    } on DioException catch (exception) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response?> post({
    required String path,
    required Map<String, dynamic> data,
    Map<String, dynamic>? queries,
  }) async {
    try {
      final Response response = await _dio.post(
        path,
        data: data,
        queryParameters: queries ?? {},
      );

      return response;
    } on DioException catch (exception) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
