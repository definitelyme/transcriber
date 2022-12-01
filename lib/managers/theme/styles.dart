import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:transcriber/utils/utils.dart';

part 'styles_adapter.dart';

const String lightThemeID = 'Light-theme-id';
const String darkThemeID = 'Dark-theme-id';

class AppTheme extends HiveObject {
  final Color? _accentColor;
  final Brightness? _accentColorBrightness;
  final BottomNavigationBarThemeData? _bottomNavigationBarTheme;
  final BottomSheetThemeData? _bottomSheetThemeData;
  final Brightness? _brightness;
  final Color? _buttonColor;
  final ButtonThemeData? _buttonThemeData;
  final ColorScheme? _colorScheme;
  final Color? _indicatorColor;
  final Color? _primaryColor;
  final Color? _primaryColorDark;
  final Color? _primaryColorLight;
  final RadioThemeData? _radioThemeData;
  final Color? _scaffoldBackgroundColor;
  final Color? _splashColor;
  final InteractiveInkFeatureFactory? _splashFactory;
  final SwitchThemeData? _switchThemeData;
  final InputDecorationTheme? _textFieldTheme;
  final TextSelectionThemeData? _textSelectionThemeData;
  final TextTheme? _textTheme;
  final Color? _toggleableActiveColor;
  final VisualDensity? _visualDensity;
  final ThemeMode themeMode;

  final String id;

  AppTheme._({
    required this.id,
    required this.themeMode,
    Brightness? brightness,
    Brightness? accentColorBrightness,
    Color? primaryColor,
    Color? buttonColor,
    Color? indicatorColor,
    Color? primaryColorDark,
    Color? primaryColorLight,
    InputDecorationTheme? inputTheme,
    Color? scaffoldBackgroundColor,
    Color? toggleableActiveColor,
    Color? accentColor,
    Color? splashColor,
    ColorScheme? colorScheme,
    InteractiveInkFeatureFactory? splashFactory,
    VisualDensity? visualDensity,
    TextTheme? textTheme,
    BottomSheetThemeData? bottomSheetThemeData,
    BottomNavigationBarThemeData? bottomNavigationBarTheme,
    ButtonThemeData? buttonThemeData,
    RadioThemeData? radioThemeData,
    SwitchThemeData? switchThemeData,
    TextSelectionThemeData? textSelectionThemeData,
  })  : _brightness = brightness,
        _accentColorBrightness = accentColorBrightness,
        _primaryColor = primaryColor,
        _buttonColor = buttonColor,
        _indicatorColor = indicatorColor,
        _primaryColorDark = primaryColorDark,
        _primaryColorLight = primaryColorLight,
        _toggleableActiveColor = toggleableActiveColor,
        _textFieldTheme = inputTheme,
        _scaffoldBackgroundColor = scaffoldBackgroundColor,
        _accentColor = accentColor,
        _splashColor = splashColor,
        _colorScheme = colorScheme,
        _splashFactory = splashFactory,
        _visualDensity = visualDensity,
        _bottomSheetThemeData = bottomSheetThemeData,
        _bottomNavigationBarTheme = bottomNavigationBarTheme,
        _buttonThemeData = buttonThemeData,
        _radioThemeData = radioThemeData,
        _switchThemeData = switchThemeData,
        _textSelectionThemeData = textSelectionThemeData,
        _textTheme = textTheme;

