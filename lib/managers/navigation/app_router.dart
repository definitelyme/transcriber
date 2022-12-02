library app_router.dart;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:transcriber/features/record/presentation/index.dart';

part 'app_router.gr.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Screen,Route',
  preferRelativeImports: false,
  routes: <AutoRoute<dynamic>>[
    AutoRoute(
      initial: true,
      fullMatch: true,
      usesPathAsKey: true,
      page: RecordingScreen,
    ),
    AutoRoute(
      fullMatch: true,
      usesPathAsKey: true,
      fullscreenDialog: true,
      page: BluetoothConnectScreen,
    ),
    AutoRoute(
      fullMatch: true,
      usesPathAsKey: true,
      page: AudioListScreen,
    ),
    AutoRoute(
      fullMatch: true,
      usesPathAsKey: true,
      fullscreenDialog: true,
      page: AudioDetailScreen,
    ),
  ],
)
class AppRouter extends _$AppRouter {
  AppRouter([super.navigatorKey]);
}
