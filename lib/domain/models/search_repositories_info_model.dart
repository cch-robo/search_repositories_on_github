import 'package:search_repositories_on_github/domain/models/searched_repository_model.dart';

/// リポジトリ検索モデル
///
/// リポジトリ検索結果の情報を表すモデルです。
class SearchRepoInfoModel {
  /// ファクトリ・コンストラクタ
  factory SearchRepoInfoModel({
    required Map<String, dynamic> json,
    required String query,
    required int parPage,
    required int page,
  }) {
    final int totalCount = json['total_count'] as int;
    final List<dynamic> items = json['items'] as List<dynamic>;
    final SearchRepoInfoModel info = SearchRepoInfoModel._(
      totalCount: totalCount,
      query: query,
      parPage: parPage,
      page: page,
    );

    final List<Map<String, dynamic>> jsonList =
        items.map((dynamic item) => item as Map<String, dynamic>).toList();

    // リポジトリ情報を新規追加
    for (final Map<String, dynamic> json in jsonList) {
      info._repositories.add(RepoModel.fromJson(json));
    }
    return info;
  }

  /// プライベート・コンストラクタ
  SearchRepoInfoModel._({
    required this.totalCount,
    required this.query,
    required this.parPage,
    required this.page,
  });

  /// 検索リポジトリ数
  final int totalCount;

  /// 検索クエリ情報
  final String query;

  /// 検索されたリポジトリのリスト
  final List<RepoModel> _repositories = <RepoModel>[];

  /// １ページ単位のリポジトリ数
  final int parPage;

  /// カレントページ番号
  final int page;

  List<RepoModel> get repositories {
    final List<RepoModel> copy = <RepoModel>[];
    copy.addAll(_repositories);
    return copy;
  }
}
