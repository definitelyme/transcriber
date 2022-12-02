library audio_detail_screen.dart;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transcriber/core/presentation/index.dart';
import 'package:transcriber/features/record/presentation/index.dart';
import 'package:transcriber/managers/locator/locator.dart';
import 'package:transcriber/utils/utils.dart';

/// A stateless widget that renders AudioDetailScreen.
class AudioDetailScreen extends StatefulWidget with AutoRouteWrapper {
  final AudioEntity audio;

  const AudioDetailScreen(this.audio, {super.key});

  @override
  State<AudioDetailScreen> createState() => _AudioDetailScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AudioPlayerCubit>(),
      child: BlocListener<AudioPlayerCubit, AudioPlayerState>(
        listenWhen: (p, c) => p.status != c.status,
        listener: (c, s) => s.status.fold(
          (error) => ToastManager.custom(msg: error, context: c),
          (_) {},
        ),
        child: this,
      ),
    );
  }
}

class _AudioDetailScreenState extends State<AudioDetailScreen> with SingleTickerProviderStateMixin {
  late AudioPlayerCubit _cubit;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _cubit = context.read<AudioPlayerCubit>();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _cubit.initAudioPlayer(widget.audio, onFinished: _controller.reverse);
    _controller.forward();
    super.initState();
  }

  void handlePlayPause() {
    if (_cubit.state.playerState?.isPlaying == true) {
      _controller.reverse();
      _cubit.pause();
    } else if (_cubit.state.playerState?.isPaused == true) {
      _controller.forward();
      _cubit.resume();
    } else if (_cubit.state.playerState?.isFinished == true) {
      _cubit.restart();
    }
  }

  String _durationToString(Duration? duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final String twoDigitHours = twoDigits(duration?.inHours ?? 0);
    final String twoDigitMinutes = twoDigits(duration?.inMinutes.remainder(60) ?? 0);
    final String twoDigitSeconds = twoDigits(duration?.inSeconds.remainder(60) ?? 0);
    if (duration != null && duration.inHours > 0) return '$twoDigitHours:$twoDigitMinutes:$twoDigitSeconds';
    return '$twoDigitMinutes:$twoDigitSeconds';
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      adaptiveToolbar: AdaptiveToolbar(title: 'Now Playing #${widget.audio.name}'),
      body: CustomScrollView(
        physics: Utils.physics,
        slivers: [
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: sidePadding, vertical: 0.02.h),
            sliver: SliverList(
              delegate: SliverChildListDelegate.fixed([
                SizedBox(
                  height: 0.4.h,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Palette.backgroundColorDark.shade400,
                      borderRadius: 8.br,
                    ),
                    child: SizedBox.expand(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: sidePadding, vertical: 0.02.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AdaptiveText(
                              'Transcription window',
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              textColor: Palette.onSurface60,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                //
                BlocBuilder<AudioPlayerCubit, AudioPlayerState>(
                  builder: (c, s) => Column(
                    children: [
                      0.05.vsh,
                      //
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Material(
                            color: Palette.backgroundColorDark.shade400,
                            shape: const CircleBorder(),
                            child: AdaptiveInkWell(
                              onTap: () {},
                              borderRadius: 100.br,
                              child: const Padding(
                                padding: EdgeInsets.all(14.0),
                                child: Icon(Icons.skip_previous),
                              ),
                            ),
                          ),
                          //
                          Material(
                            color: Palette.backgroundColorDark.shade400,
                            shape: const CircleBorder(),
                            child: AdaptiveInkWell(
                              onTap: handlePlayPause,
                              borderRadius: 100.br,
                              child: Padding(
                                padding: const EdgeInsets.all(25.0),
                                child: AnimatedIcon(
                                  icon: AnimatedIcons.play_pause,
                                  size: 30,
                                  progress: _animation,
                                  color: Palette.onSurface,
                                ),
                              ),
                            ),
                          ),
                          //
                          Material(
                            color: Palette.backgroundColorDark.shade400,
                            shape: const CircleBorder(),
                            child: AdaptiveInkWell(
                              onTap: () {},
                              borderRadius: 100.br,
                              child: const Padding(
                                padding: EdgeInsets.all(14.0),
                                child: Icon(Icons.skip_next),
                              ),
                            ),
                          ),
                        ],
                      ),
                      //
                      0.01.vsh,
                      //
                      Material(
                        type: MaterialType.transparency,
                        child: Column(
                          children: [
                            SliderTheme(
                              data: Theme.of(context).sliderTheme.copyWith(trackShape: _CustomTrackShape()),
                              child: Slider.adaptive(
                                min: 0,
                                value: s.position.inMilliseconds.toDouble(),
                                max: s.totalDuration.inMilliseconds <= 0 ? 2 : s.totalDuration.inMilliseconds.toDouble(),
                                divisions: s.totalDuration.inMilliseconds <= 0 ? null : s.totalDuration.inMilliseconds,
                                label: _durationToString(s.position),
                                onChanged: _cubit.seek,
                              ),
                            ),
                            //
                            0.008.vsh,
                            //
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AdaptiveText(
                                  _durationToString(s.position),
                                  maxLines: 1,
                                  fontSize: 14.sp,
                                ),
                                AdaptiveText(
                                  _durationToString(s.totalDuration),
                                  maxLines: 1,
                                  fontSize: 14.sp,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final trackHeight = sliderTheme.trackHeight;
    final trackLeft = offset.dx;
    final trackTop = offset.dy + (parentBox.size.height - trackHeight!) / 2;
    final trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
