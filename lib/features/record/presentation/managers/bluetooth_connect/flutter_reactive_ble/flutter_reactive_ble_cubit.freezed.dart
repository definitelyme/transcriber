// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of flutter_reactive_ble_cubit.dart;

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FlutterReactiveBleState {
  bool get isScanning => throw _privateConstructorUsedError;
  bool get isBluetoothOn => throw _privateConstructorUsedError;
  bool get isConnecting => throw _privateConstructorUsedError;
  List<AnyBluetoothDevice<DiscoveredDevice>> get devices =>
      throw _privateConstructorUsedError;
  Either<String, Unit> get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FlutterReactiveBleStateCopyWith<FlutterReactiveBleState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlutterReactiveBleStateCopyWith<$Res> {
  factory $FlutterReactiveBleStateCopyWith(FlutterReactiveBleState value,
          $Res Function(FlutterReactiveBleState) then) =
      _$FlutterReactiveBleStateCopyWithImpl<$Res, FlutterReactiveBleState>;
  @useResult
  $Res call(
      {bool isScanning,
      bool isBluetoothOn,
      bool isConnecting,
      List<AnyBluetoothDevice<DiscoveredDevice>> devices,
      Either<String, Unit> status});
}

/// @nodoc
class _$FlutterReactiveBleStateCopyWithImpl<$Res,
        $Val extends FlutterReactiveBleState>
    implements $FlutterReactiveBleStateCopyWith<$Res> {
  _$FlutterReactiveBleStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isScanning = null,
    Object? isBluetoothOn = null,
    Object? isConnecting = null,
    Object? devices = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      isScanning: null == isScanning
          ? _value.isScanning
          : isScanning // ignore: cast_nullable_to_non_nullable
              as bool,
      isBluetoothOn: null == isBluetoothOn
          ? _value.isBluetoothOn
          : isBluetoothOn // ignore: cast_nullable_to_non_nullable
              as bool,
      isConnecting: null == isConnecting
          ? _value.isConnecting
          : isConnecting // ignore: cast_nullable_to_non_nullable
              as bool,
      devices: null == devices
          ? _value.devices
          : devices // ignore: cast_nullable_to_non_nullable
              as List<AnyBluetoothDevice<DiscoveredDevice>>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Either<String, Unit>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FlutterReactiveBleStateCopyWith<$Res>
    implements $FlutterReactiveBleStateCopyWith<$Res> {
  factory _$$_FlutterReactiveBleStateCopyWith(_$_FlutterReactiveBleState value,
          $Res Function(_$_FlutterReactiveBleState) then) =
      __$$_FlutterReactiveBleStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isScanning,
      bool isBluetoothOn,
      bool isConnecting,
      List<AnyBluetoothDevice<DiscoveredDevice>> devices,
      Either<String, Unit> status});
}

/// @nodoc
class __$$_FlutterReactiveBleStateCopyWithImpl<$Res>
    extends _$FlutterReactiveBleStateCopyWithImpl<$Res,
        _$_FlutterReactiveBleState>
    implements _$$_FlutterReactiveBleStateCopyWith<$Res> {
  __$$_FlutterReactiveBleStateCopyWithImpl(_$_FlutterReactiveBleState _value,
      $Res Function(_$_FlutterReactiveBleState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isScanning = null,
    Object? isBluetoothOn = null,
    Object? isConnecting = null,
    Object? devices = null,
    Object? status = null,
  }) {
    return _then(_$_FlutterReactiveBleState(
      isScanning: null == isScanning
          ? _value.isScanning
          : isScanning // ignore: cast_nullable_to_non_nullable
              as bool,
      isBluetoothOn: null == isBluetoothOn
          ? _value.isBluetoothOn
          : isBluetoothOn // ignore: cast_nullable_to_non_nullable
              as bool,
      isConnecting: null == isConnecting
          ? _value.isConnecting
          : isConnecting // ignore: cast_nullable_to_non_nullable
              as bool,
      devices: null == devices
          ? _value._devices
          : devices // ignore: cast_nullable_to_non_nullable
              as List<AnyBluetoothDevice<DiscoveredDevice>>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Either<String, Unit>,
    ));
  }
}

/// @nodoc

class _$_FlutterReactiveBleState extends _FlutterReactiveBleState
    with DiagnosticableTreeMixin {
  const _$_FlutterReactiveBleState(
      {this.isScanning = false,
      this.isBluetoothOn = false,
      this.isConnecting = false,
      final List<AnyBluetoothDevice<DiscoveredDevice>> devices = const [],
      this.status = const Right(unit)})
      : _devices = devices,
        super._();

  @override
  @JsonKey()
  final bool isScanning;
  @override
  @JsonKey()
  final bool isBluetoothOn;
  @override
  @JsonKey()
  final bool isConnecting;
  final List<AnyBluetoothDevice<DiscoveredDevice>> _devices;
  @override
  @JsonKey()
  List<AnyBluetoothDevice<DiscoveredDevice>> get devices {
    if (_devices is EqualUnmodifiableListView) return _devices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_devices);
  }

  @override
  @JsonKey()
  final Either<String, Unit> status;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FlutterReactiveBleState(isScanning: $isScanning, isBluetoothOn: $isBluetoothOn, isConnecting: $isConnecting, devices: $devices, status: $status)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FlutterReactiveBleState'))
      ..add(DiagnosticsProperty('isScanning', isScanning))
      ..add(DiagnosticsProperty('isBluetoothOn', isBluetoothOn))
      ..add(DiagnosticsProperty('isConnecting', isConnecting))
      ..add(DiagnosticsProperty('devices', devices))
      ..add(DiagnosticsProperty('status', status));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FlutterReactiveBleState &&
            (identical(other.isScanning, isScanning) ||
                other.isScanning == isScanning) &&
            (identical(other.isBluetoothOn, isBluetoothOn) ||
                other.isBluetoothOn == isBluetoothOn) &&
            (identical(other.isConnecting, isConnecting) ||
                other.isConnecting == isConnecting) &&
            const DeepCollectionEquality().equals(other._devices, _devices) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isScanning, isBluetoothOn,
      isConnecting, const DeepCollectionEquality().hash(_devices), status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FlutterReactiveBleStateCopyWith<_$_FlutterReactiveBleState>
      get copyWith =>
          __$$_FlutterReactiveBleStateCopyWithImpl<_$_FlutterReactiveBleState>(
              this, _$identity);
}

abstract class _FlutterReactiveBleState extends FlutterReactiveBleState {
  const factory _FlutterReactiveBleState(
      {final bool isScanning,
      final bool isBluetoothOn,
      final bool isConnecting,
      final List<AnyBluetoothDevice<DiscoveredDevice>> devices,
      final Either<String, Unit> status}) = _$_FlutterReactiveBleState;
  const _FlutterReactiveBleState._() : super._();

  @override
  bool get isScanning;
  @override
  bool get isBluetoothOn;
  @override
  bool get isConnecting;
  @override
  List<AnyBluetoothDevice<DiscoveredDevice>> get devices;
  @override
  Either<String, Unit> get status;
  @override
  @JsonKey(ignore: true)
  _$$_FlutterReactiveBleStateCopyWith<_$_FlutterReactiveBleState>
      get copyWith => throw _privateConstructorUsedError;
}
