// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of bluetooth_connect_cubit.dart;

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BluetoothConnectState {
  bool get isScanning => throw _privateConstructorUsedError;
  bool get isBluetoothOn => throw _privateConstructorUsedError;
  bool get isConnecting => throw _privateConstructorUsedError;
  List<AnyBluetoothDevice> get devices => throw _privateConstructorUsedError;
  Either<String, Unit> get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BluetoothConnectStateCopyWith<BluetoothConnectState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BluetoothConnectStateCopyWith<$Res> {
  factory $BluetoothConnectStateCopyWith(BluetoothConnectState value,
          $Res Function(BluetoothConnectState) then) =
      _$BluetoothConnectStateCopyWithImpl<$Res, BluetoothConnectState>;
  @useResult
  $Res call(
      {bool isScanning,
      bool isBluetoothOn,
      bool isConnecting,
      List<AnyBluetoothDevice> devices,
      Either<String, Unit> status});
}

/// @nodoc
class _$BluetoothConnectStateCopyWithImpl<$Res,
        $Val extends BluetoothConnectState>
    implements $BluetoothConnectStateCopyWith<$Res> {
  _$BluetoothConnectStateCopyWithImpl(this._value, this._then);

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
              as List<AnyBluetoothDevice>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Either<String, Unit>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BluetoothConnectStateCopyWith<$Res>
    implements $BluetoothConnectStateCopyWith<$Res> {
  factory _$$_BluetoothConnectStateCopyWith(_$_BluetoothConnectState value,
          $Res Function(_$_BluetoothConnectState) then) =
      __$$_BluetoothConnectStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isScanning,
      bool isBluetoothOn,
      bool isConnecting,
      List<AnyBluetoothDevice> devices,
      Either<String, Unit> status});
}

/// @nodoc
class __$$_BluetoothConnectStateCopyWithImpl<$Res>
    extends _$BluetoothConnectStateCopyWithImpl<$Res, _$_BluetoothConnectState>
    implements _$$_BluetoothConnectStateCopyWith<$Res> {
  __$$_BluetoothConnectStateCopyWithImpl(_$_BluetoothConnectState _value,
      $Res Function(_$_BluetoothConnectState) _then)
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
    return _then(_$_BluetoothConnectState(
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
              as List<AnyBluetoothDevice>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Either<String, Unit>,
    ));
  }
}

/// @nodoc

