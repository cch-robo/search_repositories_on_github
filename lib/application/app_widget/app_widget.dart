import 'package:flutter/material.dart';

import '../l10n/gen/app_localizations.dart';
import '../router/router.dart';
import '../theme/theme.dart';

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
