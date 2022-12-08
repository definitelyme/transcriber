// import 'package:transcriber/utils/utils.dart';
// import 'package:transcriber/widgets/widgets.dart';
import 'package:dartz/dartz.dart' hide left, right;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart' hide TextDirection;
import 'package:transcriber/core/presentation/index.dart';
import 'package:transcriber/managers/locator/locator.dart';
import 'package:transcriber/managers/navigation/navigation.dart';
import 'package:transcriber/managers/theme/theme.dart';
import 'package:transcriber/utils/utils.dart';

/// This allows a value of type T or T?
/// to be treated as a value of type T?.
///
/// We use this so that APIs that have become
/// non-nullable can still be used with `!` and `?`
/// to support older versions of the API as well.
T? ambiguate<T>(T? value) => value;

/// This allows a value of type T or T?
T? castOrNull<T>(dynamic x) => x is T ? x : null;

extension ObjectExt<T> on T {
  R let<R>(R Function(T it) cb) {
    if (this != null) return cb.call(this);
    return this as R;
  }

  R also<R>(R Function(T it) func) {
    return func(this);
  }
}

extension DartzX<A> on Option<A?> {
  A? get getOrNull => getOrElse(() => null);
}

/// Extension on [InputDecoration] to merge two [InputDecoration]s.
extension InputDecorationX on InputDecoration {
  InputDecoration merge(InputDecoration? other) {
    return copyWith(
      hintText: other?.hintText ?? hintText,
      hintStyle: other?.hintStyle ?? hintStyle,
      labelStyle: other?.labelStyle ?? labelStyle,
      labelText: other?.labelText ?? labelText,
      border: other?.border ?? border,
      filled: other?.filled ?? filled,
      fillColor: other?.fillColor ?? fillColor,
      contentPadding: other?.contentPadding ?? contentPadding,
      focusColor: other?.focusColor ?? focusColor,
      focusedBorder: other?.focusedBorder ?? focusedBorder,
      prefixIcon: other?.prefixIcon ?? prefixIcon,
      suffixIcon: other?.suffixIcon ?? suffixIcon,
      enabled: other?.enabled ?? enabled,
      hoverColor: other?.hoverColor ?? hoverColor,
      errorBorder: other?.errorBorder ?? errorBorder,
      errorStyle: other?.errorStyle ?? errorStyle,
      errorText: other?.errorText ?? errorText,
      errorMaxLines: other?.errorMaxLines ?? errorMaxLines,
      isDense: other?.isDense ?? isDense,
      helperStyle: other?.helperStyle ?? helperStyle,
      helperText: other?.helperText ?? helperText,
      helperMaxLines: other?.helperMaxLines ?? helperMaxLines,
      enabledBorder: other?.enabledBorder ?? enabledBorder,
      focusedErrorBorder: other?.focusedErrorBorder ?? focusedErrorBorder,
      disabledBorder: other?.disabledBorder ?? disabledBorder,
      alignLabelWithHint: other?.alignLabelWithHint ?? alignLabelWithHint,
      floatingLabelBehavior: other?.floatingLabelBehavior ?? floatingLabelBehavior,
      floatingLabelStyle: other?.floatingLabelStyle ?? floatingLabelStyle,
      floatingLabelAlignment: other?.floatingLabelAlignment ?? floatingLabelAlignment,
      prefixIconConstraints: other?.prefixIconConstraints ?? prefixIconConstraints,
      suffixIconConstraints: other?.suffixIconConstraints ?? suffixIconConstraints,
      prefixIconColor: other?.prefixIconColor ?? prefixIconColor,
      suffixIconColor: other?.suffixIconColor ?? suffixIconColor,
      prefixText: other?.prefixText ?? prefixText,
      suffixText: other?.suffixText ?? suffixText,
      semanticCounterText: other?.semanticCounterText ?? semanticCounterText,
      counter: other?.counter ?? counter,
      counterText: other?.counterText ?? counterText,
      counterStyle: other?.counterStyle ?? counterStyle,
      hintMaxLines: other?.hintMaxLines ?? hintMaxLines,
      hintTextDirection: other?.hintTextDirection ?? hintTextDirection,
      icon: other?.icon ?? icon,
      iconColor: other?.iconColor ?? iconColor,
      prefix: other?.prefix ?? prefix,
      suffix: other?.suffix ?? suffix,
      prefixStyle: other?.prefixStyle ?? prefixStyle,
      suffixStyle: other?.suffixStyle ?? suffixStyle,
      label: other?.label ?? label,
      constraints: other?.constraints ?? constraints,
      isCollapsed: other?.isCollapsed ?? isCollapsed,
    );
  }
}