  static TextTheme get textTheme => const TextTheme(
        headlineSmall: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, letterSpacing: 0.15),
        headlineMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, letterSpacing: 0.15),
        headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.w600, letterSpacing: 0.15),
        bodySmall: TextStyle(fontSize: 11, fontWeight: FontWeight.w400, letterSpacing: 0.4),
        bodyMedium: TextStyle(fontSize: 13, fontWeight: FontWeight.w400, letterSpacing: 0.25),
        bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15),
        titleSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
        titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: 0.15),
        titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 0.15),
        displaySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
        displayMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
        displayLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15),
        labelSmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
        labelMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
        labelLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15),
      );

  static InputDecoration get lightInputDecoration => const InputDecoration(
        filled: true,
        isDense: true,
        alignLabelWithHint: true,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        hintStyle: TextStyle(color: Colors.grey),
        labelStyle: TextStyle(color: Colors.grey),
        errorStyle: TextStyle(color: Palette.errorRedLight),
        fillColor: Palette.inputBgColorLight,
        contentPadding: Const.inputPadding,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Palette.inputBorderColorLight),
          borderRadius: BorderRadius.all(Radius.circular(Const.inputBorderRadius)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Palette.inputBorderColorDark),
          borderRadius: BorderRadius.all(Radius.circular(Const.inputBorderRadius)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Palette.errorRedLight, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(Const.inputBorderRadius)),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Palette.inputBorderColorLight),
          borderRadius: BorderRadius.all(Radius.circular(Const.inputBorderRadius)),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Palette.disabledColorLight),
          borderRadius: BorderRadius.all(Radius.circular(Const.inputBorderRadius)),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Palette.errorRedLight, width: 1.3),
          borderRadius: BorderRadius.all(Radius.circular(Const.inputBorderRadius)),
        ),
      );

  /// Light Theme Configurations
  static AppTheme light() {
    return AppTheme._(
      id: lightThemeID,
      themeMode: ThemeMode.light,
      brightness: Brightness.light,
      accentColorBrightness: Brightness.light,
      primaryColor: Palette.primaryColor,
      accentColor: Palette.primaryColor,
      indicatorColor: Colors.white,
      toggleableActiveColor: Palette.primaryColor.shade800,
      splashFactory: InkRipple.splashFactory,
      scaffoldBackgroundColor: Palette.backgroundColorLight,
      buttonColor: Palette.primaryColor,
      splashColor: Palette.primaryColor.withOpacity(0.04),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      colorScheme: ColorScheme.fromSwatch(
        accentColor: Palette.primaryColor,
        brightness: Brightness.light,
        primarySwatch: Palette.primaryColor,
        primaryColorDark: Palette.primaryColor.shade700,
        backgroundColor: Palette.backgroundColorLight,
        errorColor: Palette.errorRedLight,
        cardColor: Palette.elevatedOverlayLight,
      ),
      textSelectionThemeData: TextSelectionThemeData(
        cursorColor: Palette.primaryColor,
        selectionColor: Palette.primaryDark,
        selectionHandleColor: Palette.primaryColor.shade400,
      ),
      radioThemeData: RadioThemeData(
        fillColor: MaterialStateProperty.all(Palette.primary),
        materialTapTargetSize: MaterialTapTargetSize.padded,
      ),
      switchThemeData: SwitchThemeData(
        thumbColor: MaterialStateProperty.all(Palette.primary),
        trackColor: MaterialStateProperty.all(Palette.primary.withOpacity(0.3)),
        materialTapTargetSize: MaterialTapTargetSize.padded,
      ),
      inputTheme: InputDecorationTheme(
        alignLabelWithHint: lightInputDecoration.alignLabelWithHint ?? true,
        floatingLabelBehavior: lightInputDecoration.floatingLabelBehavior ?? FloatingLabelBehavior.auto,
        isDense: lightInputDecoration.isDense ?? true,
        filled: lightInputDecoration.filled ?? true,
        hintStyle: lightInputDecoration.hintStyle,
        labelStyle: lightInputDecoration.labelStyle,
        errorStyle: lightInputDecoration.errorStyle,
        fillColor: lightInputDecoration.fillColor,
        contentPadding: lightInputDecoration.contentPadding,
        focusedBorder: lightInputDecoration.focusedBorder,
        focusedErrorBorder: lightInputDecoration.focusedErrorBorder,
        enabledBorder: lightInputDecoration.enabledBorder,
        disabledBorder: lightInputDecoration.disabledBorder,
        border: lightInputDecoration.border,
        errorBorder: lightInputDecoration.errorBorder,
        constraints: lightInputDecoration.constraints,
        counterStyle: lightInputDecoration.counterStyle,
        errorMaxLines: lightInputDecoration.errorMaxLines,
        floatingLabelAlignment: lightInputDecoration.floatingLabelAlignment ?? FloatingLabelAlignment.start,
        floatingLabelStyle: lightInputDecoration.floatingLabelStyle,
        focusColor: lightInputDecoration.focusColor,
        helperMaxLines: lightInputDecoration.helperMaxLines,
        helperStyle: lightInputDecoration.helperStyle,
        hoverColor: lightInputDecoration.hoverColor,
        iconColor: lightInputDecoration.iconColor,
        isCollapsed: lightInputDecoration.isCollapsed,
        prefixIconColor: lightInputDecoration.prefixIconColor,
        prefixStyle: lightInputDecoration.prefixStyle,
        suffixStyle: lightInputDecoration.suffixStyle,
        suffixIconColor: lightInputDecoration.suffixIconColor,
      ),
      textTheme: textTheme.apply(
        fontFamily: Const.fontFamily,
        displayColor: Palette.onSurfaceLight, // For headline 1 - 6
        bodyColor: Palette.onSurfaceLight, // For every other text style
      ),
    );
  }

  static InputDecoration get darkInputDecoration => const InputDecoration(
        filled: true,
        isDense: true,
        alignLabelWithHint: true,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        hintStyle: TextStyle(color: Colors.grey),
        labelStyle: TextStyle(color: Colors.grey),
        errorStyle: TextStyle(color: Palette.errorRedLight),
        fillColor: Palette.inputBgColorDark,
        contentPadding: Const.inputPadding,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Palette.inputBorderColorDark),
          borderRadius: BorderRadius.all(Radius.circular(Const.inputBorderRadius)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Palette.inputBorderColorDark),
          borderRadius: BorderRadius.all(Radius.circular(Const.inputBorderRadius)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Palette.errorRedDark, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(Const.inputBorderRadius)),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Palette.inputBorderColorDark),
          borderRadius: BorderRadius.all(Radius.circular(Const.inputBorderRadius)),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Palette.disabledColorDark),
          borderRadius: BorderRadius.all(Radius.circular(Const.inputBorderRadius)),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Palette.errorRedDark, width: 1.3),
          borderRadius: BorderRadius.all(Radius.circular(Const.inputBorderRadius)),
        ),
      );

  /// Dark Theme Configurations
  static AppTheme dark() {
    return AppTheme._(
      id: darkThemeID,
      themeMode: ThemeMode.dark,
      brightness: Brightness.dark,
      accentColorBrightness: Brightness.dark,
      primaryColor: Palette.primaryColor,
      accentColor: Palette.primaryColor,
      toggleableActiveColor: Palette.primaryColor.shade800,
      indicatorColor: Colors.white,
      splashFactory: InkRipple.splashFactory,
      scaffoldBackgroundColor: Palette.backgroundColorDark,
      buttonColor: Palette.primaryColor,
      splashColor: Palette.primaryColor.withOpacity(0.08),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      colorScheme: ColorScheme.fromSwatch(
        accentColor: Palette.primaryColor,
        brightness: Brightness.dark,
        primarySwatch: Palette.primaryColor,
        primaryColorDark: Palette.primaryColor.shade700,
        backgroundColor: Palette.backgroundColorDark,
        errorColor: Palette.errorRedDark,
        cardColor: Palette.elevatedOverlayDark,
      ),
      radioThemeData: RadioThemeData(
        fillColor: MaterialStateProperty.all(Palette.primaryColor),
        materialTapTargetSize: MaterialTapTargetSize.padded,
      ),
      // switchThemeData: SwitchThemeData(
      //   thumbColor: MaterialStateProperty.all(Palette.accent20),
      //   trackColor: MaterialStateProperty.all(Palette.accentColor.shade400),
      //   materialTapTargetSize: MaterialTapTargetSize.padded,
      // ),
      switchThemeData: SwitchThemeData(
        thumbColor: MaterialStateProperty.all(Palette.primaryColor.withOpacity(0.15)),
        trackColor: MaterialStateProperty.all(Palette.primaryColor.shade50),
        materialTapTargetSize: MaterialTapTargetSize.padded,
      ),
      textSelectionThemeData: TextSelectionThemeData(
        cursorColor: Colors.white70,
        selectionColor: Palette.primaryColor.shade100,
        selectionHandleColor: Palette.primaryColor,
      ),
      inputTheme: InputDecorationTheme(
        alignLabelWithHint: darkInputDecoration.alignLabelWithHint ?? true,
        floatingLabelBehavior: darkInputDecoration.floatingLabelBehavior ?? FloatingLabelBehavior.auto,
        isDense: darkInputDecoration.isDense ?? true,
        filled: darkInputDecoration.filled ?? true,
        hintStyle: darkInputDecoration.hintStyle,
        labelStyle: darkInputDecoration.labelStyle,
        errorStyle: darkInputDecoration.errorStyle,
        fillColor: darkInputDecoration.fillColor,
        contentPadding: darkInputDecoration.contentPadding,
        focusedBorder: darkInputDecoration.focusedBorder,
        focusedErrorBorder: darkInputDecoration.focusedErrorBorder,
        enabledBorder: darkInputDecoration.enabledBorder,
        disabledBorder: darkInputDecoration.disabledBorder,
        border: darkInputDecoration.border,
        errorBorder: darkInputDecoration.errorBorder,
        constraints: darkInputDecoration.constraints,
        counterStyle: darkInputDecoration.counterStyle,
        errorMaxLines: darkInputDecoration.errorMaxLines,
        floatingLabelAlignment: darkInputDecoration.floatingLabelAlignment ?? FloatingLabelAlignment.start,
        floatingLabelStyle: darkInputDecoration.floatingLabelStyle,
        focusColor: darkInputDecoration.focusColor,
        helperMaxLines: darkInputDecoration.helperMaxLines,
        helperStyle: darkInputDecoration.helperStyle,
        hoverColor: darkInputDecoration.hoverColor,
        iconColor: darkInputDecoration.iconColor,
        isCollapsed: darkInputDecoration.isCollapsed,
        prefixIconColor: darkInputDecoration.prefixIconColor,
        prefixStyle: darkInputDecoration.prefixStyle,
        suffixStyle: darkInputDecoration.suffixStyle,
        suffixIconColor: darkInputDecoration.suffixIconColor,
      ),
      textTheme: textTheme.apply(
        fontFamily: Const.fontFamily,
        displayColor: Palette.onSurfaceDark, // For headline 1 - 6
        bodyColor: Palette.onSurfaceDark, // For every other text style
      ),
    );
  }

  ThemeData themeData() {
    return ThemeData(
      brightness: _brightness,
      primaryColor: _primaryColor,
      indicatorColor: _indicatorColor,
      primaryColorDark: _primaryColorDark,
      primaryColorLight: _primaryColorLight,
      toggleableActiveColor: _toggleableActiveColor,
      fontFamily: Const.fontFamily,
      useMaterial3: true,
      textSelectionTheme: _textSelectionThemeData,
      inputDecorationTheme: _textFieldTheme,
      colorScheme: _colorScheme,
      splashColor: _splashColor,
      splashFactory: _splashFactory,
      scaffoldBackgroundColor: _scaffoldBackgroundColor,
      visualDensity: _visualDensity,
      bottomSheetTheme: _bottomSheetThemeData,
      bottomNavigationBarTheme: _bottomNavigationBarTheme,
      buttonTheme: _buttonThemeData,
      radioTheme: _radioThemeData,
      switchTheme: _switchThemeData,
      textTheme: _textTheme,
    );
  }

  AppTheme copyWith({
    ThemeMode? themeMode,
    Brightness? brightness,
    Brightness? accentColorBrightness,
    Color? primaryColor,
    Color? buttonColor,
    Color? indicatorColor,
    Color? primaryColorDark,
    Color? primaryColorLight,
    Color? toggleableActiveColor,
    Color? scaffoldBackgroundColor,
    Color? accentColor,
    Color? splashColor,
    ColorScheme? colorScheme,
    InputDecorationTheme? textFieldTheme,
    InteractiveInkFeatureFactory? splashFactory,
    VisualDensity? visualDensity,
    TextTheme? textTheme,
    BottomSheetThemeData? bottomSheetThemeData,
    BottomNavigationBarThemeData? bottomNavigationBarTheme,
    ButtonThemeData? buttonThemeData,
    RadioThemeData? radioThemeData,
    SwitchThemeData? switchThemeData,
    TextSelectionThemeData? textSelectionThemeData,
  }) {
    return AppTheme._(
      id: id,
      themeMode: themeMode ?? this.themeMode,
      brightness: brightness ?? _brightness,
      accentColorBrightness: accentColorBrightness ?? _accentColorBrightness,
      primaryColor: primaryColor ?? _primaryColor,
      buttonColor: buttonColor ?? _buttonColor,
      indicatorColor: indicatorColor ?? _indicatorColor,
      primaryColorDark: primaryColorDark ?? _primaryColorDark,
      primaryColorLight: primaryColorLight ?? _primaryColorLight,
      inputTheme: textFieldTheme ?? _textFieldTheme,
      scaffoldBackgroundColor: scaffoldBackgroundColor ?? _scaffoldBackgroundColor,
      toggleableActiveColor: toggleableActiveColor ?? _toggleableActiveColor,
      accentColor: accentColor ?? _accentColor,
      splashColor: splashColor ?? _splashColor,
      splashFactory: splashFactory ?? _splashFactory,
      colorScheme: colorScheme ?? _colorScheme,
      visualDensity: visualDensity ?? _visualDensity,
      textTheme: textTheme ?? _textTheme,
      bottomSheetThemeData: bottomSheetThemeData ?? _bottomSheetThemeData,
      bottomNavigationBarTheme: bottomNavigationBarTheme ?? _bottomNavigationBarTheme,
      buttonThemeData: buttonThemeData ?? _buttonThemeData,
      radioThemeData: radioThemeData ?? _radioThemeData,
      switchThemeData: switchThemeData ?? _switchThemeData,
      textSelectionThemeData: textSelectionThemeData ?? _textSelectionThemeData,
    );
  }
}
