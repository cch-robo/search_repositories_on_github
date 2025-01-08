import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:search_repositories_on_github/presentation/results_page/page_widget/result_page_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({required this.title, super.key});

  final String title;

  @override
  State<SearchPage> createState() => _SearchPageState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('title', title));
  }
}

class _SearchPageState extends State<SearchPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(
              onPressed: () async {
                await Navigator.of(context).push(
                  // ignore: argument_type_not_assignable
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const ResultsPage(),
                  ),
                );
              },
              child: const Text('Go to the Results page'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
