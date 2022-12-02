// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of audio_player_cubit.dart;

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AudioPlayerState {
  bool get isInitializing => throw _privateConstructorUsedError;
  bool get isFetching => throw _privateConstructorUsedError;
  bool get isDeleting => throw _privateConstructorUsedError;
  AudioEntity? get audio => throw _privateConstructorUsedError;
  PlayerState? get playerState => throw _privateConstructorUsedError;
  Duration get position => throw _privateConstructorUsedError;
  Duration get totalDuration => throw _privateConstructorUsedError;
  List<AudioEntity> get audioList => throw _privateConstructorUsedError;
  Either<String, Unit> get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AudioPlayerStateCopyWith<AudioPlayerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AudioPlayerStateCopyWith<$Res> {
  factory $AudioPlayerStateCopyWith(
          AudioPlayerState value, $Res Function(AudioPlayerState) then) =
      _$AudioPlayerStateCopyWithImpl<$Res, AudioPlayerState>;
  @useResult
  $Res call(
      {bool isInitializing,
      bool isFetching,
      bool isDeleting,
      AudioEntity? audio,
      PlayerState? playerState,
      Duration position,
      Duration totalDuration,
      List<AudioEntity> audioList,
      Either<String, Unit> status});

  $AudioEntityCopyWith<$Res>? get audio;
}

/// @nodoc
class _$AudioPlayerStateCopyWithImpl<$Res, $Val extends AudioPlayerState>
    implements $AudioPlayerStateCopyWith<$Res> {
  _$AudioPlayerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isInitializing = null,
    Object? isFetching = null,
    Object? isDeleting = null,
    Object? audio = freezed,
    Object? playerState = freezed,
    Object? position = null,
    Object? totalDuration = null,
    Object? audioList = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      isInitializing: null == isInitializing
          ? _value.isInitializing
          : isInitializing // ignore: cast_nullable_to_non_nullable
              as bool,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      isDeleting: null == isDeleting
          ? _value.isDeleting
          : isDeleting // ignore: cast_nullable_to_non_nullable
              as bool,
      audio: freezed == audio
          ? _value.audio
          : audio // ignore: cast_nullable_to_non_nullable
              as AudioEntity?,
      playerState: freezed == playerState
          ? _value.playerState
          : playerState // ignore: cast_nullable_to_non_nullable
              as PlayerState?,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Duration,
      totalDuration: null == totalDuration
          ? _value.totalDuration
          : totalDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      audioList: null == audioList
          ? _value.audioList
          : audioList // ignore: cast_nullable_to_non_nullable
              as List<AudioEntity>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Either<String, Unit>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AudioEntityCopyWith<$Res>? get audio {
    if (_value.audio == null) {
      return null;
    }

    return $AudioEntityCopyWith<$Res>(_value.audio!, (value) {
      return _then(_value.copyWith(audio: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AudioPlayerStateCopyWith<$Res>
    implements $AudioPlayerStateCopyWith<$Res> {
  factory _$$_AudioPlayerStateCopyWith(
          _$_AudioPlayerState value, $Res Function(_$_AudioPlayerState) then) =
      __$$_AudioPlayerStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isInitializing,
      bool isFetching,
      bool isDeleting,
      AudioEntity? audio,
      PlayerState? playerState,
      Duration position,
      Duration totalDuration,
      List<AudioEntity> audioList,
      Either<String, Unit> status});

  @override
  $AudioEntityCopyWith<$Res>? get audio;
}

/// @nodoc
class __$$_AudioPlayerStateCopyWithImpl<$Res>
    extends _$AudioPlayerStateCopyWithImpl<$Res, _$_AudioPlayerState>
    implements _$$_AudioPlayerStateCopyWith<$Res> {
  __$$_AudioPlayerStateCopyWithImpl(
      _$_AudioPlayerState _value, $Res Function(_$_AudioPlayerState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isInitializing = null,
    Object? isFetching = null,
    Object? isDeleting = null,
    Object? audio = freezed,
    Object? playerState = freezed,
    Object? position = null,
    Object? totalDuration = null,
    Object? audioList = null,
    Object? status = null,
  }) {
    return _then(_$_AudioPlayerState(
      isInitializing: null == isInitializing
          ? _value.isInitializing
          : isInitializing // ignore: cast_nullable_to_non_nullable
              as bool,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      isDeleting: null == isDeleting
          ? _value.isDeleting
          : isDeleting // ignore: cast_nullable_to_non_nullable
              as bool,
      audio: freezed == audio
          ? _value.audio
          : audio // ignore: cast_nullable_to_non_nullable
              as AudioEntity?,
      playerState: freezed == playerState
          ? _value.playerState
          : playerState // ignore: cast_nullable_to_non_nullable
              as PlayerState?,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Duration,
      totalDuration: null == totalDuration
          ? _value.totalDuration
          : totalDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      audioList: null == audioList
          ? _value._audioList
          : audioList // ignore: cast_nullable_to_non_nullable
              as List<AudioEntity>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Either<String, Unit>,
    ));
  }
}

/// @nodoc

class _$_AudioPlayerState extends _AudioPlayerState
    with DiagnosticableTreeMixin {
  const _$_AudioPlayerState(
      {this.isInitializing = false,
      this.isFetching = false,
      this.isDeleting = false,
      this.audio,
      this.playerState,
      this.position = Duration.zero,
      this.totalDuration = Duration.zero,
      final List<AudioEntity> audioList = const [],
      this.status = const Right(unit)})
      : _audioList = audioList,
        super._();

  @override
  @JsonKey()
  final bool isInitializing;
  @override
  @JsonKey()
  final bool isFetching;
  @override
  @JsonKey()
  final bool isDeleting;
  @override
  final AudioEntity? audio;
  @override
  final PlayerState? playerState;
  @override
  @JsonKey()
  final Duration position;
  @override
  @JsonKey()
  final Duration totalDuration;
  final List<AudioEntity> _audioList;
  @override
  @JsonKey()
  List<AudioEntity> get audioList {
    if (_audioList is EqualUnmodifiableListView) return _audioList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_audioList);
  }

  @override
  @JsonKey()
  final Either<String, Unit> status;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AudioPlayerState(isInitializing: $isInitializing, isFetching: $isFetching, isDeleting: $isDeleting, audio: $audio, playerState: $playerState, position: $position, totalDuration: $totalDuration, audioList: $audioList, status: $status)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AudioPlayerState'))
      ..add(DiagnosticsProperty('isInitializing', isInitializing))
      ..add(DiagnosticsProperty('isFetching', isFetching))
      ..add(DiagnosticsProperty('isDeleting', isDeleting))
      ..add(DiagnosticsProperty('audio', audio))
      ..add(DiagnosticsProperty('playerState', playerState))
      ..add(DiagnosticsProperty('position', position))
      ..add(DiagnosticsProperty('totalDuration', totalDuration))
      ..add(DiagnosticsProperty('audioList', audioList))
      ..add(DiagnosticsProperty('status', status));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AudioPlayerState &&
            (identical(other.isInitializing, isInitializing) ||
                other.isInitializing == isInitializing) &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            (identical(other.isDeleting, isDeleting) ||
                other.isDeleting == isDeleting) &&
            (identical(other.audio, audio) || other.audio == audio) &&
            (identical(other.playerState, playerState) ||
                other.playerState == playerState) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.totalDuration, totalDuration) ||
                other.totalDuration == totalDuration) &&
            const DeepCollectionEquality()
                .equals(other._audioList, _audioList) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isInitializing,
      isFetching,
      isDeleting,
      audio,
      playerState,
      position,
      totalDuration,
      const DeepCollectionEquality().hash(_audioList),
      status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AudioPlayerStateCopyWith<_$_AudioPlayerState> get copyWith =>
      __$$_AudioPlayerStateCopyWithImpl<_$_AudioPlayerState>(this, _$identity);
}

abstract class _AudioPlayerState extends AudioPlayerState {
  const factory _AudioPlayerState(
      {final bool isInitializing,
      final bool isFetching,
      final bool isDeleting,
      final AudioEntity? audio,
      final PlayerState? playerState,
      final Duration position,
      final Duration totalDuration,
      final List<AudioEntity> audioList,
      final Either<String, Unit> status}) = _$_AudioPlayerState;
  const _AudioPlayerState._() : super._();

  @override
  bool get isInitializing;
  @override
  bool get isFetching;
  @override
  bool get isDeleting;
  @override
  AudioEntity? get audio;
  @override
  PlayerState? get playerState;
  @override
  Duration get position;
  @override
  Duration get totalDuration;
  @override
  List<AudioEntity> get audioList;
  @override
  Either<String, Unit> get status;
  @override
  @JsonKey(ignore: true)
  _$$_AudioPlayerStateCopyWith<_$_AudioPlayerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AudioEntity {
  String get name => throw _privateConstructorUsedError;
  String get extension => throw _privateConstructorUsedError;
  String get fullPath => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AudioEntityCopyWith<AudioEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AudioEntityCopyWith<$Res> {
  factory $AudioEntityCopyWith(
          AudioEntity value, $Res Function(AudioEntity) then) =
      _$AudioEntityCopyWithImpl<$Res, AudioEntity>;
  @useResult
  $Res call({String name, String extension, String fullPath});
}

/// @nodoc
class _$AudioEntityCopyWithImpl<$Res, $Val extends AudioEntity>
    implements $AudioEntityCopyWith<$Res> {
  _$AudioEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? extension = null,
    Object? fullPath = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      extension: null == extension
          ? _value.extension
          : extension // ignore: cast_nullable_to_non_nullable
              as String,
      fullPath: null == fullPath
          ? _value.fullPath
          : fullPath // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AudioEntityCopyWith<$Res>
    implements $AudioEntityCopyWith<$Res> {
  factory _$$_AudioEntityCopyWith(
          _$_AudioEntity value, $Res Function(_$_AudioEntity) then) =
      __$$_AudioEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String extension, String fullPath});
}

/// @nodoc
class __$$_AudioEntityCopyWithImpl<$Res>
    extends _$AudioEntityCopyWithImpl<$Res, _$_AudioEntity>
    implements _$$_AudioEntityCopyWith<$Res> {
  __$$_AudioEntityCopyWithImpl(
      _$_AudioEntity _value, $Res Function(_$_AudioEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? extension = null,
    Object? fullPath = null,
  }) {
    return _then(_$_AudioEntity(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      extension: null == extension
          ? _value.extension
          : extension // ignore: cast_nullable_to_non_nullable
              as String,
      fullPath: null == fullPath
          ? _value.fullPath
          : fullPath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AudioEntity extends _AudioEntity with DiagnosticableTreeMixin {
  const _$_AudioEntity(
      {required this.name, required this.extension, required this.fullPath})
      : super._();

  @override
  final String name;
  @override
  final String extension;
  @override
  final String fullPath;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AudioEntity(name: $name, extension: $extension, fullPath: $fullPath)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AudioEntity'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('extension', extension))
      ..add(DiagnosticsProperty('fullPath', fullPath));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AudioEntity &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.extension, extension) ||
                other.extension == extension) &&
            (identical(other.fullPath, fullPath) ||
                other.fullPath == fullPath));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, extension, fullPath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AudioEntityCopyWith<_$_AudioEntity> get copyWith =>
      __$$_AudioEntityCopyWithImpl<_$_AudioEntity>(this, _$identity);
}

abstract class _AudioEntity extends AudioEntity {
  const factory _AudioEntity(
      {required final String name,
      required final String extension,
      required final String fullPath}) = _$_AudioEntity;
  const _AudioEntity._() : super._();

  @override
  String get name;
  @override
  String get extension;
  @override
  String get fullPath;
  @override
  @JsonKey(ignore: true)
  _$$_AudioEntityCopyWith<_$_AudioEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
