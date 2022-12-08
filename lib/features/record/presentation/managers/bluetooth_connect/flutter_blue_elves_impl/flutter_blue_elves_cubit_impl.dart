library flutter_blue_elves_cubit_impl.dart;

import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_blue_elves/flutter_blue_elves.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transcriber/core/domain/entities/entities.dart';
import 'package:transcriber/features/record/presentation/index.dart';
import 'package:transcriber/utils/utils.dart';

part 'flutter_blue_elves_cubit_impl.freezed.dart';
part 'flutter_blue_elves_state.dart';

class FlutterBlueElvesCubitImpl extends BluetoothConnectCubit<FlutterBlueElveState> {
  StreamSubscription<Future<bool>>? _bluetoothStateSubscription;
  final FlutterBlueElves _flutterBlueElves;
  StreamSubscription<ScanResult>? _scanSubscription;

  FlutterBlueElvesCubitImpl(this._flutterBlueElves) : super(FlutterBlueElveState.initial());

  @override
  Future<bool> get isBluetoothReady async {
    if (Utils.platform.isCupertino) {
      final result = await _flutterBlueElves.iosCheckBluetoothState();
      return result == IosBluetoothState.poweredOn;
    } else {
      final result = await _flutterBlueElves.androidCheckBlueLackWhat();
      return result.contains(AndroidBluetoothLack.bluetoothFunction);
    }
  }

  @override
  void cancelConnect(AnyBluetoothDevice<dynamic> device) {
    emit(state.copyWith(isConnecting: false));
  }

  @override
  Future<void> connect(
    AnyBluetoothDevice<dynamic> device, {
    Duration? timeout,
    bool autoConnect = true,
  }) async {
    final _device = device as AnyBluetoothDevice<Device>;

    try {
      emit(state.copyWith(isConnecting: true));

      _device.device?.connect(connectTimeout: timeout?.inMilliseconds);

      StreamSubscription<DeviceState>? _connectionSubscription;

      _connectionSubscription ??= _device.device?.stateStream.listen((event) {
        if (event == DeviceState.connected) {
          _connectionSubscription?.cancel();
          emit(state.copyWith(
            isConnecting: false,
            devices: state.devices.map((e) => e.device?.rssi == _device.device?.rssi ? e.copyWith(isConnected: true) : e).toList(),
          ));
        }
      });
    } catch (e) {
      emit(state.copyWith(status: left(e.toString()), isConnecting: false));
    }
  }

  @override
  Future<void> disconnect(AnyBluetoothDevice<dynamic> device) async {
    final _device = device as AnyBluetoothDevice<Device>;

    try {
      emit(state.copyWith(isConnecting: true));
      _device.device?.disConnect();
      emit(state.copyWith(
        isConnecting: false,
        devices: state.devices.map((e) => e.device?.rssi == _device.device?.rssi ? e.copyWith(isConnected: false) : e).toList(),
      ));
    } catch (e) {
      emit(state.copyWith(status: left(e.toString()), isConnecting: false));
    }
  }

  @override
  Future<bool> get isBluetoothSupported => Future.value(true);

  @override
  Future<bool> isDeviceConnected(AnyBluetoothDevice<dynamic> device) async {
    final _device = device as AnyBluetoothDevice<Device>;
    return _device.device?.state == DeviceState.connected;
  }

  @override
  Future<void> startScan([Duration duration = const Duration(seconds: 30)]) async {
    try {
      await stopScan();
    } catch (e, tr) {
      debugPrint('Caught Error: ${e.toString()}');
      debugPrintStack(stackTrace: tr);
    }

    emit(state.copyWith(isScanning: true, status: right(unit), devices: []));

    final hidden = await _flutterBlueElves.getHideConnectedDevices();

    debugPrint('Hidden List => ${hidden.length}\n'
        'Hidden List IDs => ${hidden.map((e) => e.id).toList()}\n'
        'Hidden List Names => ${hidden.map((e) => e.name).toList()}');

    try {
      _scanSubscription ??= _flutterBlueElves.startScan(duration.inMilliseconds).listen((result) async {
        final localName = result.localName;

        final device = result.connect(connectTimeout: duration.inSeconds);

        var anyDevice = AnyBluetoothDevice(
          id: UniqueId.fromExternal(result.id),
          // device: device..disConnect(),
          device: device,
          rssi: result.rssi,
          deviceName: (localName == null || localName.isEmpty) ? (result.manufacturerSpecificData?['name'] as String?) : localName,
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
      });
    } catch (e) {
      emit(state.copyWith(status: left(e.toString())));
    }

    emit(state.copyWith(isScanning: false));
  }

  @override
  Future<void> stopScan() async {
    emit(state.copyWith(isScanning: false, status: right(unit)));
    _flutterBlueElves.stopScan();
    await _scanSubscription?.cancel();
    _scanSubscription = null;
  }

  @override
  void watchBluetoothState() async {
    final stream = Stream.periodic(const Duration(seconds: 1), (_) => isBluetoothReady);

    await _bluetoothStateSubscription?.cancel();

    _bluetoothStateSubscription ??= stream.listen((event) async {
      final value = await event;
      emit(state.copyWith(isBluetoothOn: value));
    });

    if (await isBluetoothReady) startScan();
  }

  @override
  Future<void> pair(AnyBluetoothDevice<dynamic> device) {
    throw UnimplementedError();
  }

  @override
  void turnOff() {}

  @override
  void turnOn() {}
}
