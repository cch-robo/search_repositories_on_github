// この for_supervisors.dart ファイルは、
// domain レイヤが特権管理者にのみ外部に公開を許可するクラスや関数を限定させるためのものです。
//
// 1. この for_supervisors.dart を import できるのは、
//    アプリ全体の管理を担う application レイヤのアプリ全体初期化処理のみです。
//
export 'package:search_repositories_on_github/domain/rest_api/rest_api_service.dart';
