import 'package:flutter/material.dart';
import 'package:search_repositories_on_github/application/l10n/gen/app_localizations.dart';
import 'package:search_repositories_on_github/application/theme/theme.dart';
import 'package:search_repositories_on_github/presentation/search_page/page_widget/search_page_widget.dart';

/// グローバルにアクセス可能な Navigator のキー
///
GlobalKey<NavigatorState> globalNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'app');

/// グローバルにアクセス可能な Navigator 稼働中フラグ
bool get isGlobalNavigatorRunning => globalNavigatorKey.currentState != null;

/// グローバルにアクセスが可能な Navigator の [BuildContext]
BuildContext get globalNavigatorContext =>
    globalNavigatorKey.currentState!.context;

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorKey: globalNavigatorKey,
      theme: createThemeData(context),
      darkTheme: createDarkThemeData(context),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const SearchPage(title: 'Flutter Demo Home Page'),
    );
  }
}
