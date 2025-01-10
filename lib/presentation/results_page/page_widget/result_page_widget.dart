import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:search_repositories_on_github/presentation/ui_components/progress_panel.dart';
import 'package:search_repositories_on_github/presentation/ui_components/repository_card.dart';

import '../../../application/router/routes.dart';
import '../../../foundation/publications.dart';

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

    //FIXME プロバイダもしくは検索サービスからの取得に修正すること。
    final List<int> items = List<int>.generate(
      50,
      (int index) => index,
    );
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
                const SliverAppBar(
                  title: Text('Results Page'),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return (index >= items.length)
                          ? null
                          : RepositoryCard(
                              id: index,
                              name: 'index:$index',
                              onPressed: (BuildContext context, int id) {
                                DetailPageRoute().go(context);
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
