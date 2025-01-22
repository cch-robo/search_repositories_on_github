import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:search_repositories_on_github/application/publications.dart';
import 'package:search_repositories_on_github/domain/publications.dart';
import 'package:search_repositories_on_github/foundation/publications.dart';

import '../../ui_components/progress_panel.dart';
import '../../ui_components/repository_card.dart';
import '../view_model/results_page_view_model.dart';

class ResultsPage extends HookConsumerWidget {
  const ResultsPage({super.key});

  Dispose? _initState() {
    return _dispose;
  }

  Dispose? _dispose() {
    return null;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugLog('debug - ResultsPage - build');
    useEffect(_initState, <Object?>[]);

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
              slivers: <Widget>[
                SliverAppBar(
                  title: Text(l10n(context).resultsPageTitle),
                  pinned: true,
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  surfaceTintColor: Theme.of(context).colorScheme.surface,
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      final RepoModel? repo =
                          viewModel.getRepoInfo(context, index);
                      return repo == null
                          ? null
                          : RepositoryCard(
                              index: index,
                              name: repo.name,
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
        // 検索実行中のプログレス表示用
        const ProgressPanel(type: ProgressPageType.results),
      ],
    );
  }
}
