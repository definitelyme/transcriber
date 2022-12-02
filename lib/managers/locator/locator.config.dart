// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_blue_plus/flutter_blue_plus.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:transcriber/features/record/presentation/managers/audio_player/audio_player_cubit.dart'
    as _i4;
import 'package:transcriber/features/record/presentation/managers/bluetooth_connect/bluetooth_connect_cubit.dart'
    as _i8;
import 'package:transcriber/features/record/presentation/managers/recorder/recorder_cubit.dart'
    as _i6;
import 'package:transcriber/managers/locator/modules.dart' as _i9;
import 'package:transcriber/managers/navigation/navigation.dart' as _i3;
import 'package:transcriber/managers/theme/theme_cubit.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// an extension to register the provided dependencies inside of [GetIt]
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of provided dependencies inside of [GetIt]
  _i1.GetIt $initGetIt({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModules = _$AppModules();
    final serviceModules = _$ServiceModules();
    gh.singleton<_i3.AppRouter>(appModules.router);
    gh.factory<_i4.AudioPlayerCubit>(() => _i4.AudioPlayerCubit());
    gh.lazySingleton<_i5.FlutterBluePlus>(() => serviceModules.flutterBlue);
    gh.factory<_i6.RecorderCubit>(() => _i6.RecorderCubit());
    gh.singleton<_i7.ThemeCubit>(_i7.ThemeCubit());
    gh.factory<_i8.BluetoothConnectCubit>(
        () => _i8.BluetoothConnectCubit(get<_i5.FlutterBluePlus>()));
    return this;
  }
}

class _$AppModules extends _i9.AppModules {}

class _$ServiceModules extends _i9.ServiceModules {}
