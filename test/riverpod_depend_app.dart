// riverpod 依存アプリ
// riverpod 導入のスモークテスト（基本機能動作確認）用に設けた、ローカル・アプリコードです。
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'riverpod_depend_app.g.dart';

const Key homePageKey = Key('home_page');
const Key homePageCountKey = Key('home_count');
const Key homePageGoSecondKey = Key('home_go_second');

const Key secondPageKey = Key('second_page');
const Key secondPageCountKey = Key('second_count');
const Key secondPageGoBackKey = Key('second_go_back');

@immutable
class CounterState {
  const CounterState(this.count);

  final int count;
}

@riverpod
class CounterViewModel extends _$CounterViewModel {
  CounterViewModel();

  @override
  CounterState build() {
    return const CounterState(0);
  }

  void increment() {
    state = CounterState(state.count + 1);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Riverpod depend App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage() : super(key: homePageKey);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint('debug - MyHomePage - build');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${ref.watch(counterViewModelProvider).count}',
              style: Theme.of(context).textTheme.headlineMedium,
              key: homePageCountKey,
            ),
            ElevatedButton(
              key: homePageGoSecondKey,
              onPressed: () async {
                await Navigator.of(context).push(
                  // ignore: argument_type_not_assignable
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const MySecondPage(),
                  ),
                );
              },
              child: const Text('Go to the Second page'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            ref.read(counterViewModelProvider.notifier).increment(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class MySecondPage extends ConsumerWidget {
  const MySecondPage() : super(key: secondPageKey);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint('debug - MySecondPage - build');
    return Scaffold(
      appBar: AppBar(title: const Text('Second Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Text(
              '${ref.read(counterViewModelProvider).count}',
              key: secondPageCountKey,
            ),
            ElevatedButton(
              key: secondPageGoBackKey,
              onPressed: () => Navigator.pop(context),
              child: const Text('Go back to the Home page'),
            ),
          ],
        ),
      ),
    );
  }
}
