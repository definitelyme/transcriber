part of 'bluetooth_connect_cubit.dart';

abstract class BluetoothConnectState<T> {
  const BluetoothConnectState();

  List<AnyBluetoothDevice<T>> get devices;
  bool get isBluetoothOn => true;
  bool get isConnecting => devices.any((e) => e.isConnecting);
  bool get isScanning;
  Either<String, Unit> get status;
}

@Freezed(when: FreezedWhenOptions.none, map: FreezedMapOptions.none)
class AnyBluetoothDevice<T> with _$AnyBluetoothDevice<T> {
  const factory AnyBluetoothDevice({
    required UniqueId<String?> id,
    required String? deviceName,
    int? rssi,
    required T? device,
    @Default(false) bool isConnected,
    @Default(false) bool isConnecting,
    // @Default([]) List<BluetoothService> services,
  }) = _AnyBluetoothDevice;

  const AnyBluetoothDevice._();

  String? name([String? defaultValue]) => deviceName != null && deviceName!.isNotEmpty ? deviceName : defaultValue ?? 'Unknown';
}
