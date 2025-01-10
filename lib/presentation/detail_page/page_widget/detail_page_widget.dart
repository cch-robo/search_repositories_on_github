import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../ui_components/simple_button.dart';

class DetailPage extends HookConsumerWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint('debug - DetailPage - build');
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
