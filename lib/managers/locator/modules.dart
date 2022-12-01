library modules.dart;

import 'package:injectable/injectable.dart';
import 'package:transcriber/managers/navigation/navigation.dart';

@module
abstract class AppModules {
  /// Registers AppRouter as a singleton
  @singleton
  AppRouter get router => AppRouter();
}

@module
abstract class ServiceModules {}
