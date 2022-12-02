library bluetooth_connect_cubit.dart;

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:transcriber/core/domain/entities/entities.dart';
import 'package:transcriber/core/presentation/index.dart';
import 'package:transcriber/utils/utils.dart';

part 'bluetooth_connect_cubit.freezed.dart';
part 'bluetooth_connect_state.dart';

@injectable
class BluetoothConnectCubit extends Cubit<BluetoothConnectState> with BaseCubit {
  final FlutterBluePlus _bluePlus;
  StreamSubscription<BluetoothState>? _bluetoothStateSubscription;
  StreamSubscription<List<ScanResult>>? _scanSubscription;

  BluetoothConnectCubit(this._bluePlus) : super(BluetoothConnectState.initial());

  @override
  Future<void> close() async {
    stopScan();
    return super.close();
  }

  Future<bool> get isBluetoothSupported => _bluePlus.isAvailable;

  Future<bool> _isBluetoothOn() async => (await _bluePlus.state.firstOrNull()) == BluetoothState.on;

  Future<void> connect(BluetoothDevice device, {Duration? timeout, bool autoConnect = true}) async {
    try {
      emit(state.copyWith(isConnecting: true));
      await pair(device);
      await device.connect(timeout: timeout, autoConnect: autoConnect);

      discoverServices(device);

      emit(state.copyWith(
        isConnecting: false,
        devices: state.devices.map((e) => e.copyWith(isConnected: e.device.id.id == device.id.id)).toList(),
      ));
    } catch (e) {
      emit(state.copyWith(status: left(e.toString()), isConnecting: false));
    }
  }

  void disconnect(BluetoothDevice device) async {
    try {
      emit(state.copyWith(isConnecting: true));
      await device.disconnect();
      emit(state.copyWith(
        isConnecting: false,
        devices: state.devices.map((e) => e.device.id.id == device.id.id ? e.copyWith(isConnected: false) : e).toList(),
      ));
    } catch (e) {
      emit(state.copyWith(status: left(e.toString()), isConnecting: false));
    }
  }

  Future<bool> isDeviceConnected(BluetoothDevice device) async {
    final _state = await device.state.firstOrNull();
    return _state == BluetoothDeviceState.connected;
  }

  Future<void> pair(BluetoothDevice device) async {
    try {
      await device.pair();
    } catch (e) {
      emit(state.copyWith(status: left(e.toString())));
    }
  }

  void startScan([Duration duration = const Duration(seconds: 30)]) async {
    await stopScan();

    _scanSubscription ??= _bluePlus.scanResults.listen((results) async {
      for (final ScanResult result in results) {
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

        final isConnected = await isDeviceConnected(result.device);

        emit(state.copyWith(
          devices: state.devices.plusElementAndMapIfAbsent(
            AnyBluetoothDevice(
              id: UniqueId.fromExternal(result.device.id.id),
              device: result.device,
              isConnected: isConnected,
              localName: result.advertisementData.localName,
            ),
            replaceIf: (p0, p1) => p0.id == p1.id,
            none: (p0, p1) => p0.id == p1.id,
          ),
        ));
      }
    });

    emit(state.copyWith(isScanning: true, status: right(unit), devices: []));

    try {
      await _bluePlus.startScan(timeout: duration, scanMode: ScanMode.balanced);
      emit(state.copyWith(isScanning: false, status: right(unit)));
    } catch (e) {
      emit(state.copyWith(isScanning: false, status: left(e.toString())));
    }
  }

  void discoverServices(BluetoothDevice device) async {
    try {
      final services = await device.discoverServices();

      // debugPrint(
      //   'Device Id: ${device.id}\n'
      //   'Device Name: ${device.name}\n'
      //   'Device Type: ${device.type}\n'
      //   'Device MTU: ${device.mtu}\n'
      //   'Services: ${services.map((e) => e.uuid.toString())}\n'
      //   'Characteristics: ${services.map((e) => e.characteristics.map((e) => e.uuid.toString()))}\n',
      // );

      emit(state.copyWith(
        devices: state.devices.map((e) {
          if (e.id == UniqueId.fromExternal(device.id.id)) return e.copyWith(services: services);
          return e;
        }).toList(),
      ));
    } catch (e) {
      emit(state.copyWith(status: left(e.toString())));
    }
  }

  Future<void> stopScan() async {
    emit(state.copyWith(isScanning: false, status: right(unit)));
    await _bluePlus.stopScan();
    await _scanSubscription?.cancel();
  }

  void turnOff() async {
    try {
      await _bluePlus.turnOff();
    } catch (e) {
      emit(state.copyWith(status: left(e.toString())));
      if (kDebugMode) rethrow;
    }
  }

  void turnOn() async {
    try {
      await _bluePlus.turnOn();
    } catch (e) {
      emit(state.copyWith(status: left(e.toString())));
      if (kDebugMode) rethrow;
    }
  }

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

    if (await _isBluetoothOn()) startScan();
  }
}
