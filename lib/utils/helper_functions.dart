import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:transcriber/managers/locator/locator.dart';
import 'package:transcriber/managers/navigation/navigation.dart';
import 'package:transcriber/managers/theme/theme.dart';
import 'package:transcriber/utils/utils.dart';

typedef _PlatformDynamicColor = Tuple2<Color?, Color?>? Function();
typedef FutureFunction = FutureOr<dynamic> Function();

// ignore: non_constant_identifier_names
// Utils get App => Utils._singleton;

final GlobalKey<ScaffoldMessengerState> scaffoldMessagerKey = GlobalKey<ScaffoldMessengerState>();

DateTime get localTime => DateTime.now().toLocal();

AppRouter get navigator => getIt<AppRouter>();

/// Returns true if T1 and T2 are identical types.
///
/// This will be false if one type is a derived type of the other.
bool typesEqual<T1, T2>() => T1 == T2;

bool isNullable<U>() => null is U;

double get sidePadding => 1.w * 0.045;

String formatDate(DateTime date) => DateFormat('dd MMM, yyyy').format(date);

class Utils {
  static const Utils _singleton = Utils._();

  static const Widget nothing = SizedBox.shrink();
  static ScrollPhysics physics = Theme.of(navigator.navigatorKey.currentContext!).platform.fold(
        material: () => const ClampingScrollPhysics(),
        cupertino: () => const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      );

  factory Utils() => _singleton;

  const Utils._();

  /// give access to FocusScope.of(context)
  FocusNode? get focusScope => FocusManager.instance.primaryFocus;

  static bool get isPlatformDark => SchedulerBinding.instance.window.platformBrightness == Brightness.dark;

  /// give access to the current platform
  static TargetPlatform get platform => navigator.navigatorKey.currentContext?.let((it) => Theme.of(it).platform) ?? defaultTargetPlatform;

  static PageRoute<T> adaptivePageRoute<T>({
    String? title,
    required WidgetBuilder builder,
    RouteSettings? settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
  }) {
    return Platform.isIOS
        ? CupertinoPageRoute(
            title: title,
            builder: builder,
            settings: settings,
            maintainState: maintainState,
            fullscreenDialog: fullscreenDialog,
          )
        : MaterialPageRoute(
            builder: builder,
            settings: settings,
            maintainState: maintainState,
            fullscreenDialog: fullscreenDialog,
          );
  }

  static SystemUiOverlayStyle customSystemOverlay({
    BuildContext? ctx,
    Brightness? android,
    Brightness? ios,
  }) {
    final context = ctx ?? navigator.navigatorKey.currentContext;
    assert(context != null);

    return SystemUiOverlayStyle(
      // For Android.
      // Use [light] for white status bar and [dark] for black status bar.
      statusBarIconBrightness: android ?? context!.androidOverlay,
      // For iOS.
      // Use [dark] for white status bar and [light] for black status bar.
      statusBarBrightness: ios ?? context!.iosOverlay,
    );
  }

  static T foldTheme<T>({
    required T Function() light,
    T Function()? dark,
    BuildContext? context,
  }) {
    var isdarkMode = isDarkMode(context);

    if (isdarkMode) {
      if (dark == null) return light.call();
      return dark.call();
    } else
      return light.call();
  }

  /// As a rule, Flutter knows which widget to update,
  /// so this command is rarely needed. We can mention situations
  /// where you use const so that widgets are not updated with setState,
  /// but you want it to be forcefully updated when an event like
  /// language change happens. using context to make the widget dirty
  /// for performRebuild() is a viable solution.
  /// However, in situations where this is not possible, or at least,
  /// is not desired by the developer, the only solution for updating
  /// widgets that Flutter does not want to update is to use reassemble
  /// to forcibly rebuild all widgets. Attention: calling this function will
  /// reconstruct the application from the sketch, use this with caution.
  /// Your entire application will be rebuilt, and touch events will not
  /// work until the end of rendering.
  static Future<void> forceAppUpdate() async {
    void rebuild(Element el) {
      el.markNeedsBuild();
      el.visitChildren(rebuild);
    }

    navigator.navigatorKey.currentContext?.let((it) => (it as Element).visitChildren(rebuild));
    // await engine?.reassembleApplication();
  }

