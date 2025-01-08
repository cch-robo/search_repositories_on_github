import 'package:flutter/material.dart';
import 'package:search_repositories_on_github/application/app_widget/app_widget.dart';
import 'package:search_repositories_on_github/application/error/app_error_dialog.dart';
import 'package:search_repositories_on_github/application/error/app_error_handler.dart';

void main() {
  // アプリレベルのエラーハンドラ＆エラーダイアログ・サービス
  final AppErrorHandler appErrorHandler = AppErrorHandler();
  final AppErrorHandlerDialog appErrorDialog = AppErrorHandlerDialog();

  // アプリ起動（アプリ全体のエラーハンドリング指定含む）
  appErrorHandler.runAppWithErrorHandler(
    appErrorDialog: appErrorDialog,
    appWidget: const App(),
    appInitialize: () async {
      // Firebase ライブラリの設定初期化などに利用します。
    },
    onFlutterError: (FlutterErrorDetails details) {
      // Firebase Crashlytics クラッシュログ送信などに利用します。
    },
    onPlatformError: (Object exception, StackTrace stackTrace) {
      // Firebase Crashlytics クラッシュログ送信などに利用します。
      return false;
    },
    onAsynchronousError: (Object error, StackTrace stackTrace) {
      // Firebase Crashlytics クラッシュログ送信などに利用します。
    },
  );
}
