// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:transcriber/managers/locator/modules.dart' as _i5;
import 'package:transcriber/managers/navigation/navigation.dart' as _i3;
import 'package:transcriber/managers/theme/theme_cubit.dart'
    as _i4; // ignore_for_file: unnecessary_lambdas

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
    gh.singleton<_i3.AppRouter>(appModules.router);
    gh.singleton<_i4.ThemeCubit>(_i4.ThemeCubit());
    return this;
  }
}

class _$AppModules extends _i5.AppModules {}
