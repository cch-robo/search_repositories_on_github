import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:search_repositories_on_github/presentation/search_page/page_widget/search_page_widget.dart';
import 'package:search_repositories_on_github/use_case/publications.dart';

class ResultsPage extends ConsumerWidget {
  const ResultsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint('debug - ResultsPage - build');
    return Scaffold(
      appBar: AppBar(title: const Text('Results Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Text(
              '${ref.read(counterViewModelProvider).count}',
            ),
            ElevatedButton(
              onPressed: () => DetailPageRoute().go(context),
              child: const Text('Go to the Detail page'),
            ),
            ElevatedButton(
              onPressed: () => context.pop(),
              child: const Text('Go back to the Search page'),
            ),
          ],
        ),
      ),
    );
  }
}
