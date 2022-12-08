part of 'flutter_blue_cubit_impl.dart';

@Freezed(when: FreezedWhenOptions.none, map: FreezedMapOptions.none)
class FlutterBlueState extends BluetoothConnectState<BluetoothDevice> with _$FlutterBlueState {
  const factory FlutterBlueState({
    @Default(false) bool isScanning,
    @Default(false) bool isBluetoothOn,
    @Default(false) bool isConnecting,
    @Default([]) List<AnyBluetoothDevice<BluetoothDevice>> devices,
    @Default(Right(unit)) Either<String, Unit> status,
  }) = _FlutterBlueState;

  const FlutterBlueState._();

  factory FlutterBlueState.initial() => const FlutterBlueState();
}
