import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('debug - ResultsPage - build');
    return Scaffold(
      appBar: AppBar(title: const Text('Results Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => context.go('/results/detail'),
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
