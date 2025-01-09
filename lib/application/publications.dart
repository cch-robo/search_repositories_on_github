// この publications.dart ファイルは、
// application レイヤが外部に公開を許可するクラスや関数を限定させるためのものです。
//
// 1. 外部レイヤは、この publications.dart だけを import して、
// 2. application/ ディレクトリ配下の他のライブラリを直接 import しないでください。
//
// この規約を守ることで、コンテキスト境界を超えた機能の誤用抑止に役立つだけでなく、
// 各コードファイルの import 構成を一瞥することで、2 の誤用を簡単にチェックできます。
//
// 補足：application レイヤは、
// flutterフレームワーク都合による、アプリ全体の共通基盤の管理を担うレイヤです。
//
export 'package:search_repositories_on_github/application/l10n/l10n_service.dart';
export 'package:search_repositories_on_github/application/router/routes.dart';
