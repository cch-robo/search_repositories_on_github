import 'package:dio/dio.dart';
import 'package:search_repositories_on_github/foundation/publications.dart';

import '../models/search_filers.dart';
import '../models/search_repositories_info_model.dart';
import '../rest_api/rest_api_service.dart';

class SearchedRepoRepository {
  const SearchedRepoRepository(this._restApiService);
  final RestApiService _restApiService;

  Future<SearchRepoInfoModel> searchRepo({
    required Query query,
    required int page,
  }) async {
    try {
      final Response<Map<String, dynamic>> response = await _restApiService.get(
        path: 'https://api.github.com/search/repositories',
        header: <String, String>{
          'Accept': 'application/vnd.github+json',
          // FIXME 時間があれば、トークン対応する。
          // 'Authorization': 'Bearer $token',
          'X-GitHub-Api-Version': '2022-11-28',
        },
        queries: <String, dynamic>{
          'q': query.toQueryStr(),
          'sort': 'updated',
          'order': 'desc',
          'per_page': 20,
          'page': page,
        },
      );
      if (response.statusCode != null) {}
      return SearchRepoInfoModel(
        json: response.data!,
        query: query.toQueryStr(),
        parPage: 10,
        page: page,
      );
    } on Exception catch (e) {
      debugLog('debug - SearchedRepoRepository - Exception', cause: e);
      rethrow;
    }
  }
}
