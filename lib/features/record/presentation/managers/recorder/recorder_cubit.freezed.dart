// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of recorder_cubit.dart;

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RecorderState {
  String? get fileName => throw _privateConstructorUsedError;
  Duration? get duration => throw _privateConstructorUsedError;
  RecordingStatus? get recordingStatus => throw _privateConstructorUsedError;
  Either<String, Unit> get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RecorderStateCopyWith<RecorderState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecorderStateCopyWith<$Res> {
  factory $RecorderStateCopyWith(
          RecorderState value, $Res Function(RecorderState) then) =
      _$RecorderStateCopyWithImpl<$Res, RecorderState>;
  @useResult
  $Res call(
      {String? fileName,
      Duration? duration,
      RecordingStatus? recordingStatus,
      Either<String, Unit> status});
}

/// @nodoc
class _$RecorderStateCopyWithImpl<$Res, $Val extends RecorderState>
    implements $RecorderStateCopyWith<$Res> {
  _$RecorderStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileName = freezed,
    Object? duration = freezed,
    Object? recordingStatus = freezed,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      fileName: freezed == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration?,
      recordingStatus: freezed == recordingStatus
          ? _value.recordingStatus
          : recordingStatus // ignore: cast_nullable_to_non_nullable
              as RecordingStatus?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Either<String, Unit>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RecorderStateCopyWith<$Res>
    implements $RecorderStateCopyWith<$Res> {
  factory _$$_RecorderStateCopyWith(
          _$_RecorderState value, $Res Function(_$_RecorderState) then) =
      __$$_RecorderStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? fileName,
      Duration? duration,
      RecordingStatus? recordingStatus,
      Either<String, Unit> status});
}

/// @nodoc
class __$$_RecorderStateCopyWithImpl<$Res>
    extends _$RecorderStateCopyWithImpl<$Res, _$_RecorderState>
    implements _$$_RecorderStateCopyWith<$Res> {
  __$$_RecorderStateCopyWithImpl(
      _$_RecorderState _value, $Res Function(_$_RecorderState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileName = freezed,
    Object? duration = freezed,
    Object? recordingStatus = freezed,
    Object? status = null,
  }) {
    return _then(_$_RecorderState(
      fileName: freezed == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration?,
      recordingStatus: freezed == recordingStatus
          ? _value.recordingStatus
          : recordingStatus // ignore: cast_nullable_to_non_nullable
              as RecordingStatus?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Either<String, Unit>,
    ));
  }
}

/// @nodoc

class _$_RecorderState extends _RecorderState with DiagnosticableTreeMixin {
  const _$_RecorderState(
      {this.fileName,
      this.duration,
      this.recordingStatus,
      this.status = const Right(unit)})
      : super._();

  @override
  final String? fileName;
  @override
  final Duration? duration;
  @override
  final RecordingStatus? recordingStatus;
  @override
  @JsonKey()
  final Either<String, Unit> status;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RecorderState(fileName: $fileName, duration: $duration, recordingStatus: $recordingStatus, status: $status)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RecorderState'))
      ..add(DiagnosticsProperty('fileName', fileName))
      ..add(DiagnosticsProperty('duration', duration))
      ..add(DiagnosticsProperty('recordingStatus', recordingStatus))
      ..add(DiagnosticsProperty('status', status));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RecorderState &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.recordingStatus, recordingStatus) ||
                other.recordingStatus == recordingStatus) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, fileName, duration, recordingStatus, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RecorderStateCopyWith<_$_RecorderState> get copyWith =>
      __$$_RecorderStateCopyWithImpl<_$_RecorderState>(this, _$identity);
}

abstract class _RecorderState extends RecorderState {
  const factory _RecorderState(
      {final String? fileName,
      final Duration? duration,
      final RecordingStatus? recordingStatus,
      final Either<String, Unit> status}) = _$_RecorderState;
  const _RecorderState._() : super._();

  @override
  String? get fileName;
  @override
  Duration? get duration;
  @override
  RecordingStatus? get recordingStatus;
  @override
  Either<String, Unit> get status;
  @override
  @JsonKey(ignore: true)
  _$$_RecorderStateCopyWith<_$_RecorderState> get copyWith =>
      throw _privateConstructorUsedError;
}
