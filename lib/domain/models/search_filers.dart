/// Queryを表すバリュークラス
class Query {
  Query(this.params);
  final List<QueryItem> params;

  String toQueryStr() {
    final StringBuffer sb = StringBuffer();
    for (final QueryItem item in params) {
      if (sb.isNotEmpty) {
        sb.write(' ');
      }
      sb.write(item.label);
    }
    return sb.toString();
  }
}

/// Queryアイテムを表すバリュークラス
class QueryItem {
  QueryItem(this.label);
  final String label;
}

/// （検索条件フィルタ）キーワードが条件に含まれているリポジトリで絞り込みます。
enum InFilter {
  /// in:name キーワードがリポジトリ名に含まれている。
  name('in:name'),

  /// in:description キーワードがリポジトリ名または説明に含まれている。
  description('in:description'),

  /// in:topics キーワードがトピックのラベルに含まれている。
  topics('in:topics'),

  /// in:readme キーワードがREADME ファイル内に含まれている。
  readme('in:readme');

  const InFilter(this.searchType);

  final String searchType;

  QueryItem toQueryItem(String keyword) {
    return QueryItem('"$keyword" $searchType');
  }
}

//FIXME ロジック考慮中
/// （検索条件フィルタ）条件が範囲内のリポジトリで絞り込みます。
enum RangeFilter {
  size('size'),
  followers('followers'),
  forks('forks'),
  stars('start'),
  topics('topics');

  const RangeFilter(this.label);
  final String label;
  QueryItem toQueryItem({required Range range, required int value}) =>
      QueryItem('$label:"$name"');
}

//FIXME ロジック考慮中
enum Range {
  equals(),
  large,
  small,
  range;
}

/// （検索条件フィルタ）キーワードが条件に含まれているリポジトリで絞り込みます。
enum SingleMachFilter {
  /// キーワードがユーザ名に含まれている。
  user('user'),

  /// キーワードが組織名に含まれている。
  org('org');

  const SingleMachFilter(this.label);
  final String label;
  QueryItem toQueryItem({required String name}) => QueryItem('$label:"$name"');
}

/// （検索条件フィルタ）キーワードが条件に含まれているリポジトリで絞り込みます。
enum DoubleMachFilter {
  /// オーナー名やリポジトリ名で絞り込みます。
  repo('repo');

  const DoubleMachFilter(this.label);
  final String label;
  QueryItem toQueryItem({required String userName, required String repoName}) =>
      QueryItem('$label:"$userName"/"$repoName"');
}

/// （検索条件フィルタ）条件を満たすリポジトリで絞り込みます。
enum BoolFilter {
  /// リポジトリがミラーか否かで絞り込みます。
  mirror('mirror'),

  /// リポジトリがテンプレートか否かで絞込みます。
  template('template'),

  /// リポジトリがアーカイブされているか否かで絞込みます。
  archived('archived');

  const BoolFilter(this.label);
  final String label;
  QueryItem toQueryItem({required bool flag}) => QueryItem('$label:$flag');
}

/// （検索条件フィルタ）条件を満たすリポジトリで絞り込みます。
enum SingleFilter {
  /// GitHub Sponsors リポジトリで絞り込みます。
  sponsorable('is:sponsorable'),

  /// リポジトリに Founding ファイルがあるか否かで絞り込みます。
  fundingFile('has:funding-file');

  const SingleFilter(this.label);
  final String label;
  QueryItem toQueryItem() => QueryItem(label);
}