/// Extension on [EdgeInsets] to merge two [EdgeInsets]s.
extension EdgeInsetsGeometryX on EdgeInsets {
  EdgeInsetsGeometry merge(EdgeInsets? insets) {
    return copyWith(
      left: insets?.left != null && insets?.left != 0.0 ? insets?.left : left,
      right: insets?.right != null && insets?.right != 0.0 ? insets?.right : right,
      bottom: insets?.bottom != null && insets?.bottom != 0.0 ? insets?.bottom : bottom,
      top: insets?.top != null && insets?.top != 0.0 ? insets?.top : top,
    );
  }
}

/// Extension on [InputDecorationTheme]
extension InputDecorationThemeX on InputDecorationTheme {
  /// Merge [InputDecoration] with [InputDecorationTheme].
  InputDecoration merge([InputDecoration? decoration]) {
    return InputDecoration(
      labelStyle: labelStyle,
      hintStyle: hintStyle,
      helperStyle: helperStyle,
      errorStyle: errorStyle,
      errorMaxLines: errorMaxLines,
      isDense: isDense,
      contentPadding: contentPadding,
      isCollapsed: isCollapsed,
      prefixStyle: prefixStyle,
      suffixStyle: suffixStyle,
      counterStyle: counterStyle,
      filled: filled,
      fillColor: fillColor,
      errorBorder: errorBorder,
      focusedBorder: focusedBorder,
      focusedErrorBorder: focusedErrorBorder,
      disabledBorder: disabledBorder,
      enabledBorder: enabledBorder,
      border: border,
      alignLabelWithHint: alignLabelWithHint,
      constraints: constraints,
      helperMaxLines: helperMaxLines,
      floatingLabelBehavior: floatingLabelBehavior,
      floatingLabelStyle: floatingLabelStyle,
      focusColor: focusColor,
      hoverColor: hoverColor,
    ).merge(decoration);
  }

