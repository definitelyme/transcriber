library flutter_reactive_ble_cubit.dart;

import 'dart:async';

import 'package:bluetooth_enable_fork/bluetooth_enable_fork.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart' hide Unit;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transcriber/core/domain/entities/entities.dart';
import 'package:transcriber/features/record/presentation/index.dart';
import 'package:transcriber/utils/utils.dart';

part 'flutter_reactive_ble_cubit.freezed.dart';
part 'flutter_reactive_ble_state.dart';

class FlutterReactiveBleCubit extends BluetoothConnectCubit<FlutterReactiveBleState> {
  StreamSubscription<BleStatus>? _bluetoothStateSubscription;
  StreamSubscription<ConnectionStateUpdate>? _connectedDeviceSubscription;
  final FlutterReactiveBle _plugin;
  StreamSubscription<DiscoveredDevice>? _scanSubscription;

  FlutterReactiveBleCubit(this._plugin) : super(FlutterReactiveBleState.initial());

  @override
  Future<bool> get isBluetoothReady async {
    final status = _plugin.status;
    return status == BleStatus.ready;
  }

  @override
  Future<bool> get isBluetoothSupported async => true;

  @override
  void cancelConnect(AnyBluetoothDevice<dynamic> device) {
    emit(state.copyWith(
      status: right(unit),
      devices: state.devices.map((e) {
        if (e.id.value == device.id.value) return e.copyWith(isConnecting: false);
        return e;
      }).toList(),
    ));
  }

  @override
  Future<void> connect(AnyBluetoothDevice<dynamic> device, {Duration? timeout, bool autoConnect = true}) async {
    StreamSubscription<ConnectionStateUpdate>? _subscription;

    emit(state.copyWith(
      status: right(unit),
      devices: state.devices.map((e) => e.copyWith(isConnecting: e.id.value == device.id.value)).toList(),
    ));

    await _subscription?.cancel();

    _subscription = _plugin
        .connectToAdvertisingDevice(
      id: device.id.value!,
      withServices: [],
      prescanDuration: const Duration(seconds: 10),
      // servicesWithCharacteristicsToDiscover: {},
      connectionTimeout: timeout ?? const Duration(seconds: 30),
    )
        .listen((value) {
      final id = value.deviceId;
      final connectionState = value.connectionState;

      emit(state.copyWith(
        status: right(unit),
        devices: state.devices.map((e) {
          if (e.id.value == id)
            return e.copyWith(
              isConnecting: false,
              isConnected: connectionState == DeviceConnectionState.connected,
            );
          return e;
        }).toList(),
      ));
    }, onDone: () async {
      emit(state.copyWith(
        status: right(unit),
        devices: state.devices.map((e) => e.id.value == device.id.value ? e.copyWith(isConnecting: false) : e).toList(),
      ));

      await _subscription?.cancel();
    });
  }

  @override
  Future<void> disconnect(AnyBluetoothDevice<dynamic> device) async {
    final _device = device as AnyBluetoothDevice<DiscoveredDevice>;

    try {
      emit(state.copyWith(isConnecting: true));
      // await _device.device?.disconnect();
      emit(state.copyWith(
        isConnecting: false,
        devices: state.devices.map((e) => e.id == _device.id ? e.copyWith(isConnected: false) : e).toList(),
      ));
    } catch (e) {
      emit(state.copyWith(status: left(e.toString()), isConnecting: false));
    }
  }

  @override
  Future<bool> isDeviceConnected(AnyBluetoothDevice<dynamic> device) async {
    final _device = device as AnyBluetoothDevice<DiscoveredDevice>;
    return _plugin.connectedDeviceStream.any(
      (e) => e.deviceId == _device.id.value && e.connectionState == DeviceConnectionState.connected,
    );
  }

  @override
  Future<void> pair(AnyBluetoothDevice<dynamic> device) async {
    throw UnimplementedError();
  }

  void _watchConnectedDevices() async {
    await _connectedDeviceSubscription?.cancel();

    _connectedDeviceSubscription = _plugin.connectedDeviceStream.listen((event) {
      final id = event.deviceId;
      final connectionState = event.connectionState;

      emit(state.copyWith(
        status: right(unit),
        devices: state.devices.map((e) {
          if (e.id.value == id) return e.copyWith(isConnected: connectionState == DeviceConnectionState.connected);
          return e;
        }).toList(),
      ));
    });
  }

  @override
  Future<void> startScan([Duration duration = const Duration(seconds: 30)]) async {
    try {
      await stopScan();
    } catch (e, tr) {
      debugPrint('Caught Exception: ${e.toString()}');
      debugPrintStack(stackTrace: tr);
    }

    emit(state.copyWith(isScanning: true, status: right(unit), devices: []));

    _watchConnectedDevices();

    await _scanSubscription?.cancel();

    debugPrint('Scan started!!');

    try {
      _scanSubscription = _plugin.scanForDevices(
        withServices: [],
        scanMode: ScanMode.lowLatency,
        requireLocationServicesEnabled: true,
      ).listen((result) async {
        final localName = result.name;

        var anyDevice = AnyBluetoothDevice(
          device: result,
          rssi: result.rssi,
          deviceName: localName,
          id: UniqueId.fromExternal(result.id),
        );

        final isConnected = await isDeviceConnected(anyDevice);

        anyDevice = anyDevice.copyWith(isConnected: isConnected);

        emit(state.copyWith(
          status: right(unit),
          devices: state.devices.plusElementAndMapIfAbsent(
            anyDevice,
            replaceIf: (p0, p1) => p0.id == p1.id,
            none: (p0, p1) => p0.id == p1.id,
          ),
        ));
      }, onDone: () {
        emit(state.copyWith(isScanning: false));
      }, onError: (e) {
        emit(state.copyWith(status: left(e.toString()), isScanning: false));
      });
    } catch (e) {
      emit(state.copyWith(status: left(e.toString())));
    }
  }

  @override
  Future<void> stopScan() async {
    emit(state.copyWith(isScanning: false, status: right(unit)));
    //
    await _scanSubscription?.cancel();
    await _connectedDeviceSubscription?.cancel();
    _scanSubscription = null;
    _connectedDeviceSubscription = null;
  }

  @override
  void turnOff() async {
    try {
      // await _bluePlus.turnOff();
    } catch (e) {
      emit(state.copyWith(status: left(e.toString())));
      if (kDebugMode) rethrow;
    }
  }

  @override
  void turnOn() async {
    try {
      final value = await BluetoothEnable.enableBluetooth;
      debugPrint('Is Bluetooth ON ===>>> $value');
    } catch (e) {
      emit(state.copyWith(status: left(e.toString())));
      if (kDebugMode) rethrow;
    }
  }

  @override
  void watchBluetoothState() async {
    await _bluetoothStateSubscription?.cancel();

    _bluetoothStateSubscription ??= _plugin.statusStream.listen((st) {
      if (st == BleStatus.poweredOff) {
        stopScan();
      } else if (st == BleStatus.ready) {
        startScan();
      }
      emit(state.copyWith(isBluetoothOn: st == BleStatus.ready));
    });

    if (await isBluetoothReady) startScan();
  }
}