class _$_BluetoothConnectState extends _BluetoothConnectState
    with DiagnosticableTreeMixin {
  const _$_BluetoothConnectState(
      {this.isScanning = false,
      this.isBluetoothOn = false,
      this.isConnecting = false,
      final List<AnyBluetoothDevice> devices = const [],
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
  final List<AnyBluetoothDevice> _devices;
  @override
  @JsonKey()
  List<AnyBluetoothDevice> get devices {
    if (_devices is EqualUnmodifiableListView) return _devices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_devices);
  }

  @override
  @JsonKey()
  final Either<String, Unit> status;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BluetoothConnectState(isScanning: $isScanning, isBluetoothOn: $isBluetoothOn, isConnecting: $isConnecting, devices: $devices, status: $status)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BluetoothConnectState'))
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
            other is _$_BluetoothConnectState &&
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
  _$$_BluetoothConnectStateCopyWith<_$_BluetoothConnectState> get copyWith =>
      __$$_BluetoothConnectStateCopyWithImpl<_$_BluetoothConnectState>(
          this, _$identity);
}

abstract class _BluetoothConnectState extends BluetoothConnectState {
  const factory _BluetoothConnectState(
      {final bool isScanning,
      final bool isBluetoothOn,
      final bool isConnecting,
      final List<AnyBluetoothDevice> devices,
      final Either<String, Unit> status}) = _$_BluetoothConnectState;
  const _BluetoothConnectState._() : super._();

  @override
  bool get isScanning;
  @override
  bool get isBluetoothOn;
  @override
  bool get isConnecting;
  @override
  List<AnyBluetoothDevice> get devices;
  @override
  Either<String, Unit> get status;
  @override
  @JsonKey(ignore: true)
  _$$_BluetoothConnectStateCopyWith<_$_BluetoothConnectState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AnyBluetoothDevice {
  UniqueId<String> get id => throw _privateConstructorUsedError;
  String? get localName => throw _privateConstructorUsedError;
  BluetoothDevice get device => throw _privateConstructorUsedError;
  bool get isConnected => throw _privateConstructorUsedError;
  List<BluetoothService> get services => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnyBluetoothDeviceCopyWith<AnyBluetoothDevice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnyBluetoothDeviceCopyWith<$Res> {
  factory $AnyBluetoothDeviceCopyWith(
          AnyBluetoothDevice value, $Res Function(AnyBluetoothDevice) then) =
      _$AnyBluetoothDeviceCopyWithImpl<$Res, AnyBluetoothDevice>;
  @useResult
  $Res call(
      {UniqueId<String> id,
      String? localName,
      BluetoothDevice device,
      bool isConnected,
      List<BluetoothService> services});
}

/// @nodoc
class _$AnyBluetoothDeviceCopyWithImpl<$Res, $Val extends AnyBluetoothDevice>
    implements $AnyBluetoothDeviceCopyWith<$Res> {
  _$AnyBluetoothDeviceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? localName = freezed,
    Object? device = null,
    Object? isConnected = null,
    Object? services = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId<String>,
      localName: freezed == localName
          ? _value.localName
          : localName // ignore: cast_nullable_to_non_nullable
              as String?,
      device: null == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as BluetoothDevice,
      isConnected: null == isConnected
          ? _value.isConnected
          : isConnected // ignore: cast_nullable_to_non_nullable
              as bool,
      services: null == services
          ? _value.services
          : services // ignore: cast_nullable_to_non_nullable
              as List<BluetoothService>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AnyBluetoothDeviceCopyWith<$Res>
    implements $AnyBluetoothDeviceCopyWith<$Res> {
  factory _$$_AnyBluetoothDeviceCopyWith(_$_AnyBluetoothDevice value,
          $Res Function(_$_AnyBluetoothDevice) then) =
      __$$_AnyBluetoothDeviceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UniqueId<String> id,
      String? localName,
      BluetoothDevice device,
      bool isConnected,
      List<BluetoothService> services});
}

/// @nodoc
class __$$_AnyBluetoothDeviceCopyWithImpl<$Res>
    extends _$AnyBluetoothDeviceCopyWithImpl<$Res, _$_AnyBluetoothDevice>
    implements _$$_AnyBluetoothDeviceCopyWith<$Res> {
  __$$_AnyBluetoothDeviceCopyWithImpl(
      _$_AnyBluetoothDevice _value, $Res Function(_$_AnyBluetoothDevice) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? localName = freezed,
    Object? device = null,
    Object? isConnected = null,
    Object? services = null,
  }) {
    return _then(_$_AnyBluetoothDevice(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId<String>,
      localName: freezed == localName
          ? _value.localName
          : localName // ignore: cast_nullable_to_non_nullable
              as String?,
      device: null == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as BluetoothDevice,
      isConnected: null == isConnected
          ? _value.isConnected
          : isConnected // ignore: cast_nullable_to_non_nullable
              as bool,
      services: null == services
          ? _value._services
          : services // ignore: cast_nullable_to_non_nullable
              as List<BluetoothService>,
    ));
  }
}

/// @nodoc

class _$_AnyBluetoothDevice extends _AnyBluetoothDevice
    with DiagnosticableTreeMixin {
  const _$_AnyBluetoothDevice(
      {required this.id,
      this.localName,
      required this.device,
      this.isConnected = false,
      final List<BluetoothService> services = const []})
      : _services = services,
        super._();

  @override
  final UniqueId<String> id;
  @override
  final String? localName;
  @override
  final BluetoothDevice device;
  @override
  @JsonKey()
  final bool isConnected;
  final List<BluetoothService> _services;
  @override
  @JsonKey()
  List<BluetoothService> get services {
    if (_services is EqualUnmodifiableListView) return _services;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_services);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AnyBluetoothDevice(id: $id, localName: $localName, device: $device, isConnected: $isConnected, services: $services)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AnyBluetoothDevice'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('localName', localName))
      ..add(DiagnosticsProperty('device', device))
      ..add(DiagnosticsProperty('isConnected', isConnected))
      ..add(DiagnosticsProperty('services', services));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AnyBluetoothDevice &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.localName, localName) ||
                other.localName == localName) &&
            (identical(other.device, device) || other.device == device) &&
            (identical(other.isConnected, isConnected) ||
                other.isConnected == isConnected) &&
            const DeepCollectionEquality().equals(other._services, _services));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, localName, device,
      isConnected, const DeepCollectionEquality().hash(_services));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AnyBluetoothDeviceCopyWith<_$_AnyBluetoothDevice> get copyWith =>
      __$$_AnyBluetoothDeviceCopyWithImpl<_$_AnyBluetoothDevice>(
          this, _$identity);
}

abstract class _AnyBluetoothDevice extends AnyBluetoothDevice {
  const factory _AnyBluetoothDevice(
      {required final UniqueId<String> id,
      final String? localName,
      required final BluetoothDevice device,
      final bool isConnected,
      final List<BluetoothService> services}) = _$_AnyBluetoothDevice;
  const _AnyBluetoothDevice._() : super._();

  @override
  UniqueId<String> get id;
  @override
  String? get localName;
  @override
  BluetoothDevice get device;
  @override
  bool get isConnected;
  @override
  List<BluetoothService> get services;
  @override
  @JsonKey(ignore: true)
  _$$_AnyBluetoothDeviceCopyWith<_$_AnyBluetoothDevice> get copyWith =>
      throw _privateConstructorUsedError;
}
