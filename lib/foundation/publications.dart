// この publications.dart ファイルは、
// foundation レイヤが外部に公開を許可するクラスや関数を限定させるためのものです。
//
// 1. 外部レイヤは、この publications.dart だけを import して、
// 2. foundation/ ディレクトリ 配下の他のライブラリを直接 import しないでください。
//
// この規約を守ることで、コンテキスト境界を超えた機能の誤用抑止に役立つだけでなく、
// 各コードファイルの import 構成を一瞥することで、2 の誤用を簡単にチェックできます。
//
// 補足：foundation レイヤは、アプリ内で普遍的に利用される機能や基盤クラスの管理を担うレイヤです。
//
export 'package:search_repositories_on_github/foundation/debug/debug_logger.dart'
    show debugLog;
export 'package:search_repositories_on_github/foundation/error/default_error.dart';
