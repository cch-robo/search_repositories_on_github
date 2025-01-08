import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:search_repositories_on_github/presentation/detail_page/page_widget/detail_page_widget.dart';
import 'package:search_repositories_on_github/presentation/results_page/page_widget/result_page_widget.dart';
import 'package:search_repositories_on_github/presentation/search_page/page_widget/search_page_widget.dart';

part 'routes.g.dart';

@TypedGoRoute<SearchPageRoute>(
  path: '/',
  routes: <TypedRoute<RouteData>>[
    TypedGoRoute<ResultsPageRoute>(
      path: 'results',
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<DetailPageRoute>(
          path: 'detail',
        ),
      ],
    ),
  ],
)
@immutable
class SearchPageRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SearchPage();
  }
}

@immutable
class ResultsPageRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ResultsPage();
  }
}

@immutable
class DetailPageRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const DetailPage();
  }
}
