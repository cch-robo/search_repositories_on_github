// このソースファイルは、FlutterKaigi mini#2 @Ishikawa プロジェクト・ライブラリの流用です。
// https://github.com/cch-robo/Flutter_plain_infra_mini_hands-on/blob/main/lib/src/infra/app_error_handler.dart

// ignore_for_file: noop_primitive_operations
import 'dart:async';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:search_repositories_on_github/application/error/app_error_dialog.dart';
import 'package:search_repositories_on_github/application/l10n/gen/app_localizations_ja.dart';
import 'package:search_repositories_on_github/application/l10n/l10n_service.dart';
import 'package:search_repositories_on_github/application/router/router.dart';
import 'package:search_repositories_on_github/foundation/publications.dart';

/// アプリレベルのエラーハンドラ設定クラス
class AppErrorHandler {
  /// コンストラクタ
  ///
  /// _シングルトン・インスタンスにするため、_<br/>
  /// _2回目の生成はエラーとすることに注意ください。_
  AppErrorHandler() {
    _instance = this;
  }

  /// シングルトン・インスタンス
  // ignore: unused_field
  static late final AppErrorHandler _instance;

  AppErrorType _errorType = AppErrorType.noError;
  Object? _error;

  /// アプリケーションレベル・エラー発生有無フラグ
  bool get hasError => _error != null;

  /// アプリケーションレベル・エラー種別
  AppErrorType get errorType => _errorType;

  /// アプリケーションレベル・エラー
  Object? get error => _error;

  /// アプリ起動
  ///
  /// Flutter アプリのエラーハンドラを設定して、アプリを起動します。
  void runAppWithErrorHandler({
    required Widget appWidget,
    required Future<void> Function() appInitialize,
    required AppErrorHandlerDialog appErrorDialog,
    FlutterExceptionHandler? onFlutterError,
    ErrorCallback? onPlatformError,
    void Function(Object error, StackTrace stackTrace)? onAsynchronousError,
  }) {
    // ignore: discarded_futures
    runZonedGuarded(() async {
      // アプリ全体のエラーハンドリングを行うため、
      // アプリ起動は、この関数パラメータ内で行う必要があることに留意。
      WidgetsFlutterBinding.ensureInitialized();
      // アプリレベルのエラーダイアログサービスを設定
      _errorDialog = appErrorDialog;

      // オプションのエラーハンドラを設定
      _optionFlutterExceptionHandler = onFlutterError;
      _optionPlatformErrorHandler = onPlatformError;
      _optionAsynchronousErrorHandler = onAsynchronousError;

      // Flutter フレームワーク由来エラーのハンドラ
      _oldFlutterExceptionHandler = FlutterError.onError!;
      FlutterError.onError = _flutterErrorHandler;

      // Flutter プラットフォーム由来エラーのハンドラ
      PlatformDispatcher.instance.onError = _platformErrorHandler;

      try {
        // アプリ全体の初期化処理
        await appInitialize();

        // アプリ起動
        runApp(appWidget);
        // ignore: avoid_catches_without_on_clauses
      } catch (e) {
        debugLog('Error occurred in appInitialize', cause: e);
        _error = e;
        _errorType = AppErrorType.appInitializeError;

        // トップレベルまで上がってきた未処置の想定外のエラーなので、
        // アプリをユーザーに強制終了してもらうようにします。
        // ただし、アプリが起動していないため l10n リソースもロケールも使えません。
        // このためメッセージリソースをデフォルトの日本語で直接指定します。
        final AppLocalizationsJa l10n = AppLocalizationsJa();

        // エラー表示専用アプリ起動
        _errorDialog.showAppBeforeLaunchErrorAlertDialog(
          title: l10n.errorDialogTitle,
          message: l10n.errorDialogUnexpectedErrorMessage,
        );
        debugLog('Application could not lunch.');
      }
    }, (Object error, StackTrace stack) {
      // 非同期処理由来エラーのハンドラ
      _asynchronousErrorHandler(error, stack);
    });
  }

  /// アプリレベルのエラーダイアログ表示サービス
  late final AppErrorHandlerDialog _errorDialog;

