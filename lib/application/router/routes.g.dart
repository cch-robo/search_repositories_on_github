// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $searchPageRoute,
    ];

RouteBase get $searchPageRoute => GoRouteData.$route(
      path: '/',
      factory: $SearchPageRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'results',
          factory: $ResultsPageRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'detail',
              factory: $DetailPageRouteExtension._fromState,
            ),
          ],
        ),
      ],
    );

extension $SearchPageRouteExtension on SearchPageRoute {
  static SearchPageRoute _fromState(GoRouterState state) => SearchPageRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ResultsPageRouteExtension on ResultsPageRoute {
  static ResultsPageRoute _fromState(GoRouterState state) => ResultsPageRoute();

  String get location => GoRouteData.$location(
        '/results',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $DetailPageRouteExtension on DetailPageRoute {
  static DetailPageRoute _fromState(GoRouterState state) => DetailPageRoute(
        index: int.parse(state.uri.queryParameters['index']!),
      );

  String get location => GoRouteData.$location(
        '/results/detail',
        queryParams: {
          'index': index.toString(),
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
