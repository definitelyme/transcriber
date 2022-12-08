part of 'flutter_blue_elves_cubit_impl.dart';

@Freezed(when: FreezedWhenOptions.none, map: FreezedMapOptions.none)
class FlutterBlueElveState extends BluetoothConnectState<Device> with _$FlutterBlueElveState {
  const factory FlutterBlueElveState({
    @Default(false) bool isScanning,
    @Default(false) bool isConnecting,
    @Default(false) bool isBluetoothOn,
    @Default([]) List<AnyBluetoothDevice<Device>> devices,
    @Default(Right(unit)) Either<String, Unit> status,
  }) = _FlutterBlueElveState;

  const FlutterBlueElveState._();

  factory FlutterBlueElveState.initial() => const FlutterBlueElveState();
}
