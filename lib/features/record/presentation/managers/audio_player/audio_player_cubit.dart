library audio_player_cubit.dart;

import 'dart:async';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart' as p;
import 'package:transcriber/utils/utils.dart';

part 'audio_player_state.dart';
part 'audio_player_cubit.freezed.dart';

@injectable
class AudioPlayerCubit extends Cubit<AudioPlayerState> {
  AudioPlayer? audioPlayer;
  StreamSubscription<Duration>? _durationSubscription;
  StreamSubscription<Duration>? _positionSubscription;
  StreamSubscription<PlayerState>? _playerStateSubscription;

  AudioPlayerCubit() : super(AudioPlayerState.initial());

  Future<String> get _recordDir async => p.join((await Utils.documentsDir).path, Const.kRecordFolder);

  @override
  Future<void> close() async {
    _dispose();
    return super.close();
  }

  void _dispose() async {
    await _durationSubscription?.cancel();
    await _positionSubscription?.cancel();
    await _playerStateSubscription?.cancel();
    await audioPlayer?.stop();
    await audioPlayer?.release();
    await audioPlayer?.dispose();
  }

  void getAudioList() async {
    emit(state.copyWith(isFetching: true, status: right(unit)));

    final _dir = Directory(await _recordDir);

    if (!(await _dir.exists())) return;

    final files = _dir.listSync(recursive: false, followLinks: false);

    final audioList = files
        .map(
          (e) => AudioEntity(
            name: p.basenameWithoutExtension(e.path),
            extension: p.extension(e.path),
            fullPath: e.path,
          ),
        )
        .where((i) => i.extension.isNotEmpty);

    emit(state.copyWith(audioList: audioList.toList(), isFetching: false));
  }

  void initAudioPlayer(
    AudioEntity audio, {
    void Function()? onFinished,
    void Function(PlayerState)? onStateChanged,
  }) async {
    emit(state.copyWith(audio: audio, isInitializing: true));

    audioPlayer ??= AudioPlayer(playerId: p.join(audio.name, audio.extension));

    listenToAudioDuration();
    listenToPlayerState(onStateChanged);
    listenToPosition(onFinished);

    await audioPlayer?.play(DeviceFileSource(audio.fullPath), mode: PlayerMode.mediaPlayer, volume: 1);
    final duration = await audioPlayer?.getDuration();

    emit(state.copyWith(isInitializing: false, totalDuration: duration ?? state.totalDuration));
  }

  void resume() async {
    if (audioPlayer == null) return;

    try {
      await audioPlayer?.resume();
    } catch (e) {
      emit(state.copyWith(status: left('Error playing audio: $e')));
    }

    emit(state.copyWith(status: right(unit)));
  }

  void pause() async {
    if (audioPlayer == null) return;

    try {
      await audioPlayer?.pause();
    } catch (e) {
      emit(state.copyWith(status: left('Error pausing audio: $e')));
    }

    emit(state.copyWith(status: right(unit)));
  }

  void stop() async {
    if (audioPlayer == null) return;

    try {
      await audioPlayer?.stop();
    } catch (e) {
      emit(state.copyWith(status: left('Error stopping audio: $e')));
    }

    emit(state.copyWith(status: right(unit)));
  }

  void seek(double position) async {
    if (audioPlayer == null) return;

    try {
      await audioPlayer?.seek(Duration(milliseconds: position.toInt()));
    } catch (e) {
      emit(state.copyWith(status: left('Error seeking audio: $e')));
    }

    emit(state.copyWith(status: right(unit)));
  }

  void deleteAudio(AudioEntity audio) async {
    emit(state.copyWith(isDeleting: true, status: right(unit)));

    final _file = File(audio.fullPath);

    try {
      if (await _file.exists()) await _file.delete();
      emit(state.copyWith(isDeleting: false));
    } catch (e) {
      emit(state.copyWith(isDeleting: false, status: left(e.toString())));
    }

    getAudioList();
  }

  void restart() async {
    if (audioPlayer == null) return;

    try {
      await audioPlayer?.seek(Duration.zero);
      await audioPlayer?.resume();
    } catch (e) {
      emit(state.copyWith(status: left('Error restarting audio: $e')));
    }

    emit(state.copyWith(status: right(unit)));
  }

  void listenToAudioDuration() async {
    await _durationSubscription?.cancel();
    _durationSubscription ??= audioPlayer?.onDurationChanged
        .listen((pos) => emit(state.copyWith(totalDuration: pos == Duration.zero ? state.totalDuration : pos)));
  }

  void listenToPosition([void Function()? onFinished]) async {
    await _positionSubscription?.cancel();
    _positionSubscription ??= audioPlayer?.onPositionChanged.listen((value) {
      emit(state.copyWith(position: state.playerState?.isPlaying == true ? value : state.position));
      if (value == state.totalDuration) onFinished?.call();
    });
  }

  void listenToPlayerState([void Function(PlayerState)? onChanged]) async {
    await _playerStateSubscription?.cancel();
    _playerStateSubscription ??= audioPlayer?.onPlayerStateChanged.listen((value) {
      onChanged?.call(value);
      emit(state.copyWith(playerState: value));
    });
  }
}
