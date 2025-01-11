import 'package:flutter/material.dart';

/// ユースケースレベルのエラーダイアログ表示サービス
class UseCaseErrorHDialog {
  Future<void> showErrorAlertDialog({
    required BuildContext context,
    required String title,
    required String message,
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
              actions: <Widget>[
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
