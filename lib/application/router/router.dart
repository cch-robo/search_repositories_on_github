import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:search_repositories_on_github/presentation/detail_page/page_widget/detail_page_widget.dart';
import 'package:search_repositories_on_github/presentation/results_page/page_widget/result_page_widget.dart';
import 'package:search_repositories_on_github/presentation/search_page/page_widget/search_page_widget.dart';

/// グローバルにアクセス可能な Navigator のキー
///
/// [GoRouter] navigatorKey プロパティに設定します。
GlobalKey<NavigatorState> globalNavigatorKey = GlobalKey<NavigatorState>();

/// グローバルにアクセス可能な Navigator 稼働中フラグ
bool get isGlobalNavigatorRunning => globalNavigatorKey.currentState != null;

/// グローバルにアクセスが可能な Navigator の [BuildContext]
BuildContext get globalNavigatorContext =>
    globalNavigatorKey.currentState!.context;

final GoRouter router = GoRouter(
  navigatorKey: globalNavigatorKey,
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: 'search',
      builder: (BuildContext context, GoRouterState state) {
        return const SearchPage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'results',
          builder: (BuildContext context, GoRouterState state) {
            return const ResultsPage();
          },
          routes: <RouteBase>[
            GoRoute(
              path: 'detail',
              builder: (BuildContext context, GoRouterState state) {
                return const DetailPage();
              },
            ),
          ],
        ),
      ],
    ),
  ],
);
