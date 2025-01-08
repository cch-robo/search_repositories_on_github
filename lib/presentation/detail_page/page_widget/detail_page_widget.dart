import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:search_repositories_on_github/presentation/search_page/page_widget/search_page_widget.dart';

class DetailPage extends ConsumerWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint('debug - DetailPage - build');
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Text(
              '${ref.read(counterViewModelProvider).count}',
            ),
            ElevatedButton(
              onPressed: () => context.pop(),
              child: const Text('Go back to the Results page'),
            ),
          ],
        ),
      ),
    );
  }
}
