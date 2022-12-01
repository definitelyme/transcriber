// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    RecordingRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const RecordingScreen()),
      );
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          RecordingRoute.name,
          path: '/',
          fullMatch: true,
          usesPathAsKey: true,
        )
      ];
}

/// generated route for
/// [RecordingScreen]
class RecordingRoute extends PageRouteInfo<void> {
  const RecordingRoute()
      : super(
          RecordingRoute.name,
          path: '/',
        );

  static const String name = 'RecordingRoute';
}
