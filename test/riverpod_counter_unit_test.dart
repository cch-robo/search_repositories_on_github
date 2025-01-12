import 'package:riverpod/riverpod.dart';
import 'package:search_repositories_on_github/foundation/publications.dart';
import 'package:test/test.dart';

import 'riverpod_depend_app.dart';
import 'riverpod_unit_test_utillity.dart';

void main() {
  test('riverpod CounterViewModel unit test', () {
    debugLog('riverpod counterViewModel unit test');

    // このテストのためにProviderContainerを作成します。
    // テスト間でのProviderContainerの共有はしてはいけません。

    // CounterState 状態モデルからカウント値を取得するテストです。
    final ProviderContainer container = createContainer();
    int count = container.read(counterViewModelProvider).count;

    expect(
      count,
      equals(0),
    );

    // CounterViewModel increment で、CounterState +1 にを更新する。
    container.read(counterViewModelProvider.notifier).increment();
    count = container.read(counterViewModelProvider).count;

    expect(
      count,
      equals(1),
    );
  });
}
