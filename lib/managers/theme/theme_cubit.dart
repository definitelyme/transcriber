library theme_cubit.dart;

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:transcriber/core/data/index.dart';
import 'package:transcriber/managers/theme/theme.dart';
import 'package:transcriber/utils/utils.dart';

@singleton
class ThemeCubit extends Cubit<AppTheme> with _ThemeCubit {
  static const String _themeKey = '${Const.packageName}-style';
  static const String _themeModeKey = '${Const.packageName}-theme-mode';

  static AppTheme get defaultTheme => AppTheme.dark();

  ThemeCubit() : super(defaultTheme) {
    HiveClient.initListener((status) {
      status.when(loaded: () => emit(_get()));
    });
  }

  bool get isDarkMode => state.id == darkThemeID;

  bool get isDeviceThemeMode => state.themeMode == ThemeMode.system;

  /// Toggles Application theme from Light Mode to Dark Mode
  void toggleTheme([AppTheme? theme]) {
    emit(theme ?? (isDarkMode ? AppTheme.light() : AppTheme.dark()));
    Utils.forceAppUpdate();
    _save();
  }

  void toggleThemeMode() {
    emit((isDarkMode ? AppTheme.light() : state).copyWith(themeMode: isDeviceThemeMode ? ThemeMode.light : ThemeMode.system));
    if (!isDeviceThemeMode) emit(defaultTheme);
    Utils.forceAppUpdate();
    _save();
  }

  void watch(void Function(Brightness) onChange) {
    final window = WidgetsBinding.instance.window;
    window.onPlatformBrightnessChanged = () {
      WidgetsBinding.instance.handlePlatformBrightnessChanged();
      onChange(window.platformBrightness);
    };
  }

  bool get _isDarkMode =>
      isDarkMode || (isDeviceThemeMode ? (SchedulerBinding.instance.window.platformBrightness == Brightness.dark) : false);

  Brightness get iosOverlay => isDeviceThemeMode ? SchedulerBinding.instance.window.platformBrightness : state.themeData().brightness;

  Brightness get androidOverlay => _isDarkMode ? Brightness.light : Brightness.dark;

  AppTheme _get() {
    final type = HiveClient.settingsBox?.get(_themeKey) as String?;
    final index = HiveClient.settingsBox?.get(_themeModeKey) as int?;

    switch (type) {
      case lightThemeID:
        return AppTheme.light().copyWith(themeMode: index != null ? ThemeMode.values.elementAt(index) : null);
      case darkThemeID:
        return AppTheme.dark().copyWith(themeMode: index != null ? ThemeMode.values.elementAt(index) : null);
      default:
        return defaultTheme.copyWith(themeMode: index != null ? ThemeMode.values.elementAt(index) : null);
    }
  }

  void _save() {
    final json = {_themeKey: state.id, _themeModeKey: state.themeMode.index};
    HiveClient.settingsBox?.putAll(json);
  }
}

mixin _ThemeCubit on Cubit<AppTheme> {
  @override
  void emit(AppTheme state) {
    if (!isClosed) super.emit(state);
  }
}
