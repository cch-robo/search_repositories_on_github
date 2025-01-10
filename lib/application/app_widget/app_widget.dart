import 'package:flutter/material.dart';
import 'package:search_repositories_on_github/foundation/publications.dart';

import '../l10n/gen/app_localizations.dart';
import '../router/router.dart';
import '../theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
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