  /// 既存 Flutter system exception handler
  late final FlutterExceptionHandler _oldFlutterExceptionHandler;

  /// オプション Flutter system exception handler
  late final FlutterExceptionHandler? _optionFlutterExceptionHandler;

  /// オプション Flutter platform error handler
  late final ErrorCallback? _optionPlatformErrorHandler;

  /// オプション Flutter Asynchronous error handler
  late final void Function(Object error, StackTrace stackTrace)?
      _optionAsynchronousErrorHandler;

  /// （アプリ全体）Flutter フレームワーク エラー・ハンドラ
  void _flutterErrorHandler(FlutterErrorDetails details) {
    debugLog('FlutterErrorHandle');
    debugLog('handling err type=${details.exception.runtimeType.toString()}');
    debugLog('exceptionAsString=${details.exceptionAsString()}');
    debugLog('StackTraces=\n${details.stack.toString()}');
    debugLog('FlutterError.dumpErrorToConsole');
    FlutterError.dumpErrorToConsole(details, forceReport: true);
    _error = error;
    _errorType = AppErrorType.flutterError;

    // オプションのエクセプションハンドラ処置を実行
    if (_optionFlutterExceptionHandler != null) {
      _optionFlutterExceptionHandler(details);
    }

    // 既存エクセプションハンドラ処置を実行
    _oldFlutterExceptionHandler(details);

    // トップレベルまで上がってきた未処置の想定外のエラーなので、
    // アプリをユーザーに強制終了してもらうようにします。
    unawaited(
      _errorDialog.showErrorAlertDialog(
        context: globalNavigatorContext,
        title: l10n(globalNavigatorContext).errorDialogTitle,
        message: l10n(globalNavigatorContext).errorDialogUnexpectedErrorMessage,
        isExitApp: true,
      ),
    );
  }

  // Flutter フレームワーク・レベルではない、プラットフォーム由来のエラー・ハンドラ
  bool _platformErrorHandler(Object error, StackTrace stackTrace) {
    debugLog('PlatformDispatcherErrorHandle', cause: error);
    debugLog('StackTraces=\n${stackTrace.toString()}');
    _error = error;
    _errorType = AppErrorType.platformError;

    // オプションのエラーハンドラ処置を実行
    if (_optionPlatformErrorHandler != null) {
      _optionPlatformErrorHandler(error, stackTrace);
    }

    // トップレベルまで上がってきた未処置の想定外のエラーなので、
    // アプリをユーザーに強制終了してもらうようにします。
    unawaited(
      _errorDialog.showErrorAlertDialog(
        context: globalNavigatorContext,
        title: l10n(globalNavigatorContext).errorDialogTitle,
        message: l10n(globalNavigatorContext).errorDialogUnexpectedErrorMessage,
        isExitApp: true,
      ),
    );
    return true;
  }

  /// （アプリ全体）非同期処理由来のエラー・ハンドラ （Error だけでなく Exceptionも捕捉します）
  void _asynchronousErrorHandler(Object error, StackTrace stack) {
    debugLog('AsynchronousErrorHandle', cause: error);
    debugLog('StackTraces=\n${stack.toString()}');
    _error = error;
    _errorType = AppErrorType.asynchronousError;

    // オプションのエラーハンドラ処置を実行
    if (_optionAsynchronousErrorHandler != null) {
      _optionAsynchronousErrorHandler(error, stack);
    }

    // トップレベルまで上がってきた未処置の想定外のエラーなので、
    // アプリをユーザーに強制終了してもらうようにします。
    unawaited(
      _errorDialog.showErrorAlertDialog(
        context: globalNavigatorContext,
        title: l10n(globalNavigatorContext).errorDialogTitle,
        message: l10n(globalNavigatorContext).errorDialogUnexpectedErrorMessage,
        isExitApp: true,
      ),
    );
  }
}

/// アプリケーションレベル・エラー種別
enum AppErrorType {
  appInitializeError,
  flutterError,
  platformError,
  asynchronousError,
  noError;
}