  /// Copy [InputDecorationTheme]
  InputDecoration decoration({
    TextStyle? labelStyle,
    TextStyle? hintStyle,
    TextStyle? helperStyle,
    TextStyle? errorStyle,
    int? errorMaxLines,
    bool? isDense,
    EdgeInsetsGeometry? contentPadding,
    bool? isCollapsed,
    TextStyle? prefixStyle,
    TextStyle? suffixStyle,
    TextStyle? counterStyle,
    bool? filled,
    Color? fillColor,
    InputBorder? errorBorder,
    InputBorder? focusedBorder,
    InputBorder? focusedErrorBorder,
    InputBorder? disabledBorder,
    InputBorder? enabledBorder,
    InputBorder? border,
    bool? alignLabelWithHint,
    BoxConstraints? constraints,
    int? helperMaxLines,
    FloatingLabelBehavior? floatingLabelBehavior,
    TextStyle? floatingLabelStyle,
    Color? focusColor,
    Color? hoverColor,
    String? labelText,
    Widget? label,
    String? errorText,
    FloatingLabelAlignment? floatingLabelAlignment,
    String? helperText,
    String? counterText,
    Widget? counter,
    bool enabled = true,
    Widget? prefixIcon,
    Widget? suffixIcon,
    Color? prefixIconColor,
    Color? suffixIconColor,
    Widget? prefix,
    Widget? suffix,
    String? prefixText,
    String? suffixText,
    String? hintText,
    TextDirection? hintTextDirection,
    Widget? icon,
    int? hintMaxLines,
    BoxConstraints? prefixIconConstraints,
    BoxConstraints? suffixIconConstraints,
    String? semanticCounterText,
  }) {
    return InputDecoration(
      labelStyle: labelStyle ?? this.labelStyle,
      hintStyle: hintStyle ?? this.hintStyle,
      helperStyle: helperStyle ?? this.helperStyle,
      errorStyle: errorStyle ?? this.errorStyle,
      errorMaxLines: errorMaxLines ?? this.errorMaxLines,
      isDense: isDense ?? this.isDense,
      contentPadding: contentPadding ?? this.contentPadding,
      isCollapsed: isCollapsed ?? this.isCollapsed,
      prefixStyle: prefixStyle ?? this.prefixStyle,
      suffixStyle: suffixStyle ?? this.suffixStyle,
      counterStyle: counterStyle ?? this.counterStyle,
      filled: filled ?? this.filled,
      fillColor: fillColor ?? this.fillColor,
      errorBorder: errorBorder ?? this.errorBorder,
      focusedBorder: focusedBorder ?? this.focusedBorder,
      focusedErrorBorder: focusedErrorBorder ?? this.focusedErrorBorder,
      disabledBorder: disabledBorder ?? this.disabledBorder,
      enabledBorder: enabledBorder ?? this.enabledBorder,
      border: border ?? this.border,
      alignLabelWithHint: alignLabelWithHint ?? this.alignLabelWithHint,
      constraints: constraints ?? this.constraints,
      helperMaxLines: helperMaxLines ?? this.helperMaxLines,
      floatingLabelBehavior: floatingLabelBehavior ?? this.floatingLabelBehavior,
      floatingLabelStyle: floatingLabelStyle ?? this.floatingLabelStyle,
      focusColor: focusColor ?? this.focusColor,
      hoverColor: hoverColor ?? this.hoverColor,
      labelText: labelText,
      label: label,
      errorText: errorText,
      floatingLabelAlignment: floatingLabelAlignment ?? this.floatingLabelAlignment,
      helperText: helperText,
      counterText: counterText,
      counter: counter,
      enabled: enabled,
      prefix: prefix,
      suffix: suffix,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      prefixIconColor: prefixIconColor ?? this.prefixIconColor,
      suffixIconColor: suffixIconColor ?? this.suffixIconColor,
      prefixText: prefixText,
      suffixText: suffixText,
      hintText: hintText,
      hintMaxLines: hintMaxLines,
      hintTextDirection: hintTextDirection,
      icon: icon,
      iconColor: iconColor,
      prefixIconConstraints: prefixIconConstraints,
      suffixIconConstraints: suffixIconConstraints,
      semanticCounterText: semanticCounterText,
    );
  }
}

/// Extension on [num]
extension NumExtension on num {
  /// Multiple of screen width
  double get w => MediaQuery.of(getIt<AppRouter>().navigatorKey.currentContext!).size.width * this;

  /// Multiple of screen height
  double get h => MediaQuery.of(getIt<AppRouter>().navigatorKey.currentContext!).size.height * this;

  /// Returns a sizedbox of this [height].
  Widget get vs => VerticalSpace(height: toDouble());

  bool get isInteger => this is int || this == roundToDouble();

  /// Returns a sizedbox of [this] x Multiple of screen height [h].
  ///
  /// `Example: 0.5.vsh => SizedBox(height: 0.5 * MediaQuery.of(context).size.height)`
  ///
  /// Which is equivalent to 50% of the screen height.
  Widget get vsh => VerticalSpace(height: toDouble().h);

  /// Returns a sizedbox of this [width].
  Widget get hs => HorizontalSpace(width: toDouble());

  /// Returns a sizedbox of [this] x Multiple of screen width [w].
  ///
  /// `Example: 0.5.hsw => SizedBox(width: 0.5 * MediaQuery.of(context).size.width)`
  ///
  /// Which is equivalent to 50% of the screen width.
  Widget get hsw => HorizontalSpace(width: toDouble().w);

  ///[ScreenUtil.setSp]
  double get sp => ScreenUtil().setSp(this);

  BorderRadius get br => BorderRadius.circular(toDouble());
}

/// Extension on [TargetPlatform]
extension TargetPlatformX on TargetPlatform {
  bool get isAndroid => this == TargetPlatform.android;

  bool get isIOS => this == TargetPlatform.iOS;

  bool get isFuchsia => this == TargetPlatform.fuchsia;

