import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:search_repositories_on_github/application//publications.dart';
import 'package:search_repositories_on_github/presentation/ui_components/app_icon.dart';

part 'search_page_widget.g.dart';

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

class SearchPage extends ConsumerWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint('debug - SearchPage - build');
    return Scaffold(
      appBar: AppBar(
        leading: const AppIcon(),
        title: const Text('Search Page'),
      ),
      body: SafeArea(
        top: true,
        bottom: true,
        left: true,
        right: true,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '${ref.watch(counterViewModelProvider).count}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              ElevatedButton(
                onPressed: () => ResultsPageRoute().go(context),
                child: const Text('Go to the Results page'),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            ref.read(counterViewModelProvider.notifier).increment(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
