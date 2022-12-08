library modules.dart;

import 'package:bluetooth_enable_fork/bluetooth_enable_fork.dart';
import 'package:flutter_blue_elves/flutter_blue_elves.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:injectable/injectable.dart';
import 'package:transcriber/features/record/presentation/index.dart';
import 'package:transcriber/managers/navigation/navigation.dart';

@module
abstract class AppModules {
  /// Registers AppRouter as a singleton
  @singleton
  AppRouter get router => AppRouter();
}

@module
abstract class ServiceModules {
  @lazySingleton
  FlutterBluePlus get flutterBlue => FlutterBluePlus.instance;

  // @lazySingleton
  // BluetoothManager get bluetoothManager => BluetoothManager.instance;

  @lazySingleton
  FlutterBlueElves get flutterBlueElves => FlutterBlueElves.instance;

  @lazySingleton
  FlutterReactiveBle get flutterReactiveBle => FlutterReactiveBle();

  @lazySingleton
  BluetoothEnable get bluetoothEnable => BluetoothEnable();

  @injectable
  BluetoothConnectCubit<BluetoothConnectState<dynamic>> btManager(FlutterReactiveBle bt) => FlutterReactiveBleCubit(bt);
}
