library flutter_blue_cubit_impl.dart;

import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transcriber/core/domain/entities/entities.dart';
import 'package:transcriber/features/record/presentation/index.dart';
import 'package:transcriber/utils/utils.dart';

part 'flutter_blue_cubit_impl.freezed.dart';
part 'flutter_blue_state.dart';

class FlutterBlueCubitImpl extends BluetoothConnectCubit<FlutterBlueState> {
  final FlutterBluePlus _bluePlus;
  StreamSubscription<BluetoothState>? _bluetoothStateSubscription;
  StreamSubscription<List<ScanResult>>? _scanSubscription;

  FlutterBlueCubitImpl(this._bluePlus) : super(FlutterBlueState.initial());

  @override
  Future<bool> get isBluetoothReady async => (await _bluePlus.state.firstOrNull()) == BluetoothState.on;

  @override
  void cancelConnect(AnyBluetoothDevice<dynamic> device) {
    emit(state.copyWith(isConnecting: false));
  }

  @override
  Future<void> close() async {
    stopScan();
    return super.close();
  }

  @override
  Future<void> connect(
    AnyBluetoothDevice<dynamic> device, {
    Duration? timeout,
    bool autoConnect = true,
  }) async {
    final _device = device as AnyBluetoothDevice<BluetoothDevice>;

    try {
      emit(state.copyWith(isConnecting: true));
      await pair(_device);
      await _device.device?.connect(timeout: timeout, autoConnect: autoConnect);

      emit(state.copyWith(
        isConnecting: false,
        devices: state.devices.map((e) => e.device?.id.id == _device.device?.id.id ? e.copyWith(isConnected: true) : e).toList(),
      ));
    } catch (e) {
      emit(state.copyWith(status: left(e.toString()), isConnecting: false));
    }
  }

  @override
  Future<void> disconnect(AnyBluetoothDevice<dynamic> device) async {
    final _device = device as AnyBluetoothDevice<BluetoothDevice>;

    try {
      emit(state.copyWith(isConnecting: true));
      await _device.device?.disconnect();
      emit(state.copyWith(
        isConnecting: false,
        devices: state.devices.map((e) => e.device?.id.id == _device.device?.id.id ? e.copyWith(isConnected: false) : e).toList(),
      ));
    } catch (e) {
      emit(state.copyWith(status: left(e.toString()), isConnecting: false));
    }
  }

  @override
  Future<bool> get isBluetoothSupported => _bluePlus.isAvailable;

  @override
  Future<bool> isDeviceConnected(AnyBluetoothDevice<dynamic> device) async {
    final _device = device as AnyBluetoothDevice<BluetoothDevice>;
    final _state = await _device.device?.state.firstOrNull();
    return _state == BluetoothDeviceState.connected;
  }

  @override
  Future<void> pair(AnyBluetoothDevice<dynamic> device) async {
    final _device = device as AnyBluetoothDevice<BluetoothDevice>;
    try {
      await _device.device?.pair();
    } catch (e) {
      emit(state.copyWith(status: left(e.toString())));
    }
  }

  @override
  Future<void> startScan([Duration duration = const Duration(seconds: 30)]) async {
    await stopScan();

    _scanSubscription ??= _bluePlus.scanResults.listen((results) async {
      // for (final ScanResult result in results) {
      // debugPrint(
      //   'Device Id: ${result.device.id}\n'
      //   'Device Name: ${result.device.name}\n'
      //   'Device State: ${await result.device.state.firstOrNull()}\n'
      //   'Device Type: ${result.device.type}\n'
      //   'Device MTU: ${result.device.mtu}\n'
      //   'Local name: ${result.advertisementData.localName}\n'
      //   'Manufacture date: ${result.advertisementData.manufacturerData}\n'
      //   'Service data: ${result.advertisementData.serviceData}\n'
      //   'Device RSSI: ${result.rssi}\n'
      //   'Is connectable: ${result.advertisementData.connectable}\n',
      // );
      // }

      final devices = results.map((e) async {
        final localName = e.advertisementData.localName;

        final anyDevice = AnyBluetoothDevice(
          id: UniqueId.fromExternal(e.device.id.id),
          device: e.device,
          rssi: e.rssi,
          deviceName: localName.isEmpty ? e.device.name : localName,
        );

        final isConnected = await isDeviceConnected(anyDevice);

        return anyDevice.copyWith(isConnected: isConnected);
      });

      final _devices = await Future.wait(devices);

      emit(state.copyWith(
        devices: state.devices.plusAndMapIfAbsent(
          _devices,
          replaceIf: (p0, p1) => p0.id == p1.id,
          distinctBy: (p0) => p0.id,
          none: (p0, p1) => p0.id == p1.id,
        ),
      ));
    });

    emit(state.copyWith(isScanning: true, status: right(unit), devices: []));

    try {
      await _bluePlus.startScan(timeout: duration, scanMode: ScanMode.balanced);
      emit(state.copyWith(isScanning: false, status: right(unit)));
    } catch (e) {
      emit(state.copyWith(isScanning: false, status: left(e.toString())));
    }
  }

  @override
  Future<void> stopScan() async {
    emit(state.copyWith(isScanning: false, status: right(unit)));
    await _bluePlus.stopScan();
    await _scanSubscription?.cancel();
    _scanSubscription = null;
  }

  @override
  void turnOff() async {
    try {
      await _bluePlus.turnOff();
    } catch (e) {
      emit(state.copyWith(status: left(e.toString())));
      if (kDebugMode) rethrow;
    }
  }

  @override
  void turnOn() async {
    try {
      await _bluePlus.turnOn();
    } catch (e) {
      emit(state.copyWith(status: left(e.toString())));
      if (kDebugMode) rethrow;
    }
  }

  @override
  void watchBluetoothState() async {
    await _bluetoothStateSubscription?.cancel();

    _bluetoothStateSubscription ??= _bluePlus.state.listen((st) {
      if (st == BluetoothState.off) {
        stopScan();
      } else if (st == BluetoothState.off) {
        startScan();
      }
      emit(state.copyWith(isBluetoothOn: st == BluetoothState.on));
    });

    if (await isBluetoothReady) startScan();
  }
}
