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
mixin _$AnyBluetoothDevice<T> {
  UniqueId<String?> get id => throw _privateConstructorUsedError;
  String? get deviceName => throw _privateConstructorUsedError;
  int? get rssi => throw _privateConstructorUsedError;
  T? get device => throw _privateConstructorUsedError;
  bool get isConnected => throw _privateConstructorUsedError;
  bool get isConnecting => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnyBluetoothDeviceCopyWith<T, AnyBluetoothDevice<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnyBluetoothDeviceCopyWith<T, $Res> {
  factory $AnyBluetoothDeviceCopyWith(AnyBluetoothDevice<T> value,
          $Res Function(AnyBluetoothDevice<T>) then) =
      _$AnyBluetoothDeviceCopyWithImpl<T, $Res, AnyBluetoothDevice<T>>;
  @useResult
  $Res call(
      {UniqueId<String?> id,
      String? deviceName,
      int? rssi,
      T? device,
      bool isConnected,
      bool isConnecting});
}

/// @nodoc
class _$AnyBluetoothDeviceCopyWithImpl<T, $Res,
        $Val extends AnyBluetoothDevice<T>>
    implements $AnyBluetoothDeviceCopyWith<T, $Res> {
  _$AnyBluetoothDeviceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? deviceName = freezed,
    Object? rssi = freezed,
    Object? device = freezed,
    Object? isConnected = null,
    Object? isConnecting = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId<String?>,
      deviceName: freezed == deviceName
          ? _value.deviceName
          : deviceName // ignore: cast_nullable_to_non_nullable
              as String?,
      rssi: freezed == rssi
          ? _value.rssi
          : rssi // ignore: cast_nullable_to_non_nullable
              as int?,
      device: freezed == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as T?,
      isConnected: null == isConnected
          ? _value.isConnected
          : isConnected // ignore: cast_nullable_to_non_nullable
              as bool,
      isConnecting: null == isConnecting
          ? _value.isConnecting
          : isConnecting // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AnyBluetoothDeviceCopyWith<T, $Res>
    implements $AnyBluetoothDeviceCopyWith<T, $Res> {
  factory _$$_AnyBluetoothDeviceCopyWith(_$_AnyBluetoothDevice<T> value,
          $Res Function(_$_AnyBluetoothDevice<T>) then) =
      __$$_AnyBluetoothDeviceCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {UniqueId<String?> id,
      String? deviceName,
      int? rssi,
      T? device,
      bool isConnected,
      bool isConnecting});
}

/// @nodoc
class __$$_AnyBluetoothDeviceCopyWithImpl<T, $Res>
    extends _$AnyBluetoothDeviceCopyWithImpl<T, $Res, _$_AnyBluetoothDevice<T>>
    implements _$$_AnyBluetoothDeviceCopyWith<T, $Res> {
  __$$_AnyBluetoothDeviceCopyWithImpl(_$_AnyBluetoothDevice<T> _value,
      $Res Function(_$_AnyBluetoothDevice<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? deviceName = freezed,
    Object? rssi = freezed,
    Object? device = freezed,
    Object? isConnected = null,
    Object? isConnecting = null,
  }) {
    return _then(_$_AnyBluetoothDevice<T>(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId<String?>,
      deviceName: freezed == deviceName
          ? _value.deviceName
          : deviceName // ignore: cast_nullable_to_non_nullable
              as String?,
      rssi: freezed == rssi
          ? _value.rssi
          : rssi // ignore: cast_nullable_to_non_nullable
              as int?,
      device: freezed == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as T?,
      isConnected: null == isConnected
          ? _value.isConnected
          : isConnected // ignore: cast_nullable_to_non_nullable
              as bool,
      isConnecting: null == isConnecting
          ? _value.isConnecting
          : isConnecting // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_AnyBluetoothDevice<T> extends _AnyBluetoothDevice<T>
    with DiagnosticableTreeMixin {
  const _$_AnyBluetoothDevice(
      {required this.id,
      required this.deviceName,
      this.rssi,
      required this.device,
      this.isConnected = false,
      this.isConnecting = false})
      : super._();

  @override
  final UniqueId<String?> id;
  @override
  final String? deviceName;
  @override
  final int? rssi;
  @override
  final T? device;
  @override
  @JsonKey()
  final bool isConnected;
  @override
  @JsonKey()
  final bool isConnecting;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AnyBluetoothDevice<$T>(id: $id, deviceName: $deviceName, rssi: $rssi, device: $device, isConnected: $isConnected, isConnecting: $isConnecting)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AnyBluetoothDevice<$T>'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('deviceName', deviceName))
      ..add(DiagnosticsProperty('rssi', rssi))
      ..add(DiagnosticsProperty('device', device))
      ..add(DiagnosticsProperty('isConnected', isConnected))
      ..add(DiagnosticsProperty('isConnecting', isConnecting));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AnyBluetoothDevice<T> &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.deviceName, deviceName) ||
                other.deviceName == deviceName) &&
            (identical(other.rssi, rssi) || other.rssi == rssi) &&
            const DeepCollectionEquality().equals(other.device, device) &&
            (identical(other.isConnected, isConnected) ||
                other.isConnected == isConnected) &&
            (identical(other.isConnecting, isConnecting) ||
                other.isConnecting == isConnecting));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, deviceName, rssi,
      const DeepCollectionEquality().hash(device), isConnected, isConnecting);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AnyBluetoothDeviceCopyWith<T, _$_AnyBluetoothDevice<T>> get copyWith =>
      __$$_AnyBluetoothDeviceCopyWithImpl<T, _$_AnyBluetoothDevice<T>>(
          this, _$identity);
}

abstract class _AnyBluetoothDevice<T> extends AnyBluetoothDevice<T> {
  const factory _AnyBluetoothDevice(
      {required final UniqueId<String?> id,
      required final String? deviceName,
      final int? rssi,
      required final T? device,
      final bool isConnected,
      final bool isConnecting}) = _$_AnyBluetoothDevice<T>;
  const _AnyBluetoothDevice._() : super._();

  @override
  UniqueId<String?> get id;
  @override
  String? get deviceName;
  @override
  int? get rssi;
  @override
  T? get device;
  @override
  bool get isConnected;
  @override
  bool get isConnecting;
  @override
  @JsonKey(ignore: true)
  _$$_AnyBluetoothDeviceCopyWith<T, _$_AnyBluetoothDevice<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
