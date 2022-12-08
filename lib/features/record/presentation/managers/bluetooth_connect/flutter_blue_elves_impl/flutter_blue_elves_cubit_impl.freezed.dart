// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of flutter_blue_elves_cubit_impl.dart;

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FlutterBlueElveState {
  bool get isScanning => throw _privateConstructorUsedError;
  bool get isConnecting => throw _privateConstructorUsedError;
  bool get isBluetoothOn => throw _privateConstructorUsedError;
  List<AnyBluetoothDevice<Device>> get devices =>
      throw _privateConstructorUsedError;
  Either<String, Unit> get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FlutterBlueElveStateCopyWith<FlutterBlueElveState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlutterBlueElveStateCopyWith<$Res> {
  factory $FlutterBlueElveStateCopyWith(FlutterBlueElveState value,
          $Res Function(FlutterBlueElveState) then) =
      _$FlutterBlueElveStateCopyWithImpl<$Res, FlutterBlueElveState>;
  @useResult
  $Res call(
      {bool isScanning,
      bool isConnecting,
      bool isBluetoothOn,
      List<AnyBluetoothDevice<Device>> devices,
      Either<String, Unit> status});
}

/// @nodoc
class _$FlutterBlueElveStateCopyWithImpl<$Res,
        $Val extends FlutterBlueElveState>
    implements $FlutterBlueElveStateCopyWith<$Res> {
  _$FlutterBlueElveStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isScanning = null,
    Object? isConnecting = null,
    Object? isBluetoothOn = null,
    Object? devices = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      isScanning: null == isScanning
          ? _value.isScanning
          : isScanning // ignore: cast_nullable_to_non_nullable
              as bool,
      isConnecting: null == isConnecting
          ? _value.isConnecting
          : isConnecting // ignore: cast_nullable_to_non_nullable
              as bool,
      isBluetoothOn: null == isBluetoothOn
          ? _value.isBluetoothOn
          : isBluetoothOn // ignore: cast_nullable_to_non_nullable
              as bool,
      devices: null == devices
          ? _value.devices
          : devices // ignore: cast_nullable_to_non_nullable
              as List<AnyBluetoothDevice<Device>>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Either<String, Unit>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FlutterBlueElveStateCopyWith<$Res>
    implements $FlutterBlueElveStateCopyWith<$Res> {
  factory _$$_FlutterBlueElveStateCopyWith(_$_FlutterBlueElveState value,
          $Res Function(_$_FlutterBlueElveState) then) =
      __$$_FlutterBlueElveStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isScanning,
      bool isConnecting,
      bool isBluetoothOn,
      List<AnyBluetoothDevice<Device>> devices,
      Either<String, Unit> status});
}

/// @nodoc
class __$$_FlutterBlueElveStateCopyWithImpl<$Res>
    extends _$FlutterBlueElveStateCopyWithImpl<$Res, _$_FlutterBlueElveState>
    implements _$$_FlutterBlueElveStateCopyWith<$Res> {
  __$$_FlutterBlueElveStateCopyWithImpl(_$_FlutterBlueElveState _value,
      $Res Function(_$_FlutterBlueElveState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isScanning = null,
    Object? isConnecting = null,
    Object? isBluetoothOn = null,
    Object? devices = null,
    Object? status = null,
  }) {
    return _then(_$_FlutterBlueElveState(
      isScanning: null == isScanning
          ? _value.isScanning
          : isScanning // ignore: cast_nullable_to_non_nullable
              as bool,
      isConnecting: null == isConnecting
          ? _value.isConnecting
          : isConnecting // ignore: cast_nullable_to_non_nullable
              as bool,
      isBluetoothOn: null == isBluetoothOn
          ? _value.isBluetoothOn
          : isBluetoothOn // ignore: cast_nullable_to_non_nullable
              as bool,
      devices: null == devices
          ? _value._devices
          : devices // ignore: cast_nullable_to_non_nullable
              as List<AnyBluetoothDevice<Device>>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Either<String, Unit>,
    ));
  }
}

/// @nodoc

class _$_FlutterBlueElveState extends _FlutterBlueElveState
    with DiagnosticableTreeMixin {
  const _$_FlutterBlueElveState(
      {this.isScanning = false,
      this.isConnecting = false,
      this.isBluetoothOn = false,
      final List<AnyBluetoothDevice<Device>> devices = const [],
      this.status = const Right(unit)})
      : _devices = devices,
        super._();

  @override
  @JsonKey()
  final bool isScanning;
  @override
  @JsonKey()
  final bool isConnecting;
  @override
  @JsonKey()
  final bool isBluetoothOn;
  final List<AnyBluetoothDevice<Device>> _devices;
  @override
  @JsonKey()
  List<AnyBluetoothDevice<Device>> get devices {
    if (_devices is EqualUnmodifiableListView) return _devices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_devices);
  }

  @override
  @JsonKey()
  final Either<String, Unit> status;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FlutterBlueElveState(isScanning: $isScanning, isConnecting: $isConnecting, isBluetoothOn: $isBluetoothOn, devices: $devices, status: $status)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FlutterBlueElveState'))
      ..add(DiagnosticsProperty('isScanning', isScanning))
      ..add(DiagnosticsProperty('isConnecting', isConnecting))
      ..add(DiagnosticsProperty('isBluetoothOn', isBluetoothOn))
      ..add(DiagnosticsProperty('devices', devices))
      ..add(DiagnosticsProperty('status', status));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FlutterBlueElveState &&
            (identical(other.isScanning, isScanning) ||
                other.isScanning == isScanning) &&
            (identical(other.isConnecting, isConnecting) ||
                other.isConnecting == isConnecting) &&
            (identical(other.isBluetoothOn, isBluetoothOn) ||
                other.isBluetoothOn == isBluetoothOn) &&
            const DeepCollectionEquality().equals(other._devices, _devices) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isScanning, isConnecting,
      isBluetoothOn, const DeepCollectionEquality().hash(_devices), status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FlutterBlueElveStateCopyWith<_$_FlutterBlueElveState> get copyWith =>
      __$$_FlutterBlueElveStateCopyWithImpl<_$_FlutterBlueElveState>(
          this, _$identity);
}

abstract class _FlutterBlueElveState extends FlutterBlueElveState {
  const factory _FlutterBlueElveState(
      {final bool isScanning,
      final bool isConnecting,
      final bool isBluetoothOn,
      final List<AnyBluetoothDevice<Device>> devices,
      final Either<String, Unit> status}) = _$_FlutterBlueElveState;
  const _FlutterBlueElveState._() : super._();

  @override
  bool get isScanning;
  @override
  bool get isConnecting;
  @override
  bool get isBluetoothOn;
  @override
  List<AnyBluetoothDevice<Device>> get devices;
  @override
  Either<String, Unit> get status;
  @override
  @JsonKey(ignore: true)
  _$$_FlutterBlueElveStateCopyWith<_$_FlutterBlueElveState> get copyWith =>
      throw _privateConstructorUsedError;
}
