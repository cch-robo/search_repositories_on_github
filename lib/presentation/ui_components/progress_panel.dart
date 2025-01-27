import 'package:flutter/material.dart';

/// 表示領域いっぱいにプログレス表示するだけのWidget
///
/// ローディング中であれば画面いっぱいに広がりプログレス表示を行います。
class ProgressPanel extends StatelessWidget {
  const ProgressPanel({
    required bool isProgress,
    super.key,
  }) : _isProgress = isProgress;

  /// プログレス表示フラグ
  final bool _isProgress;

  @override
  Widget build(BuildContext context) {
    return _isProgress
        ? Container(
            color: Colors.transparent,
            alignment: Alignment.center,
            child: SizedBox(
              width: 48,
              height: 48,
              child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.inversePrimary,
                strokeWidth: 8,
              ),
            ),
          )
        : const SizedBox.shrink();
  }
}

/// プログレス表示画面種別
enum ProgressPageType {
  /// 検索条件入力画面
  search,

  /// 検索結果一覧画面
  results,

  /// 検索詳細画面
  detail;
}