  static bool isDarkMode([BuildContext? context]) {
    final ctx = context ?? navigator.navigatorKey.currentContext;
    if (ctx != null) {
      final isDeviceTheme = ctx.read<ThemeCubit>().isDeviceThemeMode;
      return ctx.read<ThemeCubit>().isDarkMode || (isDeviceTheme ? isPlatformDark : false);
    } else
      return false;
  }

  AppTheme get appTheme => isDarkMode() ? AppTheme.dark() : AppTheme.light();

  static Brightness get brightness => getIt<ThemeCubit>().state.themeData().brightness;

  static T? isPlatform<T>({T? material, T? cupertino}) {
    if (Platform.isIOS || Platform.isMacOS)
      return cupertino;
    else
      return material;
  }

  static Color? resolveColor(
    Color? light, {
    Color? dark,
    _PlatformDynamicColor? material,
    _PlatformDynamicColor? cupertino,
    BuildContext? ctx,
  }) {
    final _dynamic = isPlatform(material: material, cupertino: cupertino ?? material)?.call();

    return platform.fold(
      material: () => foldTheme(light: () => _dynamic?.value1 ?? light, dark: () => _dynamic?.value2 ?? dark ?? light, context: ctx),
      cupertino: () => CupertinoDynamicColor.resolve(
        CupertinoDynamicColor.withBrightness(
          color: foldTheme(light: () => _dynamic?.value1 ?? light, dark: () => _dynamic?.value2 ?? dark ?? light, context: ctx) ??
              Palette.background.invertLuminance,
          darkColor: _dynamic?.value2 ?? dark ?? light ?? Palette.background.invertLuminance,
        ),
        ctx ?? navigator.navigatorKey.currentContext!,
      ),
    );
  }

