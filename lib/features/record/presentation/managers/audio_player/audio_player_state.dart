part of 'audio_player_cubit.dart';

@Freezed(when: FreezedWhenOptions.none, map: FreezedMapOptions.none)
class AudioPlayerState with _$AudioPlayerState {
  const factory AudioPlayerState({
    @Default(false) bool isInitializing,
    @Default(false) bool isFetching,
    @Default(false) bool isDeleting,
    AudioEntity? audio,
    PlayerState? playerState,
    @Default(Duration.zero) Duration position,
    @Default(Duration.zero) Duration totalDuration,
    @Default([]) List<AudioEntity> audioList,
    @Default(Right(unit)) Either<String, Unit> status,
  }) = _AudioPlayerState;

  const AudioPlayerState._();

  factory AudioPlayerState.initial() => const AudioPlayerState();
}

@Freezed(when: FreezedWhenOptions.none, map: FreezedMapOptions.none)
class AudioEntity with _$AudioEntity {
  const AudioEntity._();

  const factory AudioEntity({
    required String name,
    required String extension,
    required String fullPath,
  }) = _AudioEntity;
}

extension PlayerStateX on PlayerState {
  bool get isPlaying => this == PlayerState.playing;
  bool get isPaused => this == PlayerState.paused;
  bool get isStopped => this == PlayerState.stopped;
  bool get isCompleted => this == PlayerState.completed;
  bool get isFinished => isStopped || isCompleted;
}
