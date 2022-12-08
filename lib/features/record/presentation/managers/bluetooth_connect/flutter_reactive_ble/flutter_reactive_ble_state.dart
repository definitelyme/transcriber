part of 'flutter_reactive_ble_cubit.dart';

@Freezed(when: FreezedWhenOptions.none, map: FreezedMapOptions.none)
class FlutterReactiveBleState extends BluetoothConnectState<DiscoveredDevice> with _$FlutterReactiveBleState {
  const factory FlutterReactiveBleState({
    @Default(false) bool isScanning,
    @Default(false) bool isBluetoothOn,
    @Default(false) bool isConnecting,
    @Default([]) List<AnyBluetoothDevice<DiscoveredDevice>> devices,
    @Default(Right(unit)) Either<String, Unit> status,
  }) = _FlutterReactiveBleState;

  const FlutterReactiveBleState._();

  factory FlutterReactiveBleState.initial() => const FlutterReactiveBleState();
}
