import 'package:flutter/material.dart';
import 'package:search_repositories_on_github/presentation/detail_page/page_widget/detail_page_widget.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('debug - ResultsPage - build');
    return Scaffold(
      appBar: AppBar(title: const Text('Results Page')),
      body: Center(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                await Navigator.of(context).push(
                  // ignore: argument_type_not_assignable
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const DetailPage(),
                  ),
                );
              },
              child: const Text('Go to the Detail page'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Go back to the Search page'),
            ),
          ],
        ),
      ),
    );
  }
}
