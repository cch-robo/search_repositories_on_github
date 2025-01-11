import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:search_repositories_on_github/domain/publications.dart';

import '../../ui_components/simple_text.dart';
import '../view_model/detail_page_view_model.dart';

class DetailPage extends HookConsumerWidget {
  const DetailPage({required this.index, super.key});
  final int index;

  Dispose? _initState() {
    return _dispose;
  }

  Dispose? _dispose() {
    return null;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint('debug - DetailPage - build');
    useEffect(_initState, <Object?>[]);

    final DetailPageViewModel viewModel =
        ref.read(detailPageViewModelProvider.notifier);
    final RepoModel repo = viewModel.getRepoInfo(index)!;

    return Scaffold(
      appBar: AppBar(title: const Text('Detail Page')),
      body: SafeArea(
        top: true,
        bottom: true,
        left: true,
        right: true,
        child: Column(
          children: <Widget>[
            // スクロール可能なコンテンツ
            Expanded(
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: <Widget>[
                      const SimpleText('GitHub リポジトリ検索'),
                      const Divider(),
                      ListTile(
                        title: const SimpleText('リポジトリ名'),
                        subtitle: SimpleText(repo.name, size: FontSize.medium),
                      ),
                      const Divider(),
                      FittedBox(
                        fit: BoxFit.contain,
                        child: Image.network(repo.ownerAvatarUrl),
                      ),
                      const Divider(),
                      ListTile(
                        title: const SimpleText('プロジェクト言語'),
                        subtitle:
                            SimpleText(repo.language, size: FontSize.medium),
                      ),
                      const Divider(),
                      ListTile(
                        title: const SimpleText('Star 数'),
                        subtitle: SimpleText(repo.startsCount.toString(),
                            size: FontSize.medium),
                      ),
                      const Divider(),
                      ListTile(
                        title: const SimpleText('Watcher 数'),
                        subtitle: SimpleText(repo.watchersCount.toString(),
                            size: FontSize.medium),
                      ),
                      const Divider(),
                      ListTile(
                        title: const SimpleText('Fork 数'),
                        subtitle: SimpleText(repo.forksCount.toString(),
                            size: FontSize.medium),
                      ),
                      const Divider(),
                      ListTile(
                        title: const SimpleText('Issue 数'),
                        subtitle: SimpleText(repo.issuesCount.toString(),
                            size: FontSize.medium),
                      ),
                      const Divider(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('index', index));
  }
}
