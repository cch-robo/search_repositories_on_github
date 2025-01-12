import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:search_repositories_on_github/domain/for_supervisors.dart';
import 'package:search_repositories_on_github/domain/publications.dart';
import 'package:search_repositories_on_github/foundation/publications.dart';
import 'package:search_repositories_on_github/use_case/publications.dart';

import '../l10n/gen/app_localizations.dart';
import '../router/router.dart';
import '../theme/theme.dart';

class App extends HookWidget {
  const App({
    RestApiService? apiService,
    SearchedRepoRepository? searchRepo,
    SearchRepoService? service,
    super.key,
  })  : _apiService = apiService,
        _searchRepo = searchRepo,
        _useCaseService = service;

  /// （オプション）テストモック注入用インスタンス
  ///
  /// _アプリ起動用の main.drat では利用されない。_
  final RestApiService? _apiService;

  /// （オプション）テストモック注入用インスタンス
  ///
  /// _アプリ起動用の main.dart では利用されない。_
  final SearchedRepoRepository? _searchRepo;

  /// （オプション）テストモック注入用インスタンス
  ///
  /// _アプリ起動用の main.dart では利用されない。_
  final SearchRepoService? _useCaseService;

  Dispose? _initState() {
    debugLog('debug - AppWidget - initState');
    // domain レイヤの公開リポジトリインスタンスを設定
    final RestApiService apiService = _apiService ?? RestApiService();
    final SearchedRepoRepository searchRepo =
        _searchRepo ?? SearchedRepoRepository(apiService);
    searchRepository = searchRepo;

    // use_case レイヤの公開サービスインスタンスを設定
    final SearchRepoService service =
        _useCaseService ?? SearchRepoService(searchRepo);
    searchRepoService = service;

    return _dispose;
  }

  Dispose? _dispose() {
    debugLog('debug - AppWidget - dispose');
    return null;
  }

  @override
  Widget build(BuildContext context) {
    useEffect(_initState, <Object?>[]);
    debugLog('debug - AppWidget - build');
    return MaterialApp.router(
      restorationScopeId: 'app',
      routerConfig: router,
      title: 'Search Repo',
      theme: createThemeData(context),
      darkTheme: createDarkThemeData(context),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
