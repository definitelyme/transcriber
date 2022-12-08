library bluetooth_connect_cubit.dart;

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transcriber/core/domain/entities/entities.dart';
import 'package:transcriber/core/presentation/index.dart';

part 'bluetooth_connect_cubit.freezed.dart';
part 'bluetooth_connect_state.dart';

abstract class BluetoothConnectCubit<S extends BluetoothConnectState<dynamic>> extends Cubit<S> with BaseCubit {
  BluetoothConnectCubit(S state) : super(state);

  @override
  Future<void> close() async {
    stopScan();
    return super.close();
  }

  Future<bool> get isBluetoothReady;
  Future<bool> get isBluetoothSupported;

  void cancelConnect(AnyBluetoothDevice<dynamic> device);

  Future<void> connect(AnyBluetoothDevice<dynamic> device, {Duration? timeout, bool autoConnect = true});

  Future<void> disconnect(AnyBluetoothDevice<dynamic> device);

  Future<bool> isDeviceConnected(AnyBluetoothDevice<dynamic> device);

  Future<void> pair(AnyBluetoothDevice<dynamic> device);

  Future<void> startScan([Duration duration = const Duration(seconds: 30)]);

  Future<void> stopScan();

  void turnOff();

  void turnOn();

  void watchBluetoothState();
}
