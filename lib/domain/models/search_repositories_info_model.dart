import './searched_repository_model.dart';

/// リポジトリ検索モデル
///
/// リポジトリ検索結果の情報を表すモデルです。
/// 検索リポジトリデータは、可変リストとして扱うため不変モデルにしていません。
class SearchRepoInfoModel {
  /// ファクトリ・コンストラクタ
  ///
  /// 検索第一ページの結果を登録する。
  factory SearchRepoInfoModel({
    required Map<String, dynamic> json,
    required String query,
    required int perPage,
  }) {
    final int totalCount = json['total_count'] as int;
    final List<dynamic> items = json['items'] as List<dynamic>;

    // トータルカウント数から最終ページ番号を割り出す。
    final int qt = totalCount ~/ perPage;
    final int rt = totalCount % perPage;
    final int lastPage = qt + ((rt > 0) ? 1 : 0);

    final SearchRepoInfoModel info = SearchRepoInfoModel._(
      totalCount: totalCount,
      query: query,
      perPage: perPage,
      lastPage: lastPage,
      currentPage: 1, //初回読み出しページ番号
    );

    final List<Map<String, dynamic>> jsonList =
        items.map((dynamic item) => item as Map<String, dynamic>).toList();

    // リポジトリ情報を新規追加
    info._repositories = <RepoModel>[];
    for (final Map<String, dynamic> json in jsonList) {
      info._repositories.add(RepoModel.fromJson(json));
    }
    return info;
  }

  /// プライベート・コンストラクタ
  SearchRepoInfoModel._(
      {required this.totalCount,
      required this.query,
      required this.perPage,
      required this.lastPage,
      required int currentPage})
      : _currentPage = currentPage;

  /// 検索結果のページネーションより、次のページを取得
  void addNextPage({
    required Map<String, dynamic> json,
    required String query,
    required int perPage,
    required int currentPage,
  }) {
    // 検索条件に変化がないかチェック
    if (this.query != query || this.perPage != perPage) {
      throw Exception('no collect search condition');
    }

    // 継続検索チェック
    if (_currentPage < currentPage && (currentPage - _currentPage) < perPage) {
      throw Exception('no collect search condition');
    }

    // 範囲チェック
    if (!(lastPage >= currentPage && currentPage > 1)) {
      throw Exception('no collect search condition');
    }

    final int totalCount = json['total_count'] as int;
    final List<dynamic> items = json['items'] as List<dynamic>;

    // トータル件数チェック
    if (this.totalCount != totalCount) {
      throw Exception('no collect search condition');
    }

    final List<Map<String, dynamic>> jsonList =
        items.map((dynamic item) => item as Map<String, dynamic>).toList();

    // リポジトリ情報を追加
    for (final Map<String, dynamic> json in jsonList) {
      _repositories.add(RepoModel.fromJson(json));
    }
    _currentPage = currentPage;
  }

  /// 検索リポジトリ数
  final int totalCount;

  /// 検索クエリ情報
  final String query;

  /// 検索されたリポジトリのリスト
  late final List<RepoModel> _repositories;

  /// １ページ単位のリポジトリ数
  final int perPage;

  /// トータル・ラストページ番号
  final int lastPage;

  /// カレントページ番号
  int _currentPage;

  /// カレントページ番号
  int get currentPage => _currentPage;

  List<RepoModel> get repositories {
    final List<RepoModel> copy = List<RepoModel>.unmodifiable(_repositories);
    return copy;
  }

  SearchRepoInfoModel clone() {
    final SearchRepoInfoModel copy = SearchRepoInfoModel._(
      totalCount: totalCount,
      query: query,
      perPage: perPage,
      lastPage: lastPage,
      currentPage: _currentPage,
    );
    copy._repositories = List<RepoModel>.unmodifiable(_repositories);
    return copy;
  }
}
