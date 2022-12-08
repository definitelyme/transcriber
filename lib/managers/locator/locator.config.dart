// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:bluetooth_enable_fork/bluetooth_enable_fork.dart' as _i5;
import 'package:flutter_blue_elves/flutter_blue_elves.dart' as _i6;
import 'package:flutter_blue_plus/flutter_blue_plus.dart' as _i7;
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:transcriber/features/record/presentation/index.dart' as _i11;
import 'package:transcriber/features/record/presentation/managers/audio_player/audio_player_cubit.dart'
    as _i4;
import 'package:transcriber/features/record/presentation/managers/recorder/recorder_cubit.dart'
    as _i9;
import 'package:transcriber/managers/locator/modules.dart' as _i12;
import 'package:transcriber/managers/navigation/navigation.dart' as _i3;
import 'package:transcriber/managers/theme/theme_cubit.dart'
    as _i10; // ignore_for_file: unnecessary_lambdas

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
    gh.lazySingleton<_i5.BluetoothEnable>(() => serviceModules.bluetoothEnable);
    gh.lazySingleton<_i6.FlutterBlueElves>(
        () => serviceModules.flutterBlueElves);
    gh.lazySingleton<_i7.FlutterBluePlus>(() => serviceModules.flutterBlue);
    gh.lazySingleton<_i8.FlutterReactiveBle>(
        () => serviceModules.flutterReactiveBle);
    gh.factory<_i9.RecorderCubit>(() => _i9.RecorderCubit());
    gh.singleton<_i10.ThemeCubit>(_i10.ThemeCubit());
    gh.factory<_i11.BluetoothConnectCubit<_i11.BluetoothConnectState<dynamic>>>(
        () => serviceModules.btManager(get<_i8.FlutterReactiveBle>()));
    return this;
  }
}

class _$AppModules extends _i12.AppModules {}

class _$ServiceModules extends _i12.ServiceModules {}
