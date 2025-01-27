import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:search_repositories_on_github/application/publications.dart';
import 'package:search_repositories_on_github/domain/publications.dart';
import 'package:search_repositories_on_github/foundation/publications.dart';

import '../../shared_state_on_pages/state/search_condition_state.dart';
import '../../ui_components/progress_panel.dart';
import '../../ui_components/repository_card.dart';
import '../view_model/results_page_view_model.dart';

class ResultsPage extends HookConsumerWidget {
  const ResultsPage({super.key});

  Dispose? _initState() {
    // 画面方向指定解除（全方向指定）
    unawaited(
      SystemChrome.setPreferredOrientations(<DeviceOrientation>[
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]),
    );
    return _dispose;
  }

  Dispose? _dispose() {
    // 画面方向を（縦方向のみ）に指定
    unawaited(
      SystemChrome.setPreferredOrientations(<DeviceOrientation>[
        DeviceOrientation.portraitUp,
      ]),
    );
    return null;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugLog('debug - ResultsPage - build');
    final ScrollController scrollController = useScrollController();
    useEffect(_initState, <Object?>[scrollController]);

    final ResultsPageViewModel viewModel =
        ref.read(resultsPageViewModelProvider.notifier);

    return Stack(
      children: <Widget>[
        Scaffold(
          body: SafeArea(
            top: true,
            bottom: true,
            left: true,
            right: true,
            child: CustomScrollView(
              controller: scrollController,
              slivers: <Widget>[
                SliverAppBar(
                  title: Text(l10n(context).resultsPageTitle),
                  pinned: true,
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      final RepoModel? repo = viewModel.getRepoInfo(
                        context,
                        index,
                        scrollController,
                      );
                      return repo == null
                          ? null
                          : RepositoryCard(
                              index: index,
                              name: repo.name ?? '',
                              onPressed: (BuildContext context, int index) {
                                // カードがタップされたら、DetailPage で詳細を表示する。
                                DetailPageRoute(index: index).go(context);
                              },
                            );
                    },
                    /*
                    childCount: 50, // 無限スクロール対応のためコメントアウト
                    */
                  ),
                ),
              ],
            ),
          ),
        ),
        Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            // プログレス表示を行わせるプロバイダの state を監視する。
            final Condition condition =
                ref.watch(resultsPageViewModelProvider).condition;

            // 検索実行中のプログレス表示用
            return ProgressPanel(isProgress: Condition.searching == condition);
          },
        ),
      ],
    );
  }
}
