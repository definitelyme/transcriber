// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'field_object_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FieldObjectException<T> {
  String get message => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FieldObjectExceptionCopyWith<T, FieldObjectException<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FieldObjectExceptionCopyWith<T, $Res> {
  factory $FieldObjectExceptionCopyWith(FieldObjectException<T> value,
          $Res Function(FieldObjectException<T>) then) =
      _$FieldObjectExceptionCopyWithImpl<T, $Res, FieldObjectException<T>>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$FieldObjectExceptionCopyWithImpl<T, $Res,
        $Val extends FieldObjectException<T>>
    implements $FieldObjectExceptionCopyWith<T, $Res> {
  _$FieldObjectExceptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FieldObjectExceptionCopyWith<T, $Res>
    implements $FieldObjectExceptionCopyWith<T, $Res> {
  factory _$$_FieldObjectExceptionCopyWith(_$_FieldObjectException<T> value,
          $Res Function(_$_FieldObjectException<T>) then) =
      __$$_FieldObjectExceptionCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$_FieldObjectExceptionCopyWithImpl<T, $Res>
    extends _$FieldObjectExceptionCopyWithImpl<T, $Res,
        _$_FieldObjectException<T>>
    implements _$$_FieldObjectExceptionCopyWith<T, $Res> {
  __$$_FieldObjectExceptionCopyWithImpl(_$_FieldObjectException<T> _value,
      $Res Function(_$_FieldObjectException<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$_FieldObjectException<T>(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_FieldObjectException<T>
    with DiagnosticableTreeMixin
    implements _FieldObjectException<T> {
  const _$_FieldObjectException({required this.message});

  @override
  final String message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FieldObjectException<$T>(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FieldObjectException<$T>'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FieldObjectException<T> &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FieldObjectExceptionCopyWith<T, _$_FieldObjectException<T>>
      get copyWith =>
          __$$_FieldObjectExceptionCopyWithImpl<T, _$_FieldObjectException<T>>(
              this, _$identity);
}

abstract class _FieldObjectException<T> implements FieldObjectException<T> {
  const factory _FieldObjectException({required final String message}) =
      _$_FieldObjectException<T>;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$_FieldObjectExceptionCopyWith<T, _$_FieldObjectException<T>>
      get copyWith => throw _privateConstructorUsedError;
}
