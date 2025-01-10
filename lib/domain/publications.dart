// この publications.dart ファイルは、
// domain レイヤが外部に公開を許可するクラスや関数を限定させるためのものです。
//
// 1. 外部レイヤは、この publications.dart だけを import して、
// 2. domain/ ディレクトリ配下の他のライブラリを直接 import しないでください。
//
// この規約を守ることで、コンテキスト境界を超えた機能の誤用抑止に役立つだけでなく、
// 各コードファイルの import 構成を一瞥することで、2 の誤用を簡単にチェックできます。
//
// 補足：domain レイヤは、
// ユースケース都合に左右されない、アプリ内の共通基盤となるデータや機能の管理を担うレイヤです。
//
import 'package:search_repositories_on_github/domain/repository/searched_repo_repository.dart';

export 'package:search_repositories_on_github/domain/models/search_filers.dart';
export 'package:search_repositories_on_github/domain/models/search_repositories_info_model.dart';
export 'package:search_repositories_on_github/domain/models/searched_repository_model.dart';
export 'package:search_repositories_on_github/domain/repository/searched_repo_repository.dart';

//FIXME AppWidgetを Hooks 対応して、アプリ初期化処理からインスタンス設定させること。
/// クエリ検索結果データを提供するリポジトリのインスタンス
late final SearchedRepoRepository searchedRepoRepositoryInstance;