  bool get isWeb => kIsWeb;

  bool get isDesktop => this == TargetPlatform.windows || this == TargetPlatform.linux || this == TargetPlatform.macOS || isWeb;

  bool get isLinux => this == TargetPlatform.linux;

  bool get isMacOS => this == TargetPlatform.macOS;

  bool get isWindows => this == TargetPlatform.windows;

  bool get isMaterial => isAndroid || isLinux || isWeb || isWindows || isFuchsia;

  bool get isCupertino => isIOS || isMacOS;

  T fold<T>({
    T Function()? cupertino,
    T Function()? android,
    T Function()? fuchsia,
    T Function()? linux,
    T Function()? windows,
    T Function()? macos,
    required T Function() material,
  }) {
    switch (this) {
      case TargetPlatform.iOS:
        return cupertino?.call() ?? android?.call() ?? material();
      case TargetPlatform.macOS:
        return macos?.call() ?? cupertino?.call() ?? material();
      case TargetPlatform.android:
        // return android?.call() ?? cupertino?.call() ?? material();
        return android?.call() ?? material();
      case TargetPlatform.fuchsia:
        return fuchsia?.call() ?? material();
      case TargetPlatform.linux:
        return linux?.call() ?? material();
      case TargetPlatform.windows:
        return windows?.call() ?? material();
      default:
        return material.call();
    }
  }

  T when<T>({T? cupertino, T? android, T? fuchsia, T? linux, T? windows, T? macos, required T material}) {
    switch (this) {
      case TargetPlatform.iOS:
        return cupertino ?? android ?? material;
      case TargetPlatform.macOS:
        return macos ?? cupertino ?? material;
      case TargetPlatform.android:
        // return android ?? cupertino ?? material;
        return android ?? material;
      case TargetPlatform.fuchsia:
        return fuchsia ?? material;
      case TargetPlatform.linux:
        return linux ?? material;
      case TargetPlatform.windows:
        return windows ?? material;
      default:
        return material;
    }
  }

  T? cupertino<T>(T? value) {
    switch (this) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return value as T;
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
      default:
        return null;
    }
  }

  T? material<T>(T? value) {
    switch (this) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return null;
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
      default:
        return value as T;
    }
  }
}

/// Extension on [Widget] to add [SafeArea] as parent.
extension WidgetExtensionsX on Widget {
  Widget get safeVertical => SafeArea(left: false, right: false, child: this);

  Widget get sliverSafeVertical => SliverSafeArea(left: false, right: false, sliver: this);

  Widget get safeTop => SafeArea(bottom: false, left: false, right: false, child: this);

  Widget get sliverSafeTop => SliverSafeArea(bottom: false, left: false, right: false, sliver: this);

  Widget get safeBottom => SafeArea(top: false, left: false, right: false, child: this);

  Widget get sliverSafeBottom => SliverSafeArea(top: false, left: false, right: false, sliver: this);

  Widget get safeLeft => SafeArea(top: false, bottom: false, right: false, child: this);

  Widget get sliverSafeLeft => SliverSafeArea(top: false, bottom: false, right: false, sliver: this);

  Widget get safeRight => SafeArea(top: false, bottom: false, left: false, child: this);

  Widget get sliverSafeRight => SliverSafeArea(top: false, bottom: false, left: false, sliver: this);

  Widget get safeTopLeft => SafeArea(bottom: false, right: false, child: this);

  Widget get safeTopRight => SafeArea(bottom: false, left: false, child: this);

  Widget get safeBottomLeft => SafeArea(top: false, right: false, child: this);

  Widget get safeBottomRight => SafeArea(top: false, left: false, child: this);

  Widget get safeAll => SafeArea(child: this);

  Widget get sliverSafeAll => SliverSafeArea(sliver: this);

  Widget addPadding(EdgeInsets? padding, {bool pad = true}) => pad && padding != null ? Padding(padding: padding, child: this) : this;

  Widget sliverPadding(EdgeInsets? padding, {bool pad = true}) =>
      pad && padding != null ? SliverPadding(padding: padding, sliver: this) : this;

