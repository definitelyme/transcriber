library hive_client.dart;

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:transcriber/utils/utils.dart';

/// State of HiveClient initialization
/// - [HiveClientStatus.loading] - When Hive is initializing
/// - [HiveClientStatus.loaded] - When Hive has been initialized
/// - [HiveClientStatus.error] - When Hive failed to initialize with an error
enum HiveClientStatus {
  loading,
  loaded,
  error;

  T? when<T>({T Function()? loading, T Function()? loaded, T Function()? error}) {
    switch (this) {
      case HiveClientStatus.loading:
        return loading?.call();
      case HiveClientStatus.loaded:
        return loaded?.call();
      case HiveClientStatus.error:
        return error?.call();
      default:
        return null;
    }
  }
}

class HiveClient {
  static const _hiveBoxPrefix = '${Const.packageName}.hive_box';
  static const _settingsBox = '$_hiveBoxPrefix.device_settings';
  static const _fontsBox = '${_hiveBoxPrefix}__fonts_box';

  static final StreamController<HiveClientStatus> _hiveStatusController = StreamController<HiveClientStatus>.broadcast();

  const HiveClient._();

  static Box<dynamic>? get settingsBox => isOpen(_settingsBox) ? box<dynamic>(_settingsBox) : null;
  static Box<FontManager>? get fontsBox => isOpen(_fontsBox) ? box<FontManager>(_fontsBox) : null;

  static Future<void> _openHiveBoxes() async {
    try {
      await openBox(_settingsBox);
      await openBox<FontManager>(_fontsBox);
    } on HiveError catch (e) {
      if (!_hiveStatusController.isClosed) {
        _hiveStatusController.sink.add(HiveClientStatus.error);
      }

      ToastManager.long(e.message);

      if (kDebugMode) rethrow;
    }
  }

  /// Register all [Box]es that are used in the app
  static void _registerAdapters() async {
    try {
      FontManager.registerAdapter(); // 2
    } on HiveError catch (e) {
      if (!_hiveStatusController.isClosed) {
        _hiveStatusController.sink.add(HiveClientStatus.error);
      }

      ToastManager.long(e.message);

      if (kDebugMode) rethrow;
    }
  }

  static Box<E> box<E>(String name) => Hive.box<E>(name);

  /// This method should be called `once` preferably on app launch
  ///
  /// - It initializes `Hive`
  ///
  /// - It opens all `Box`es that are used in the app
  ///
  /// - It registers all `TypeAdapter`s that are used in the app
  ///
  /// See also:
  /// * [StreamSubscription.subscribe] - for listening to the status of the initialization
  /// * [HiveClientStatus] - for the possible statuses of the initialization
  static Future<HiveClient> initialize([String? directory]) async {
    if (!_hiveStatusController.isClosed) {
      _hiveStatusController.sink.add(HiveClientStatus.loading);
    }

    await Hive.initFlutter(directory);
    HiveClient._registerAdapters();
    await HiveClient._openHiveBoxes();

    if (!_hiveStatusController.isClosed) {
      _hiveStatusController.sink.add(HiveClientStatus.loaded);
    }

    return const HiveClient._();
  }

  static bool isOpen(String name) => Hive.isBoxOpen(name);

  static Future<Box<E>?> openBox<E>(String name) async {
    try {
      return await Hive.openBox<E>(name);
    } on HiveError catch (e, _) {
      if (!_hiveStatusController.isClosed) {
        _hiveStatusController.sink.add(HiveClientStatus.error);
      }

      ToastManager.long(e.message);

      if (kDebugMode) rethrow;

      return null;
    }
  }

  /// Subscribe to changes in the status of the initialization
  /// - [HiveClientStatus.loading] - When Hive is initializing
  /// - [HiveClientStatus.loaded] - When Hive has been initialized
  /// - [HiveClientStatus.error] - When Hive failed to initialize with an error
  ///
  /// You can subscribe to this stream to get updates:
  /// ```dart
  /// HiveClient.subscribe((status) {
  ///  print(status);
  /// });
  /// ```
  static StreamSubscription<HiveClientStatus> initListener(
    void Function(HiveClientStatus) onUpdate, {
    bool autoDispose = true,
    void Function(Object?)? onError,
  }) {
    StreamSubscription<HiveClientStatus>? _subscription;

    _subscription ??= _hiveStatusController.stream.listen((value) {
      onUpdate(value);
      if (autoDispose && (value == HiveClientStatus.loaded || value == HiveClientStatus.error)) {
        _subscription?.cancel();
      }
    }, onError: onError, cancelOnError: autoDispose);

    return _subscription;
  }

  @visibleForTesting
  @disposeMethod
  void dispose() {
    _hiveStatusController.close();
  }
}
