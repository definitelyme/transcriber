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
    },
    BluetoothConnectRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const BluetoothConnectScreen()),
        fullscreenDialog: true,
      );
    },
    AudioListRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const AudioListScreen()),
      );
    },
    AudioDetailRoute.name: (routeData) {
      final args = routeData.argsAs<AudioDetailRouteArgs>();
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: AudioDetailScreen(
          args.audio,
          key: args.key,
        )),
        fullscreenDialog: true,
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          RecordingRoute.name,
          path: '/',
          fullMatch: true,
          usesPathAsKey: true,
        ),
        RouteConfig(
          BluetoothConnectRoute.name,
          path: '/bluetooth-connect-screen',
          fullMatch: true,
          usesPathAsKey: true,
        ),
        RouteConfig(
          AudioListRoute.name,
          path: '/audio-list-screen',
          fullMatch: true,
          usesPathAsKey: true,
        ),
        RouteConfig(
          AudioDetailRoute.name,
          path: '/audio-detail-screen',
          fullMatch: true,
          usesPathAsKey: true,
        ),
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

/// generated route for
/// [BluetoothConnectScreen]
class BluetoothConnectRoute extends PageRouteInfo<void> {
  const BluetoothConnectRoute()
      : super(
          BluetoothConnectRoute.name,
          path: '/bluetooth-connect-screen',
        );

  static const String name = 'BluetoothConnectRoute';
}

/// generated route for
/// [AudioListScreen]
class AudioListRoute extends PageRouteInfo<void> {
  const AudioListRoute()
      : super(
          AudioListRoute.name,
          path: '/audio-list-screen',
        );

  static const String name = 'AudioListRoute';
}

/// generated route for
/// [AudioDetailScreen]
class AudioDetailRoute extends PageRouteInfo<AudioDetailRouteArgs> {
  AudioDetailRoute({
    required AudioEntity audio,
    Key? key,
  }) : super(
          AudioDetailRoute.name,
          path: '/audio-detail-screen',
          args: AudioDetailRouteArgs(
            audio: audio,
            key: key,
          ),
        );

  static const String name = 'AudioDetailRoute';
}

class AudioDetailRouteArgs {
  const AudioDetailRouteArgs({
    required this.audio,
    this.key,
  });

  final AudioEntity audio;

  final Key? key;

  @override
  String toString() {
    return 'AudioDetailRouteArgs{audio: $audio, key: $key}';
  }
}