  static Future<U> showAdaptiveDatePicker<U>(
    BuildContext context, {
    DateTime? selectedDate,
    DateTime? firstDate,
    DateTime? lastDate,
    DatePickerMode initialDatePickerMode = DatePickerMode.year,
    String? confirmText,
    String? cancelText,
    String? fieldHintText,
    String? fieldLabelText,
    String? helpText,
    Locale? locale,
    DateTime? currentDate,
    String? errorFormatText,
    String? errorInvalidText,
    DatePickerDateOrder? dateOrder,
    CupertinoDatePickerMode? mode,
    Widget Function(BuildContext, Widget?)? builder,
    bool Function(DateTime)? selectableDayPredicate,
    required void Function(DateTime?) onChanged,
  }) async {
    // Set defaults
    firstDate ??= DateTime(1910);
    lastDate ??= localTime;
    selectedDate ??= currentDate ?? lastDate;

    switch (Theme.of(context).platform) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return showCupertinoDatePicker(
          context,
          selectedDate: selectedDate,
          firstDate: firstDate,
          lastDate: lastDate,
          confirmText: confirmText,
          cancelText: cancelText,
          fieldHintText: fieldHintText,
          fieldLabelText: fieldLabelText,
          dateOrder: dateOrder,
          mode: mode,
          helpText: helpText,
          locale: locale,
          backgroundColor: Utils.resolveColor(
            CupertinoColors.lightBackgroundGray,
            dark: Palette.background,
          ),
          currentDate: currentDate,
          errorFormatText: errorFormatText,
          errorInvalidText: errorInvalidText,
          builder: builder,
          onChanged: onChanged,
        ) as U;
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
      default:
        final date = await showDatePicker(
          context: context,
          initialDate: selectedDate,
          firstDate: firstDate,
          lastDate: lastDate,
          confirmText: confirmText,
          cancelText: cancelText,
          fieldHintText: fieldHintText,
          fieldLabelText: fieldLabelText,
          initialDatePickerMode: initialDatePickerMode,
          helpText: helpText,
          locale: locale,
          currentDate: currentDate,
          errorFormatText: errorFormatText,
          errorInvalidText: errorInvalidText,
          builder: builder,
          selectableDayPredicate: selectableDayPredicate,
        );
        // Fire callback after selection
        return onChanged(date) as U;
    }
  }

  static FutureOr<U?> showAlertDialog<U>({
    required BuildContext context,
    required WidgetBuilder builder,
    bool barrierDismissible = true,
    Color? barrierColor,
    bool useSafeArea = true,
    bool useRootNavigator = true,
    RouteSettings? routeSettings,
  }) {
    // ignore: no_leading_underscores_for_local_identifiers
    final _barrierColor = barrierColor ??
        Utils.resolveColor(
          Colors.grey.shade800.withOpacity(0.55),
          dark: Colors.black87.withOpacity(0.55),
          ctx: context,
        );

    if (Platform.isIOS || Platform.isMacOS)
      return (showCupertinoDialog<U?>(
        context: context,
        builder: builder,
        useRootNavigator: useRootNavigator,
        barrierDismissible: barrierDismissible,
        routeSettings: routeSettings,
      ));
    return (showDialog<U?>(
      context: context,
      builder: builder,
      barrierDismissible: barrierDismissible,
      barrierColor: _barrierColor,
      useSafeArea: useSafeArea,
      useRootNavigator: useRootNavigator,
      routeSettings: routeSettings,
    ));
  }

  static Future<U> showCupertinoDatePicker<U>(
    BuildContext context, {
    DateTime? selectedDate,
    DateTime? firstDate,
    DateTime? lastDate,
    String? confirmText,
    String? cancelText,
    String? fieldHintText,
    String? fieldLabelText,
    String? helpText,
    Locale? locale,
    DateTime? currentDate,
    String? errorFormatText,
    String? errorInvalidText,
    Color? backgroundColor,
    Color? barrierColor,
    bool enableDrag = true,
    bool? isDismissible,
    bool use24hFormat = false,
    double? cupertinoDialogHeight,
    int minuteInterval = 1,
    DatePickerDateOrder? dateOrder,
    CupertinoDatePickerMode? mode,
    Widget Function(BuildContext, Widget?)? builder,
    required void Function(DateTime) onChanged,
  }) async {
    final _height = cupertinoDialogHeight ?? 0.27.h;

    return showAdaptiveBottomSheet(
      context,
      useRootNavigator: true,
      elevation: 4,
      barrierColor: barrierColor,
      backgroundColor: backgroundColor,
      enableDrag: enableDrag,
      isDismissible: isDismissible ?? true,
      builder: (context) =>
          builder?.call(context, null) ??
          SizedBox(
            height: _height,
            child: CupertinoDatePicker(
              mode: mode ?? CupertinoDatePickerMode.date,
              dateOrder: dateOrder,
              backgroundColor: backgroundColor,
              onDateTimeChanged: onChanged,
              initialDateTime: selectedDate,
              minimumDate: firstDate,
              maximumDate: lastDate,
              use24hFormat: use24hFormat,
              minuteInterval: minuteInterval,
            ),
          ),
    ) as U;
  }

  static FutureOr<T?> showAdaptiveBottomSheet<T>(
    BuildContext context, {
    required WidgetBuilder builder,
    Radius topRadius = const Radius.circular(24),
    bool isDismissible = true,
    Color? backgroundColor,
    Color? barrierColor,
    double? elevation,
    bool enableDrag = true,
    bool useRootNavigator = true,
    bool isScrollControlled = false,
    ShapeBorder shape = const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    double? backgroundOpacity,
  }) {
    return showModalBottomSheet(
      context: context,
      builder: builder,
      isDismissible: isDismissible,
      barrierColor: barrierColor,
      elevation: elevation,
      enableDrag: enableDrag,
      backgroundColor: backgroundColor ?? Palette.transparent,
      clipBehavior: Clip.hardEdge,
      shape: shape,
      isScrollControlled: isScrollControlled,
      useRootNavigator: useRootNavigator,
    );
  }

  static SystemUiOverlayStyle systemUIOverlayStyle([BuildContext? c]) => customSystemOverlay(ctx: c);
}
