import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../router/routes.dart';

/// グローバルにアクセス可能な Navigator のキー
///
/// [GoRouter] navigatorKey プロパティに設定します。
GlobalKey<NavigatorState> globalNavigatorKey = GlobalKey<NavigatorState>();

/// グローバルにアクセス可能な Navigator 稼働中フラグ
bool get isGlobalNavigatorRunning => globalNavigatorKey.currentState != null;

/// グローバルにアクセスが可能な Navigator の [BuildContext]
BuildContext get globalNavigatorContext =>
    globalNavigatorKey.currentState!.context;

final GoRouter router =
    GoRouter(navigatorKey: globalNavigatorKey, routes: $appRoutes);
