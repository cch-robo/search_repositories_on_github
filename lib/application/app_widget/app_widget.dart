import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:search_repositories_on_github/application/theme/theme.dart';
import 'package:search_repositories_on_github/presentation/home_page/page_widget/home_page_widget.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: createThemeData(context),
      darkTheme: createDarkThemeData(context),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'),
        Locale('jp'),
      ],
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
