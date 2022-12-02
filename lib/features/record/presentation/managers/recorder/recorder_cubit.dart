library recorder_cubit.dart;

import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_audio_recorder2/flutter_audio_recorder2.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:transcriber/core/domain/entities/entities.dart';
import 'package:transcriber/core/presentation/index.dart';
import 'package:path/path.dart' as p;
import 'package:transcriber/utils/utils.dart';

part 'recorder_cubit.freezed.dart';
part 'recorder_state.dart';

@injectable
class RecorderCubit extends Cubit<RecorderState> with BaseCubit {
  static const _kExtension = AudioFormat.WAV;

  StreamSubscription<int>? _recordingSubscription;

  FlutterAudioRecorder2? _recorder;

  RecorderCubit() : super(RecorderState.initial());

  Future<bool?> get hasPermission async => await FlutterAudioRecorder2.hasPermissions;

  String get _generateUniqueFileName => UniqueId<String>.random().value;

  Future<String> get _recordDir async => p.join((await Utils.documentsDir).path, Const.kRecordFolder);

  @override
  Future<void> close() async {
    _recordingSubscription?.cancel();
    return super.close();
  }

  Future<void> record([String? filename]) async {
    await PermissionManager.requestAudio();

    // debugPrint('PermissionManager.hasAudioPermission: $result\n has perm => ${await hasPermission}');

    // if ((await hasPermission) == true) {
    final path = p.joinAll([await _recordDir, p.withoutExtension(filename ?? _generateUniqueFileName)]);

    final _dir = Directory(path);

    if (!(await _dir.exists())) await _dir.create(recursive: true);

    _recorder = FlutterAudioRecorder2(path, audioFormat: _kExtension);
    await _recorder?.initialized;

    listen();
    await _recorder?.start();
    // }
  }

  Future<void> stop() async {
    if (_recorder == null) return;

    emit(state.copyWith(status: right(unit)));

    final result = await _recorder?.stop();

    await _recordingSubscription?.cancel();
    _recordingSubscription = null;

    emit(RecorderState.initial().copyWith(status: left('Recording saved to ${result?.path}')));

    _recorder = null;
  }

  void restart([String? filename]) async {
    final _recording = await _recorder?.current(channel: 0);
    final originalPath = _recording?.path;
    final _extension = _recording?.extension;

    await stop();

    if (filename != null) {
      await record(p.basenameWithoutExtension(filename));
    } else if (originalPath != null) {
      final basenameWithoutExt = p.basenameWithoutExtension(p.basenameWithoutExtension(originalPath));

      final basename = p.setExtension(p.joinAll([await _recordDir, basenameWithoutExt]), _extension!);

      final file = File(basename);

      if (await file.exists()) await file.delete();

      await record(basenameWithoutExt);
    }
  }

  void listen() async {
    await _recordingSubscription?.cancel();

    _recordingSubscription ??= Stream.periodic(const Duration(milliseconds: 100), (i) => i).listen((_) async {
      final recording = await _recorder?.current(channel: 0);
      emit(state.copyWith(
        duration: recording?.duration,
        fileName: recording?.path,
        recordingStatus: recording?.status,
      ));
    });
  }
}
