// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of flutter_blue_cubit_impl.dart;

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FlutterBlueState {
  bool get isScanning => throw _privateConstructorUsedError;
  bool get isBluetoothOn => throw _privateConstructorUsedError;
  bool get isConnecting => throw _privateConstructorUsedError;
  List<AnyBluetoothDevice<BluetoothDevice>> get devices =>
      throw _privateConstructorUsedError;
  Either<String, Unit> get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FlutterBlueStateCopyWith<FlutterBlueState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlutterBlueStateCopyWith<$Res> {
  factory $FlutterBlueStateCopyWith(
          FlutterBlueState value, $Res Function(FlutterBlueState) then) =
      _$FlutterBlueStateCopyWithImpl<$Res, FlutterBlueState>;
  @useResult
  $Res call(
      {bool isScanning,
      bool isBluetoothOn,
      bool isConnecting,
      List<AnyBluetoothDevice<BluetoothDevice>> devices,
      Either<String, Unit> status});
}

/// @nodoc
class _$FlutterBlueStateCopyWithImpl<$Res, $Val extends FlutterBlueState>
    implements $FlutterBlueStateCopyWith<$Res> {
  _$FlutterBlueStateCopyWithImpl(this._value, this._then);

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
              as List<AnyBluetoothDevice<BluetoothDevice>>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Either<String, Unit>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FlutterBlueStateCopyWith<$Res>
    implements $FlutterBlueStateCopyWith<$Res> {
  factory _$$_FlutterBlueStateCopyWith(
          _$_FlutterBlueState value, $Res Function(_$_FlutterBlueState) then) =
      __$$_FlutterBlueStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isScanning,
      bool isBluetoothOn,
      bool isConnecting,
      List<AnyBluetoothDevice<BluetoothDevice>> devices,
      Either<String, Unit> status});
}

/// @nodoc
class __$$_FlutterBlueStateCopyWithImpl<$Res>
    extends _$FlutterBlueStateCopyWithImpl<$Res, _$_FlutterBlueState>
    implements _$$_FlutterBlueStateCopyWith<$Res> {
  __$$_FlutterBlueStateCopyWithImpl(
      _$_FlutterBlueState _value, $Res Function(_$_FlutterBlueState) _then)
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
    return _then(_$_FlutterBlueState(
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
              as List<AnyBluetoothDevice<BluetoothDevice>>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Either<String, Unit>,
    ));
  }
}

/// @nodoc

class _$_FlutterBlueState extends _FlutterBlueState
    with DiagnosticableTreeMixin {
  const _$_FlutterBlueState(
      {this.isScanning = false,
      this.isBluetoothOn = false,
      this.isConnecting = false,
      final List<AnyBluetoothDevice<BluetoothDevice>> devices = const [],
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
  final List<AnyBluetoothDevice<BluetoothDevice>> _devices;
  @override
  @JsonKey()
  List<AnyBluetoothDevice<BluetoothDevice>> get devices {
    if (_devices is EqualUnmodifiableListView) return _devices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_devices);
  }

  @override
  @JsonKey()
  final Either<String, Unit> status;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FlutterBlueState(isScanning: $isScanning, isBluetoothOn: $isBluetoothOn, isConnecting: $isConnecting, devices: $devices, status: $status)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FlutterBlueState'))
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
            other is _$_FlutterBlueState &&
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
  _$$_FlutterBlueStateCopyWith<_$_FlutterBlueState> get copyWith =>
      __$$_FlutterBlueStateCopyWithImpl<_$_FlutterBlueState>(this, _$identity);
}

abstract class _FlutterBlueState extends FlutterBlueState {
  const factory _FlutterBlueState(
      {final bool isScanning,
      final bool isBluetoothOn,
      final bool isConnecting,
      final List<AnyBluetoothDevice<BluetoothDevice>> devices,
      final Either<String, Unit> status}) = _$_FlutterBlueState;
  const _FlutterBlueState._() : super._();

  @override
  bool get isScanning;
  @override
  bool get isBluetoothOn;
  @override
  bool get isConnecting;
  @override
  List<AnyBluetoothDevice<BluetoothDevice>> get devices;
  @override
  Either<String, Unit> get status;
  @override
  @JsonKey(ignore: true)
  _$$_FlutterBlueStateCopyWith<_$_FlutterBlueState> get copyWith =>
      throw _privateConstructorUsedError;
}
