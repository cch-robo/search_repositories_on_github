import 'package:flutter/material.dart';
import 'package:search_repositories_on_github/application/l10n/gen/app_localizations.dart';
import 'package:search_repositories_on_github/application/router/router.dart';
import 'package:search_repositories_on_github/application/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Flutter Demo',
      theme: createThemeData(context),
      darkTheme: createDarkThemeData(context),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
