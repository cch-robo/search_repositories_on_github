import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../ui_components/simple_button.dart';
import '../view_model/detail_page_view_model.dart';

class DetailPage extends HookConsumerWidget {
  const DetailPage({super.key});

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

    return Scaffold(
      appBar: AppBar(title: const Text('Detail Page')),
      body: SafeArea(
        top: true,
        bottom: true,
        left: true,
        right: true,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              SimpleButton(
                label: 'back to Results page',
                onPressed: (BuildContext context) {
                  context.pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
