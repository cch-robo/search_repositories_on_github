import 'package:flutter/material.dart';
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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
