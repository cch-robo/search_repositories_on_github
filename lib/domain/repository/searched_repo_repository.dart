import 'package:dio/dio.dart';
import 'package:search_repositories_on_github/domain/error/domain_exception.dart';
import 'package:search_repositories_on_github/foundation/publications.dart';

import '../models/search_filers.dart';
import '../models/search_repositories_info_model.dart';
import '../rest_api/rest_api_service.dart';

/// GitHub search repository 検索情報リポジトリ
class SearchedRepoRepository {
  SearchedRepoRepository(this._restApiService);

  final RestApiService _restApiService;

  /// リポジトリ検索モデル
  ///
  /// クエリパターンごとに検索結果を破棄できるよう Nullable にしています。
  SearchRepoInfoModel? _searchRepoInfo;

  /// 検索ページングのページカウント数
  static const int parPage = 20;

  /// クエリパラメータ最大長
  static const int maxQueryParameterSize = 256;

  /// リポジトリ検索開始
  ///
  /// ある検索条件のクエリをベースにした検索初回（第1ページ）取得を表す。
  Future<SearchRepoInfoModel> searchRepositories({
    required Query query,
  }) async {
    try {
      // 検索情報を破棄
      _searchRepoInfo = null;

      _validateQueryParameter(query);

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
          'per_page': parPage,
          'page': 1,
        },
      );

      _checkError(response.statusCode);

      _searchRepoInfo = SearchRepoInfoModel(
        json: response.data!,
        query: query.toQueryStr(),
        perPage: parPage,
      );
      return _searchRepoInfo!.clone();
    } on Exception catch (e) {
      debugLog(
        'SearchedRepoRepository  - SearchedRepoRepository - Exception',
        cause: e,
      );
      if (e is DioException) {
        throw DomainException(
          '',
          type: DomainExceptionType.dioException,
          option: e,
        );
      } else if (e is DomainException) {
        rethrow;
      }
      rethrow;
    }
  }

  /// リポジトリ検索継続
  ///
  /// ある検索条件のクエリをベースにした次ページの取得を表す。
  Future<SearchRepoInfoModel> addNextRepositories() async {
    final SearchRepoInfoModel info = _searchRepoInfo!;

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
          'q': info.query,
          'sort': 'updated',
          'order': 'desc',
          'per_page': info.perPage,
          'page': info.currentPage + 1,
        },
      );

      _checkError(response.statusCode);

      info.addNextPage(
        json: response.data!,
        query: info.query,
        perPage: info.perPage,
        currentPage: info.currentPage + 1,
      );
      return info.clone();
    } on Exception catch (e) {
      debugLog(
        'SearchedRepoRepository  - addNextRepositories - Exception',
        cause: e,
      );
      if (e is DioException) {
        if (e.response?.statusCode == 403 || e.response?.statusCode == 429) {
          // Rate limits for the REST API
          // https://docs.github.com/en/rest/using-the-rest-api/rate-limits-for-the-rest-api?apiVersion=2022-11-28#exceeding-the-rate-limit
          // プライマリ レート制限を超えると、403 または 429 が返されます。
          // 指定された時間が経過するまで、リクエストを再試行しないでください。
          throw DomainException(
            '',
            type: DomainExceptionType.overRateLimits,
            option: e,
          );
        }
        throw DomainException(
          '',
          type: DomainExceptionType.dioException,
          option: e,
        );
      } else if (e is DomainException) {
        rethrow;
      }
      rethrow;
    }
  }

  /// HTTP Status Code error check
  void _checkError(int? code) {
    if (code == null) {
      return;
    }

    switch (code) {
      case 200:
        break;
      case 304:
        throw DomainException(
          '',
          type: DomainExceptionType.notModified,
        );
      case 422:
        throw DomainException(
          '',
          type: DomainExceptionType.validationFailed,
        );
      case 503:
        throw DomainException(
          '',
          type: DomainExceptionType.apiServerError,
        );
      default:
        throw DomainException(
          '',
          type: DomainExceptionType.unknownException,
        );
    }
  }

  void _validateQueryParameter(Query query) {
    // クエリパラメータの qualifier を除くパラメータ部の最大長チェック
    final String paramString = query.toParamStr();
    debugLog('validateQueryParameter'
        ' - paramString[${paramString.length}]=$paramString');

    if (paramString.length > maxQueryParameterSize) {
      throw DomainException('', type: DomainExceptionType.tooLongQuery);
    }
  }
}
