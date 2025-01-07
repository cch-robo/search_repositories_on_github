import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:search_repositories_on_github/application/app_widget/app_widget.dart';

/// アプリレベルのエラーダイアログ表示サービス
class AppErrorHandlerDialog {
  Future<void> showErrorAlertDialog({
    required BuildContext context,
    required String title,
    required String message,
    required bool isExitApp,
  }) async {
    if (context.mounted) {
      await showDialog<void>(
        context: context,
        useRootNavigator: true,
        barrierDismissible: false,
        builder: (BuildContext context) {
          // バックボタンでのダイアログ表示クローズを抑止します。
          return PopScope(
            canPop: false,
            child: AlertDialog(
              title: Text(title),
              content: SingleChildScrollView(
                child: Text(message),
              ),
              // Apple human interface よりアプリを終了させるのはユーザです。
              // Androidアプリの SystemNavigator.pop() はプロセス終了でないため
              // Recent App List に残ったタスクの消去はユーザ操作となります。
              // このためiOS/Android でのアプリ終了は、ユーザに依頼するのでボタンはありません。
              actions: <Widget>[
                if (!isExitApp)
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('OK'),
                  ),
              ],
            ),
          );
        },
      );
    }
  }
}

/// アプリレベルのエラーダイアログ表示サービス・ウィジェット
///
/// アプリ未起動時用のエラー表示だけの AppWidget です。
class ShowErrorDialogApp extends StatelessWidget {
  const ShowErrorDialogApp({
    required this.title,
    required this.message,
    super.key,
  });

  final String title;
  final String message;

  Future<void> _showError() async {
    final AppErrorHandlerDialog errorDialog = AppErrorHandlerDialog();
    if (isGlobalNavigatorRunning) {
      final BuildContext context = globalNavigatorContext;
      if (context.mounted) {
        await errorDialog.showErrorAlertDialog(
          context: context,
          title: title,
          message: message,
          isExitApp: true,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Future<void>.delayed(const Duration(milliseconds: 500), _showError);
    return MaterialApp(
      navigatorKey: globalNavigatorKey,
      home: const Scaffold(),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('message', message));
    properties.add(StringProperty('title', title));
  }
}
