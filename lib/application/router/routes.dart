import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:search_repositories_on_github/presentation/publications.dart';

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
    return ResultsPage();
  }
}

@immutable
class DetailPageRoute extends GoRouteData {
  const DetailPageRoute({required this.index});
  final int index;
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return DetailPage(index: index);
  }
}