  Widget safeArea({
    bool top = false,
    bool left = false,
    bool right = false,
    bool bottom = false,
    bool onlyIf = true,
  }) {
    if (onlyIf) {
      return SafeArea(top: top, left: left, right: right, bottom: bottom, child: this);
    } else {
      return this;
    }
  }

  Widget sliverSafeArea({
    bool top = false,
    bool left = false,
    bool right = false,
    bool bottom = false,
    bool onlyIf = true,
  }) {
    if (onlyIf) {
      return SliverSafeArea(top: top, left: left, right: right, bottom: bottom, sliver: this);
    } else {
      return this;
    }
  }
}

/// Extension on [int] to get any [Duration] in milliseconds, seconds, etc.
extension DurationIntX on int {
  Duration get milliseconds => Duration(milliseconds: this);
  Duration get seconds => Duration(seconds: this);
  Duration get minutes => Duration(minutes: this);
  Duration get hours => Duration(hours: this);
  Duration get days => Duration(days: this);
}

/// Extension on [Duration] to get the duration from [int] in months, weeks, etc.
extension DurationX on Duration {
  int get inMonths => inDays ~/ 30;
  int get inWeeks => inDays ~/ 7;
}

/// Extension of [Color].
extension ColorX on Color {
  Brightness get brightness {
    final relativeLuminance = computeLuminance();

    // See <https://www.w3.org/TR/WCAG20/#contrast-ratiodef>
    // The spec says to use kThreshold=0.0525, but Material Design appears to bias
    // more towards using light text than WCAG20 recommends. Material Design spec
    // doesn't say what value to use, but 0.15 seemed close to what the Material
    // Design spec shows for its color palette on
    // <https://material.io/go/design-theming#color-color-palette>.
    const kThreshold = 0.15;
    if ((relativeLuminance + 0.05) * (relativeLuminance + 0.05) > kThreshold) return Brightness.light;
    return Brightness.dark;
  }

  /// Intervert color luminance
  Color get invertLuminance => computeLuminance() > 0.5 ? Colors.black : Colors.white;

  /// Add 2 or more colors.
  Color operator +(Color other) => Color.alphaBlend(this, other);
}

extension BulidContextX on BuildContext {
  ThemeCubit get themeCubit => BlocProvider.of<ThemeCubit>(this);

  TextTheme get textTheme => Theme.of(this).textTheme;

  Brightness get iosOverlay => themeCubit.iosOverlay;

  Brightness get androidOverlay => themeCubit.androidOverlay;

  Brightness get iosOverlayInverse => themeCubit.iosOverlay == Brightness.light ? Brightness.dark : Brightness.light;

  Brightness get androidOverlayInverse => themeCubit.androidOverlay == Brightness.light ? Brightness.dark : Brightness.light;
}

extension StringX on String {
  // Capitalize the first letter of a string
  String capitalizeFirst([String? str]) => '${(str ?? this[0]).toUpperCase()}${substring(1).toLowerCase()}';

  // Returns a string in currency
  NumberFormat asCurrencyFormat({
    bool mask = false,
    bool includeSymbol = false,
    bool decimal = true,
    String? currency,
    String? locale,
  }) =>
      NumberFormat.currency(
        name: currency,
        symbol: includeSymbol ? null : '',
        customPattern: mask ? '#,##0' : null,
        decimalDigits: decimal ? 2 : 0,
        locale: locale,
      );

  /// Returns string in currency format
  ///
  /// Example: £50000 => £50,000
  String asCurrency({
    bool mask = false,
    bool symbol = true,
    String? currency,
    String? locale,
  }) {
    final _currency = currency ?? '£ ';
    final _locale = locale ?? 'en_GB';

    if (this == 'null' || isEmpty) return '';

    final _this = num.tryParse(this);

    return asCurrencyFormat(
            mask: mask, includeSymbol: symbol, currency: _currency, decimal: _this != null && !_this.isInteger, locale: _locale)
        .format(_this);
  }
}

extension ListX<T> on Iterable<T> {
  T? firstOrNull([bool Function(T)? predicate]) {
    if (predicate == null) {
      if (this is List) {
        final list = this as List<T>;
        list.isEmpty ? null : list.first;
      }
      final i = iterator;
      if (!i.moveNext()) return null;
      return i.current;
    } else {
      for (final e in this) {
        if (predicate(e)) return e;
      }
      return null;
    }
  }

