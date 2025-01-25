/// Queryを表すバリュークラス
class Query {
  Query(this.params);
  final List<QueryItem> params;

  String toParamStr() {
    final StringBuffer sb = StringBuffer();
    for (final QueryItem item in params) {
      sb.write(item.paramStr);
    }
    return sb.toString();
  }

  String toQueryStr() {
    final StringBuffer sb = StringBuffer();
    for (final QueryItem item in params) {
      if (sb.isNotEmpty) {
        sb.write(' ');
      }
      sb.write(item.queryStr);
    }
    return sb.toString();
  }
}

/// Queryアイテムを表すバリュークラス
class QueryItem {
  QueryItem(this.paramStr, this.queryStr);
  final String paramStr;
  final String queryStr;
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

  const InFilter(this.qualifier);

  final String qualifier;

  QueryItem toQueryItem(String keyword) {
    final String param = keyword.replaceAll('"', ' ');
    return QueryItem(param, '"$param" $qualifier');
  }
}

//FIXME ロジック考慮中 (全パターン網羅不全のため保留)
/// （検索条件フィルタ）条件が範囲内のリポジトリで絞り込みます。
enum RangeFilter {
  size('size'),
  followers('followers'),
  forks('forks'),
  stars('start'),
  topics('topics');

  const RangeFilter(this.qualifier);
  final String qualifier;
  QueryItem toQueryItem({required Range range, required int value}) {
    final String param = value.toString();
    return QueryItem(param, '$qualifier:${range.operator}$param');
  }
}

//FIXME ロジック考慮中 (全パターン網羅不全のため保留)
enum Range {
  // range(':%..%'),
  equals(''),
  large('>'),
  small('<'),
  graterEquals('>='),
  smallerEquals('<=');

  const Range(this.operator);
  final String operator;
}

/// （検索条件フィルタ）キーワードが条件に含まれているリポジトリで絞り込みます。
enum SingleMachFilter {
  /// キーワードがユーザ名に含まれている。
  user('user'),

  /// キーワードが組織名に含まれている。
  org('org');

  const SingleMachFilter(this.qualifier);
  final String qualifier;
  QueryItem toQueryItem({required String name}) {
    final String param = name.replaceAll('"', ' ');
    return QueryItem(param, '$qualifier:"$param"');
  }
}

/// （検索条件フィルタ）キーワードが条件に含まれているリポジトリで絞り込みます。
enum DoubleMachFilter {
  /// オーナー名やリポジトリ名で絞り込みます。
  repo('repo');

  const DoubleMachFilter(this.qualifier);
  final String qualifier;
  QueryItem toQueryItem({required String userName, required String repoName}) {
    final String param1 = userName.replaceAll('"', ' ');
    final String param2 = repoName.replaceAll('"', ' ');
    return QueryItem('$param1 $param2', '$qualifier:"$param1"/"$param2"');
  }
}

/// （検索条件フィルタ）条件を満たすリポジトリで絞り込みます。
enum BoolFilter {
  /// リポジトリがミラーか否かで絞り込みます。
  mirror('mirror'),

  /// リポジトリがテンプレートか否かで絞込みます。
  template('template'),

  /// リポジトリがアーカイブされているか否かで絞込みます。
  archived('archived');

  const BoolFilter(this.qualifier);
  final String qualifier;
  QueryItem toQueryItem({required bool flag}) {
    return QueryItem('$flag', '$qualifier:$flag');
  }
}

/// （検索条件フィルタ）条件を満たすリポジトリで絞り込みます。
enum SingleFilter {
  /// GitHub Sponsors リポジトリで絞り込みます。
  sponsorable('is:sponsorable'),

  /// リポジトリに Founding ファイルがあるか否かで絞り込みます。
  fundingFile('has:funding-file');

  const SingleFilter(this.qualifier);
  final String qualifier;
  QueryItem toQueryItem() => QueryItem('', qualifier);
}
