part of 'bluetooth_connect_cubit.dart';

@Freezed(when: FreezedWhenOptions.none, map: FreezedMapOptions.none)
class BluetoothConnectState with _$BluetoothConnectState {
  const factory BluetoothConnectState({
    @Default(false) bool isScanning,
    @Default(false) bool isBluetoothOn,
    @Default(false) bool isConnecting,
    @Default([]) List<AnyBluetoothDevice> devices,
    @Default(Right(unit)) Either<String, Unit> status,
  }) = _BluetoothConnectState;

  const BluetoothConnectState._();

  factory BluetoothConnectState.initial() => const BluetoothConnectState();
}

@Freezed(when: FreezedWhenOptions.none, map: FreezedMapOptions.none)
class AnyBluetoothDevice with _$AnyBluetoothDevice {
  const AnyBluetoothDevice._();

  const factory AnyBluetoothDevice({
    required UniqueId<String> id,
    String? localName,
    required BluetoothDevice device,
    @Default(false) bool isConnected,
    @Default([]) List<BluetoothService> services,
  }) = _AnyBluetoothDevice;

  String name([String? defaultValue]) {
    if (localName != null && localName!.isNotEmpty) return localName!;
    return device.name.isEmpty ? (defaultValue ?? 'Unknown') : device.name;
  }
}
