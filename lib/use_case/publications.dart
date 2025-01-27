// この publications.dart ファイルは、
// use_case レイヤが外部に公開を許可するクラスや関数を限定させるためのものです。
//
// 1. 外部レイヤは、この publications.dart だけを import して、
// 2. use_case/ ディレクトリ配下の他のライブラリを直接 import しないでください。
//
// この規約を守ることで、コンテキスト境界を超えた機能の誤用抑止に役立つだけでなく、
// 各コードファイルの import 構成を一瞥することで、2 の誤用を簡単にチェックできます。
//
// 補足：use_case レイヤは、
// ユースケース都合を優先させるため、domainレイヤをラップしたデータや機能の管理を担うレイヤです。
//
import 'package:search_repositories_on_github/use_case/service/search_repo_info_service.dart';

export 'package:search_repositories_on_github/use_case/service/search_repo_info_service.dart';

/// クエリ検索結果データを提供するサービスのインスタンス
late final SearchRepoService searchRepoService;
