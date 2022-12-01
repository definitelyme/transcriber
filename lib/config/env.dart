library env.dart;

import 'package:transcriber/core/data/index.dart';
import 'package:transcriber/managers/locator/locator.dart';
import 'package:transcriber/utils/utils.dart';

// BuildEnvironment get env => _env!;
// BuildEnvironment? _env;

class BuildEnvironment {
  BuildEnvironment._();

  factory BuildEnvironment.factory() => BuildEnvironment._();

  String get appName => Const.appName;

  int get connectTimeout => 16000;

  String get packageName => Const.packageName;

  int get receiveTimeout => 16000;

  /// Sets up the top-level [env] getter on the first call only.
  static Future<void> init() async {
    // Initialize dependencies
    dependencyInjector();
    // Initialize the Hive client
    await HiveClient.initialize();
  }
}
