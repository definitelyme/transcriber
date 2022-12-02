library audio_list_screen.dart;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transcriber/core/presentation/index.dart';
import 'package:transcriber/features/record/presentation/index.dart';
import 'package:transcriber/managers/locator/locator.dart';
import 'package:transcriber/managers/navigation/app_router.dart';
import 'package:transcriber/utils/utils.dart';

/// A stateful widget that renders AudioListScreen.
class AudioListScreen extends StatefulWidget with AutoRouteWrapper {
  const AudioListScreen({super.key});

  @override
  AudioListScreenState createState() => AudioListScreenState();

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

class AudioListScreenState extends State<AudioListScreen> {
  late AudioPlayerCubit _cubit;

  @override
  void initState() {
    _cubit = context.read<AudioPlayerCubit>();
    _cubit.getAudioList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      adaptiveToolbar: const AdaptiveToolbar(title: 'My Audio Records'),
      body: CustomScrollView(
        physics: Utils.physics,
        slivers: [
          BlocSelector<AudioPlayerCubit, AudioPlayerState, List<AudioEntity>>(
            selector: (s) => s.audioList,
            builder: (c, list) => SliverList(
              delegate: SliverChildBuilderDelegate(
                (_, i) => AdaptiveListTile(
                  onTap: () => navigator.navigate(AudioDetailRoute(audio: list[i])),
                  contentPadding: EdgeInsets.symmetric(horizontal: sidePadding),
                  horizontalTitleGap: 0,
                  title: AdaptiveText(
                    '#${list[i].name}',
                    maxLines: 1,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w600,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: AdaptiveText(
                    list[i].fullPath,
                    maxLines: 2,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    textColor: Palette.onSurface60,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: const Icon(Icons.arrow_right_rounded),
                ),
                childCount: list.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
