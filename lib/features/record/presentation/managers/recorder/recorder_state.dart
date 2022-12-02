part of 'recorder_cubit.dart';

@Freezed(when: FreezedWhenOptions.none, map: FreezedMapOptions.none)
class RecorderState with _$RecorderState {
  const factory RecorderState({
    String? fileName,
    Duration? duration,
    RecordingStatus? recordingStatus,
    @Default(Right(unit)) Either<String, Unit> status,
  }) = _RecorderState;

  const RecorderState._();

  factory RecorderState.initial() => const RecorderState();

  bool get isStopped => recordingStatus == null || !isRecording;

  bool get isRecording => recordingStatus != null && recordingStatus!.isRecording;
}

extension RecordingStatusX on RecordingStatus {
  bool get isRecording => this == RecordingStatus.Recording;
}
