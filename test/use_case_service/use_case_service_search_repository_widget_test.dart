import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:search_repositories_on_github/application/app_widget/app_widget.dart';
import 'package:search_repositories_on_github/domain/publications.dart';
import 'package:search_repositories_on_github/foundation/publications.dart';
import 'package:search_repositories_on_github/presentation/results_page/page_widget/results_page_widget.dart';
import 'package:search_repositories_on_github/use_case/publications.dart';

import 'search_result_curry_rice_json.dart';
import 'search_result_next_page_2_json.dart';
import 'search_result_next_page_3_json.dart';
import 'use_case_service_test_mocks.dart';

void main() {
  // Widget Test を利用した、ユースケースサービスの単体テスト
  //
  // ユースケースサービス SearchRepoService は、
  // 検索条件画面 Search Page での「検索」ボタンのタップによる検索や、
  // 検索結果一覧画面 Results Page での無限スクロールによる次ページデータ取得や、
  //
  // 検索結果一覧画面でタップされたリポジトリ名の index 番号から、
  // 検索詳細画面 Detail Page での index 番号リポジトリ情報の提供を行います。
  //
  // ユースケースサービスは、リポジトリ SearchedRepoRepository からデータを取得し、
  // リポジトリは、REST API サービス RestApiService から REST API 結果を取得します。
  // 以上から、ユースケースサービスの単体テストは、リポジトリのテストも担っていることになります。
  // 【注意】REST API サービスについては、Dio ライブラリを使っているので、テストを行いません。
  // 　　　　Dio ライブラリのテストになってしまうため。
  //
  // Widget Test では、ネットワークを使えないため REST API Service をモックと置き換え、
  // REST API Service からは、実際の検索結果のレスポンスデータを返却させてテストを行います。
  //
  testWidgets('use case service - search repository test',
      (WidgetTester tester) async {
    debugLog('use case service - search repository test');

    // サーバ API をコールする RestApiService をダミーレスポンスを使うモックと換装し、
    // サービスは、検索条件を強制的に README "カレーライス"に強制するだけのモックと換装して、
    // リポジトリとサービスのテスト実態はオリジナルのものを使います。
    final MockRestApiService mockApiService = MockRestApiService(
      searchResponseByCurryRice,
      searchResponseByCurryRiceAtPage2,
      searchResponseByCurryRiceAtPage3,
    );
    final SearchedRepoRepository searchRepo =
        SearchedRepoRepository(mockApiService);
    final SearchRepoService useCaseService = MockSearchRepoService(searchRepo);

    // Build our app and trigger a frame.
    await tester.pumpWidget(
      ProviderScope(
        child: App(
          apiService: mockApiService,
          searchRepo: searchRepo,
          service: useCaseService,
        ),
      ),
    );

    // Step.1 条件を指定した検索で、
    // 検索結果を取得して、検索結果一覧 Results Page を表示させるテスト。
    //
    // ユースケースサービス SearchRepoService のクエリ検索テスト
    // Future<SearchInfo?> searchRepoByInQuery() メソッドのテスト。

    // 検索条件をREADME条件が"カレーライス"に強制して、検索ボタンをタップ
    await tester.tap(find.text('Search'));
    await tester.pumpAndSettle(); // 画面更新が完了するまで待機

    debugLog('\nStep.1 - README条件 "カレーライス"での検索ボタンをタップした結果');
    int index = 0;
    for (final RepoModel repo in useCaseService.searchInfo!.repositories) {
      debugLog('index=${index++} - リポジトリ名:${repo.name}');
    }

    // Results Page が表示される。 （検索一覧中に ChatApp リポジトリがある）
    expect(find.text('ChatApp'), findsOneWidget);
    // 【参考】同一シチュエーションでの Results Page 画面表示については、
    // README条件に"カレーライス"を指定して検索ボタンをタップしたときのスナップショットを参照。
    // test/use_case_service/search_result_results_page.png

    // Step.2 検索結果一覧から、
    // リポジトリ名をタップして検索結果詳細 Detail Page を表示させるテスト。
    //
    // ユースケースサービス SearchRepoService のクエリ検索テスト
    // ({int left, RepoModel? repo}) getRepoInfo(int index) メソッドのテスト

    // 検索一覧の ChatApp リポジトリ名をタップする。（ChatAppは、7番目で index は6）
    // 注意：遷移先の Detail Page は、オーナーアイコン画像を表示するためネットワークを使います。
    // Widget Test では、ネットワークを使えない前提のため例外が発生してテストに失敗します。
    // このためタップして画面遷移させるのでなく、このテストでは、別の方法でテストします。
    /*
    await tester.tap(find.text('ChatApp'));
    await tester.pumpAndSettle(); // 画面更新が完了するまで待機 ⇒ 例外が発生する。
    */

    // 検索一覧の ChatApp リポジトリ名の情報詳細を取得する（ChatAppは、7番目で index は6）
    final ({int left, RepoModel? repo}) res = useCaseService.getRepoInfo(6);
    expect(res.repo!.name, 'ChatApp'); //リポジトリ名
    expect(
      res.repo!.ownerAvatarUrl,
      'https://avatars.githubusercontent.com/u/112800723?v=4',
    ); //オーナーアイコン URL
    // 【参考】同一シチュエーションでの Detail Page 画面表示については、
    // Results Page の検索一覧の7番目(index 6)をタップしたときのスナップショットを参照
    // test/use_case_service/search_result_index_6_chatApp_detail_page.png
    //
    // オーナーアイコンの URL と画像については、以下のスナップショットを参照
    // URL https://avatars.githubusercontent.com/u/112800723?v=4
    // test/use_case_service/search_result_index_6_chatApp_owner_icon.png

    debugLog('\nStep.2 - リポジトリ名 ChatApp、index番号 6 のタップで表示される詳細');
    debugLog('リポジトリ名:${res.repo!.name}');
    debugLog('オーナーアイコン URL:${res.repo!.ownerAvatarUrl}');
    debugLog('プロジェクト言語:${res.repo!.language}');
    debugLog('Star 数:${res.repo!.startsCount}');
    debugLog('Fork 数:${res.repo!.forksCount}');
    debugLog('Watcher 数:${res.repo!.watchersCount}');
    debugLog('Issue 数:${res.repo!.issuesCount}');

    // Step.3 検索結果一覧画面 Results Page の無限スクロールにより、
    // 次ページの検索を表示させるテスト。

    // Results Page ⇒ ResultsPage クラスの検索一覧の無限スクロールは、
    // 表示データがなければ次ページを取得するためユースケーサービス SearchRepoServiceの
    // 次ページ検索メソッド addNextRepositories() を実行するロジックになっているので、
    // このメソッドを連続実行させれば、無限スクロール実行時の単体テストが行えることになります。
    //
    // もう少し詳しい説明については、下記を御一読ください。
    // Results Page ⇒ ResultsPage クラスの検索一覧の無限スクロールについて

    // 初回検索実行後は、1ページ目のデータが取得されているので、
    // 検索ごとのページアイテム長 pageItemCount と firstItemCounts を取得しておきます。
    final SearchInfo firstState = useCaseService.searchInfo!;
    final int pageItemCount = firstState.repositories.length;
    final int firstItemCounts = pageItemCount;
    debugLog('\nstep.3 - '
        '「検索」ボタン押下で取得されたリポジトリ数 => $firstItemCounts と '
        'リポジトリ総数 => ${firstState.totalCount} ');

    // 無限スクロールが発生したとして、次ページ検査検索を実行させる。
    // 検索結果一覧画面 Results Page の context 取得
    final BuildContext context = tester.element(
      find.byWidgetPredicate((Widget widget) => widget is ResultsPage),
    );
    final SearchInfo? secondState =
        await useCaseService.addNextRepositories(context: context);

    // 初回検索結果より、１ページ分アイテム数が増えているかチェック
    final int secondItemCounts = secondState!.repositories.length;
    expect(secondItemCounts, firstItemCounts + pageItemCount);

    debugLog('\nStep.3 - 無限スクロールによる、最初の次のページ検索後のリポジトリ数');
    debugLog('リポジトリ数:${secondState.repositories.length} '
        'リポジトリ総数:${secondState.totalCount}');

    // Step.4 無限スクロールにより、さらに次ページの検索を表示させるテスト。
    final SearchInfo? thirdState =
        await useCaseService.addNextRepositories(context: context);

    // 前回検索結果より、１ページ分アイテム数が増えていないことをチェック（検索総数は、42件のため）
    final int thirdItemCounts = thirdState!.repositories.length;
    expect(thirdItemCounts, lessThan(secondItemCounts + pageItemCount));
    expect(thirdItemCounts, 42);

    debugLog('\nStep.4 - 無限スクロールによる、２回めの次のページ検索後のリポジトリ数');
    debugLog('リポジトリ数:${thirdState.repositories.length} '
        'リポジトリ総数:${thirdState.totalCount}');

    // Step.5 既に全データ取得なら、無限スクロールによる次ページの検索を行わないテスト。
    final SearchInfo? fourthState =
        await useCaseService.addNextRepositories(context: context);

    // 前回検索結果より、変化がないことをチェック（検索総数は、42件で既に全件取得済みのため）
    final int fourthItemCounts = fourthState!.repositories.length;
    expect(fourthItemCounts, thirdItemCounts);

    debugLog('\nStep.5 - 既に全件取得済みなら、無限スクロールによる次のページ検索が発生しない');
    debugLog('リポジトリ数:${fourthState.repositories.length} '
        'リポジトリ総数:${fourthState.totalCount}');

    // Results Page ⇒ ResultsPage クラスの検索一覧の無限スクロールについて、
    //
    // Results Page ⇒ ResultsPage クラスの検索一覧の無限スクロールで、
    // 表示データがなければ次のページを取得するロジックの実装部。
    //
    // ```dart
    // final RepoModel? repo =
    //   viewModel.getRepoInfo(context, index);
    // return repo == null
    //   ? null
    //   : RepositoryCard(...) // 検索結果一覧でのリポジトリ名表示カード
    // ```
    //
    // ResultsPage の ViewModel ⇒ ResultsPageViewModel クラスは、
    // ユースケースサービス SearchRepoService の getRepoInfo(index)を使い、
    //
    // index 番号のリポジトリ情報が取得できなければ ⇒ 未取得であれば、
    // ユースケースサービス addNextRepositories(context: context) を利用して、
    // 次ページ検索を実行するだけなので、addNextRepositories() を連続実行させれば、
    // 無限スクロール実行時の単体テストが行えることになります。

    // ResultsPage の ViewModel ⇒ ResultsPageViewModel クラスは、
    // ユースケースサービス SearchRepoService の getRepoInfo(index)と、
    // ユースケースサービス SearchRepoService の getRepoInfo(index)と、
    // addNextRepositories(context: context) を利用して次ページ検索を実行するだけなので、
    // ユースケースサービス SearchRepoService の addNextRepositories()

    // このテストは、Widget Test を利用した、ユースケースサービスの単体テストなので、
  });
}
