import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../results_page/view_model/results_page_view_model.dart';
import '../search_page/view_model/search_page_view_model.dart';

/// 表示領域いっぱいにプログレス表示するだけのWidget
///
/// SearchPage, ResultsPage, DetailPage 別で、
/// 各画面用のプロバイダが提供するローディング中フラグを監視させ、
/// ローディング中になれば画面いっぱいに広がりプログレス表示を行います。
class ProgressPanel extends ConsumerWidget {
  const ProgressPanel({
    required ProgressPageType type,
    super.key,
  }) : _type = type;

  /// プログレス表示対象画面種別
  final ProgressPageType _type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // bool isSearching フラグを監視する。
    final bool isProgress = switch (_type) {
      ProgressPageType.search =>
        ref.watch(searchPageViewModelProvider.notifier).isSearching,
      ProgressPageType.results =>
        ref.watch(resultsPageViewModelProvider.notifier).isSearching,
      ProgressPageType.detail => false,
    };

    return isProgress
        ? Container(
            color: Colors.transparent,
            alignment: Alignment.center,
            child: const SizedBox(
              width: 48,
              height: 48,
              child: CircularProgressIndicator(
                color: Colors.blue,
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