  /// Adds the list of elements [other] to the end of the list.
  List<T> plus(List<T> other) {
    final _list = toList()..addAll(other);
    return _list;
  }

  /// Removes all elements [other] from the list
  List<T> minus(List<T> other) {
    return where((e) => !other.contains(e)).toList();
  }

  /// Adds an element [T] to the end of the list.
  List<T> plusElement(T element) {
    final _list = toList()..add(element);
    return _list;
  }

  /// Removes an element [T] from the list, if it is present.
  ///
  /// Retains the order of the elements.
  List<T> minusElement(T element) {
    final _list = toList();
    _list.remove(element);
    return _list;
  }

  T? elementAtOrNull(int? index) {
    if (index == null || index < 0 || isEmpty || index >= length) return null;
    return elementAt(index);
  }

  List<R> mapIndexed<R>(R Function(int i, T item) transform) {
    List<R> result = [];
    for (int i = 0; i < length; i++) {
      // Time complexity: O(n)
      R item = transform(i, elementAt(i));
      result.add(item);
    }
    return result;
  }

  List<T> _replace(T newValue, {required bool Function(T prev, T current) predicate}) {
    return map((e) => predicate(e, newValue) ? newValue : e).toList();
  }

  /// Returns `true` if the collection has no elements or no elements match the given [predicate].
  bool _none(bool Function(T) predicate) {
    if (isEmpty) return true;

    for (final element in this) {
      if (predicate(element)) {
        return false;
      }
    }
    return true;
  }

  List<T> _replaceAll(List<T> newValues, {required bool Function(T prev, T current) predicate}) {
    return map((e) {
      final newValue = newValues.firstOrNull((it) => predicate(e, it));
      return newValue ?? e;
    }).toList();
  }

  List<T> plusAndMapIfAbsent<K>(
    List<T> other, {
    required bool Function(T, T) none,
    K Function(T)? distinctBy,
    bool Function(T, T)? replaceIf,
    KtPlus position = KtPlus.end,
  }) {
    final Iterable<T> currentList;

    if (isNotEmpty && replaceIf != null)
      currentList = _replaceAll(other, predicate: replaceIf);
    else
      currentList = this;

    final _filtered = distinctBy != null
        ? other.where((it) => currentList._none((it2) => none(it, it2))).toList().unique(distinctBy)
        : other.where((it) => currentList._none((it2) => none(it, it2))).toList();

    return position.when(
      start: () => List.from([..._filtered, ...currentList]),
      end: () => currentList.plus(_filtered),
    );
  }

  List<T> plusElementAndMapIfAbsent<K>(
    T other, {
    required bool Function(T, T) none,
    bool Function(T, T)? replaceIf,
    KtPlus position = KtPlus.end,
  }) {
    final Iterable<T> currentList;

    if (isNotEmpty && replaceIf != null)
      currentList = _replace(other, predicate: replaceIf);
    else
      currentList = this;

    final isAbsent = currentList._none((it2) => none(other, it2));

    if (!isAbsent) return currentList.toList();

    return position.when(
      start: () => List.from([other, ...currentList]),
      end: () => List.from([...currentList, other]),
    );
  }
}

enum KtPlus {
  start,
  end;

  T when<T>({
    required T Function() start,
    required T Function() end,
  }) {
    switch (this) {
      case KtPlus.start:
        return start.call();
      case KtPlus.end:
        return end.call();
    }
  }
}

extension Unique<E, Id> on List<E> {
  List<E> unique([Id Function(E element)? id, bool inplace = true]) {
    final ids = <Id>{};
    var list = inplace ? this : List<E>.from(this);
    list.retainWhere((x) => ids.add(id?.call(x) ?? x as Id));
    return list;
  }
}

extension StreamX<T> on Stream<T> {
  Future<T?> firstOrNull([bool Function(T)? predicate]) async {
    if (predicate != null) {
      try {
        return firstWhere(predicate);
      } catch (_) {
        return null;
      }
    } else {
      try {
        return first;
      } catch (_) {
        return null;
      }
    }
  }
}
