// この publications.dart ファイルは、
// presentation レイヤが外部に公開を許可するクラスや関数を限定させるためのものです。
//
// 1. 外部レイヤは、この publications.dart だけを import して、
// 2. presentation/ ディレクトリ配下の他のライブラリを直接 import しないでください。
//
// この規約を守ることで、コンテキスト境界を超えた機能の誤用抑止に役立つだけでなく、
// 各コードファイルの import 構成を一瞥することで、2 の誤用を簡単にチェックできます。
//
// 補足：presentation レイヤは、
// 画面表示やユースケース都合を優先させる、ユーザーインターフェースの管理を担うレイヤです。
//
export 'package:search_repositories_on_github/presentation/detail_page/page_widget/detail_page_widget.dart';
export 'package:search_repositories_on_github/presentation/results_page/page_widget/results_page_widget.dart';
export 'package:search_repositories_on_github/presentation/search_page/page_widget/search_page_widget.dart';
