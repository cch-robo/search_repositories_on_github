import 'package:search_repositories_on_github/domain/publications.dart';
import 'package:search_repositories_on_github/foundation/publications.dart';

/// ユースケース・レイヤレベルの検索情報を取得します。
class SearchRepoService {
  SearchRepoService(this._repository);
  final SearchedRepoRepository _repository;

  SearchInfo? _searchInfo;

  /// ユースケースレベルの検索情報
  SearchInfo? get searchInfo => _searchInfo;

  /// クエリで検索を開始する。
  ///
  /// この API が利用されるユースケースとしては、
  /// 検索条件を入力して検索ボタンを押下したときを想定しています。
  Future<SearchInfo?> searchRepoByInQuery({
    required String readme,
    required String description,
    required String repoName,
    required String topics,
  }) async {
    // 検索情報を初期化
    _searchInfo = null;

    final List<QueryItem> items = [];
    _addQueryItem(items, InFilter.readme, readme);
    _addQueryItem(items, InFilter.description, description);
    _addQueryItem(items, InFilter.name, repoName);
    _addQueryItem(items, InFilter.topics, topics);

    // クエリ生成
    final Query query = Query(items);
    try {
      // リポジトリに問い合わせ
      final SearchRepoInfoModel info =
          await _repository.searchRepositories(query: query);

      // 必要な情報のみを取得して返却
      return _searchInfo = SearchInfo(
        query: info.query,
        totalCount: info.totalCount,
        repositories: info.repositories,
      );
    } on Exception catch (exp) {
      debugLog('SearchRepoService - searchRepoByInQuery catch Exception.',
          cause: exp);
    }
    return null;
  }

  /// クエリ検索を続行する。
  ///
  /// この API が利用されるユースケースとしては、
  /// 検索結果一覧のスクロールで下端に達したときを想定しています。
  ///
  /// _返却された検索情報には、今まで取得したページ分の情報も含まれています。_
  Future<SearchInfo?> addNextRepositories() async {
    try {
      // リポジトリに問い合わせ
      final SearchRepoInfoModel info = await _repository.addNextRepositories();

      // 必要な情報のみを取得して返却
      return _searchInfo = SearchInfo(
        query: info.query,
        totalCount: info.totalCount,
        repositories: info.repositories,
      );
    } on Exception catch (exp) {
      debugLog('SearchRepoService - addNextRepositories catch Exception.',
          cause: exp);
    }
    return null;
  }

  void _addQueryItem(List<QueryItem> items, InFilter filter, String keyWord) {
    if (keyWord.trim().isNotEmpty) {
      items.add(filter.toQueryItem(keyWord.trim()));
    }
  }
}

/// ユースケースレベルの検索情報モデル
class SearchInfo {
  SearchInfo({
    required this.query,
    required this.totalCount,
    required this.repositories,
  });

  /// 検索したクエリ情報
  final String query;

  /// 検索条件の総リポジトリ数
  final int totalCount;

  /// 取得済みの検索リポジトリのリスト（可変）
  final List<RepoModel> repositories;
}