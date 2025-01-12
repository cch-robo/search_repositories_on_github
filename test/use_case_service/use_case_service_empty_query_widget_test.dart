import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:search_repositories_on_github/application/app_widget/app_widget.dart';
import 'package:search_repositories_on_github/foundation/publications.dart';

void main() {
  testWidgets('use case service - empty query error test',
      (WidgetTester tester) async {
    debugLog('use case service - empty query error test');
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ProviderScope(child: App()));

    // 検索条件を何も指定しないで、検索ボタンをタップ
    await tester.tap(find.text('Search'));
    await tester.pumpAndSettle(); // 画面更新が完了するまで待機

    expect(find.text('There is no search query.'), findsOneWidget);
    // 【参考】同一シチュエーションでの画面表示については、
    // 英語環境で何も検索条件を入れずに検索ボタンをタップしたときのスナップショットを参照。
    // test/use_case_service/use_case_error_empty_query_dialog.png
  });
}
