library recording_screen.dart;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transcriber/core/presentation/index.dart';
import 'package:transcriber/features/record/presentation/index.dart';
import 'package:transcriber/managers/locator/locator.dart';
import 'package:transcriber/managers/navigation/navigation.dart';
import 'package:transcriber/utils/utils.dart';

/// A stateful widget that renders RecordingScreen.
class RecordingScreen extends StatefulWidget with AutoRouteWrapper {
  const RecordingScreen({super.key});

  @override
  RecordingScreenState createState() => RecordingScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<RecorderCubit>(),
      child: BlocListener<RecorderCubit, RecorderState>(
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

class RecordingScreenState extends State<RecordingScreen> {
  late RecorderCubit _cubit;

  final List<Color> colors = [
    Colors.grey,
    Colors.white,
    Colors.grey[400]!,
    // Colors.black38,
    Colors.grey[300]!,
    Colors.white,
    Colors.grey[600]!,
    Colors.grey[800]!,
  ];

  final List<int> duration = const [900, 700, 600, 800, 500];

  @override
  void initState() {
    _cubit = context.read<RecorderCubit>();
    super.initState();
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
      adaptiveToolbar: const AdaptiveToolbar(title: 'RECORD'),
      body: CustomScrollView(
        physics: Utils.physics,
        slivers: [
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: sidePadding * 3),
            sliver: SliverList(
              delegate: SliverChildListDelegate.fixed([
                0.07.vsh.safeTop,
                //
                BlocBuilder<RecorderCubit, RecorderState>(
                  builder: (c, s) => Stack(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Visibility(
                              visible: s.isRecording,
                              maintainState: true,
                              maintainSize: true,
                              maintainAnimation: true,
                              child: SizedBox(
                                height: 200,
                                child: MusicVisualizer(
                                  barCount: 50,
                                  colors: colors,
                                  duration: duration,
                                ),
                              ),
                            ),
                          ),
                          //
                          AdaptiveText(
                            _durationToString(s.duration),
                            maxLines: 1,
                            height: 1.5,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                      //
                      Positioned.fill(
                        child: CustomPaint(
                          key: const ValueKey('custom_painter'),
                          painter: _CirclePainter(
                            strokeWidth: 5,
                            color: Colors.grey.withOpacity(0.4),
                            radius: 0.5.w - (sidePadding * 3),
                          ),
                          child: const SizedBox.expand(),
                        ),
                      ),
                      //
                      Positioned.fill(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: CustomPaint(
                            key: const ValueKey('custom_painter'),
                            painter: _CirclePainter(
                              strokeWidth: 2,
                              color: Colors.grey.withOpacity(0.4),
                              radius: 0.5.w - (sidePadding * 3) - 10,
                            ),
                            child: const SizedBox.expand(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //
                0.07.vsh,
              ]),
            ),
          ),
          //
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: sidePadding),
            sliver: SliverToBoxAdapter(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 0.3.h),
                child: BlocBuilder<RecorderCubit, RecorderState>(
                  builder: (c, s) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Tooltip(
                          message: s.isRecording ? 'Stop Recording' : 'RECORD FROM A BLUETOOTH DEVICE',
                          child: Material(
                            color: Palette.backgroundColorDark.shade400,
                            shape: const CircleBorder(),
                            child: AdaptiveInkWell(
                              onTap: s.isRecording ? _cubit.stop : () => navigator.navigate(const BluetoothConnectRoute()),
                              borderRadius: 100.br,
                              child: Padding(
                                padding: s.isRecording ? const EdgeInsets.all(14.0) : const EdgeInsets.all(22.0),
                                child: Icon(
                                  s.isRecording ? Icons.stop : Icons.media_bluetooth_on_sharp,
                                  size: s.isRecording ? 40 : 30,
                                  color: Palette.iconColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      //
                      Flexible(
                        flex: 3,
                        child: RippleAnimation(
                          waveCount: 0,
                          color: Palette.errorRed,
                          stopped: s.isStopped,
                          child: Material(
                            color: Palette.backgroundColorDark.shade400,
                            shape: const CircleBorder(),
                            child: AdaptiveInkWell(
                              onTap: s.isRecording ? null : _cubit.record,
                              borderRadius: 100.br,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  borderRadius: 100.br,
                                  border: Border.all(color: Colors.white, width: 2),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(30.0),
                                  child: Stack(
                                    children: [
                                      if (s.isRecording)
                                        const Positioned(
                                          top: 0,
                                          right: 0,
                                          child: Icon(
                                            Icons.circle_sharp,
                                            size: 12,
                                            color: Palette.destructiveRed,
                                          ),
                                        ),
                                      Icon(
                                        CupertinoIcons.mic_fill,
                                        size: 60,
                                        color: s.isRecording ? Palette.primary : Palette.onSurface,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      //
                      Flexible(
                        child: Tooltip(
                          message: s.isRecording ? 'Restart' : 'GO TO MINUTE',
                          child: Material(
                            color: Palette.backgroundColorDark.shade400,
                            shape: const CircleBorder(),
                            child: AdaptiveInkWell(
                              onTap: s.isRecording ? _cubit.restart : () => navigator.navigate(const AudioListRoute()),
                              borderRadius: 100.br,
                              child: Padding(
                                padding: s.isRecording ? const EdgeInsets.all(15.0) : const EdgeInsets.all(22.0),
                                child: Icon(
                                  s.isRecording ? Icons.restart_alt_rounded : Icons.queue_music_rounded,
                                  size: s.isRecording ? 37 : 30,
                                  color: Palette.iconColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          //
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: sidePadding),
            sliver: SliverList(
              delegate: SliverChildListDelegate.fixed([
                BlocSelector<RecorderCubit, RecorderState, bool>(
                  selector: (s) => s.isRecording,
                  builder: (c, isRecording) => Visibility(
                    visible: isRecording,
                    child: SizedBox(
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
                                  'Transcription window (shows real-time transcriptions)',
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
                  ),
                ),
              ]),
            ),
          ),
          //
          SliverToBoxAdapter(child: 0.04.vsh).sliverSafeBottom,
        ],
      ),
    );
  }
}

// draw a circular arc with custom painter,
class _CirclePainter extends CustomPainter {
  final Color color;
  final double radius;
  final double strokeWidth;

  const _CirclePainter({required this.radius, required this.color, this.strokeWidth = 2});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(Offset(size.width / 2, size.height / 2), radius, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
