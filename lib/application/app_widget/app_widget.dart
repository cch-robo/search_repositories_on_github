import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:search_repositories_on_github/domain/for_supervisors.dart';
import 'package:search_repositories_on_github/domain/publications.dart';
import 'package:search_repositories_on_github/foundation/publications.dart';

import '../l10n/gen/app_localizations.dart';
import '../router/router.dart';
import '../theme/theme.dart';

class App extends HookWidget {
  const App({super.key});

  Dispose? _initState() {
    // domain レイヤの公開リポジトリインスタンスを設定
    final RestApiService apiService = RestApiService();
    final SearchedRepoRepository searchRepository =
        SearchedRepoRepository(apiService);
    searchedRepoRepositoryInstance = searchRepository;

    return _dispose;
  }

  Dispose? _dispose() {
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
