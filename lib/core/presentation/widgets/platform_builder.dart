import 'package:flutter/material.dart';
import 'package:transcriber/utils/utils.dart';

enum PlatformType { android, ios, web, linux, macosx, other }

typedef _PlatformBuilder = Widget Function(BuildContext context);

class PlatformBuilder extends StatelessWidget {
  final _PlatformBuilder? cupertinoBuilder;
  final _PlatformBuilder? materialBuilder;
  final Widget? materialWidget;
  final Widget? cupertinoWidget;
  final PlatformType? platform;

  const PlatformBuilder.builder({
    Key? key,
    _PlatformBuilder? cupertino,
    _PlatformBuilder? material,
    this.platform,
  })  : cupertinoBuilder = cupertino,
        materialBuilder = material,
        cupertinoWidget = null,
        materialWidget = null,
        super(key: key);

  const PlatformBuilder({
    Key? key,
    Widget? cupertino,
    Widget? material,
    this.platform,
  })  : cupertinoWidget = cupertino,
        materialWidget = material,
        cupertinoBuilder = null,
        materialBuilder = null,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return platform?.when(
          android: () => (materialBuilder?.call(context) ?? materialWidget),
          ios: () => (cupertinoBuilder?.call(context) ?? cupertinoWidget),
          web: () => (materialBuilder?.call(context) ?? materialWidget),
          linux: () => (materialBuilder?.call(context) ?? materialWidget),
          macosx: () => (materialBuilder?.call(context) ?? materialWidget),
          orElse: () => Utils.isPlatform(
            cupertino: (cupertinoBuilder?.call(context) ?? cupertinoWidget),
            material: (materialBuilder?.call(context) ?? materialWidget),
          ),
        ) ??
        Utils.isPlatform(
          cupertino: (cupertinoBuilder?.call(context) ?? cupertinoWidget),
          material: (materialBuilder?.call(context) ?? materialWidget),
        ) ??
        Utils.nothing;
  }
}

extension on PlatformType {
  T when<T>({
    T Function()? android,
    T Function()? ios,
    T Function()? web,
    T Function()? linux,
    T Function()? macosx,
    required T Function() orElse,
  }) {
    switch (this) {
      case PlatformType.android:
        return android?.call() ?? orElse();
      case PlatformType.ios:
        return ios?.call() ?? orElse();
      case PlatformType.web:
        return web?.call() ?? orElse();
      case PlatformType.linux:
        return linux?.call() ?? orElse();
      case PlatformType.macosx:
        return macosx?.call() ?? orElse();
      default:
        return orElse();
    }
  }
}
