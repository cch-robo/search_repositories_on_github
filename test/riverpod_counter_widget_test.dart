import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:search_repositories_on_github/foundation/publications.dart';

import 'riverpod_depend_app.dart';

void main() {
  testWidgets('riverpod - Counter increments smoke test',
      (WidgetTester tester) async {
    debugLog('riverpod - CounterState increments smoke test');
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ProviderScope(child: MyApp()));

    final Finder finder = find.byKey(homePageCountKey);
    Text homeCounterLabel = finder.evaluate().single.widget as Text;

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);
    expect(homeCounterLabel.data, '0');

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
    homeCounterLabel = finder.evaluate().single.widget as Text;

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
    expect(homeCounterLabel.data, '1');
  });

  /// HomePage と SecondPage でカウンタ状態値の共有を確認する。
  testWidgets('riverpod - share Counter state between pages smoke test',
      (WidgetTester tester) async {
    debugLog('riverpod - share Counter state between pages smoke test');
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ProviderScope(child: MyApp()));

    final Finder homeCountFinder = find.byKey(homePageCountKey);
    Text homeCounterLabel = homeCountFinder.evaluate().single.widget as Text;

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
    homeCounterLabel = homeCountFinder.evaluate().single.widget as Text;

    // Verify that our counter has incremented.
    expect(find.byType(MyHomePage), findsOneWidget);
    expect(find.byType(MySecondPage), findsNothing);
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
    expect(homeCounterLabel.data, '1');

    // Tap the 'Go Second' button and trigger a frame.
    await tester.tap(find.byKey(homePageGoSecondKey));
    await tester.pumpAndSettle(); //画面遷移が完了するまで待機

    final Finder secondCountFinder = find.byKey(secondPageCountKey);
    final Text secondCounterLabel =
        secondCountFinder.evaluate().single.widget as Text;

    // Verify that our counter has incremented.
    expect(find.byType(MyHomePage), findsNothing);
    expect(find.byType(MySecondPage), findsOneWidget);
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
    expect(secondCounterLabel.data, '1');
  });
}
