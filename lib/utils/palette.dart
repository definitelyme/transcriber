import 'package:flutter/material.dart';
import 'package:transcriber/utils/utils.dart';

mixin Palette {
  // App Colors
  static const _backgroundLight = 0xffF9F9F9;
  static const _backgroundDark = 0xff141625;
  static const _primaryColor = 0xff7c5dfa;
  static const _primaryColorDark = 0xff7c5dfa;
  static const _secondaryColor = 0xff373b54;

  static const MaterialColor backgroundColorLight = MaterialColor(
    _backgroundLight,
    <int, Color>{
      50: Color(0xFFf2f2f2),
      100: Color(0xFFefefef),
      200: Color(0xFFededed),
      300: Color(0xFFeaeaea),
      400: Color(0xFFe8e8e8),
      500: Color(_backgroundLight),
      600: Color(0xFFcecece),
      700: Color(0xFFb7b7b7),
      800: Color(0xFFa0a0a0),
      900: Color(0xFF898989),
    },
  );

  static const MaterialColor backgroundColorDark = MaterialColor(
    _backgroundDark,
    <int, Color>{
      50: Color(0xFF8a8b92),
      100: Color(0xFF72737c),
      200: Color(0xFF5b5c66),
      300: Color(0xFF434551),
      400: Color(0xFF2c2d3b),
      500: Color(_backgroundDark),
      600: Color(0xFF121421),
      700: Color(0xFF10121e),
      800: Color(0xFF0e0f1a),
      900: Color(0xFF0c0d16),
    },
  );

  static const MaterialColor primaryColor = MaterialColor(
    _primaryColor,
    <int, Color>{
      50: Color(0xFFbeaefd),
      100: Color(0xFFb09efc),
      200: Color(0xFFa38efc),
      300: Color(0xff967dfb),
      400: Color(0xFF896dfb),
      500: Color(_primaryColor),
      600: Color(0xFF7054e1),
      700: Color(0xFF634ac8),
      800: Color(0xFF5741af),
      900: Color(0xFF4a3896),
    },
  );

  static const MaterialColor secondaryColor = MaterialColor(
    _secondaryColor,
    <int, Color>{
      50: Color(0xFF9b9daa),
      100: Color(0xFF878998),
      200: Color(0xFF737687),
      300: Color(0xFF5f6276),
      400: Color(0xFF4b4f65),
      500: Color(_secondaryColor),
      600: Color(0xFF32354c),
      700: Color(0xFF2c2f43),
      800: Color(0xFF27293b),
      900: Color(0xFF212332),
    },
  );

  static const Color primaryDark = Color(_primaryColorDark);
  // static const Color onPrimaryHover = Color(0xff9277ff);
  static const Color onPrimaryHover = Color(0xff9278ff);
  static const Color primaryVariantDark = Color(0xff7e88c3);
  //
  static const Color onPrimaryLight = Colors.white;
  static const Color onPrimaryDark = Colors.black;
  static const Color onSecondaryLight = Colors.black;
  static const Color onSecondaryDark = Colors.black;
  static const Color onBackgroundLight = Colors.black;
  static const Color onBackgroundDark = Colors.white;
  static const Color onSurface100Light = Colors.black;
  static const Color onSurface100Dark = Colors.white;
  static const Color onSurfaceLight = Colors.black87;
  static const Color onSurfaceDark = Color.fromRGBO(255, 255, 255, 0.87);
  static const Color onErrorLight = Colors.white;
  static const Color onErrorDark = Colors.black;
  static const Color surfaceOverlayLight = Color.fromRGBO(33, 33, 33, 0.08);
  static const Color surfaceOverlayDark = Color(0xff979797);
  static const Color onSurface60Light = Color.fromRGBO(0, 0, 0, 0.6);
  static const Color onSurface60Dark = Color.fromRGBO(255, 255, 255, 0.6);
  static Color elevatedOverlay07Dark = const Color.fromRGBO(255, 255, 255, 0.07) + Palette.backgroundColorDark;
  static Color elevatedOverlay12Dark = const Color.fromRGBO(255, 255, 255, 0.12) + Palette.backgroundColorDark;
  static Color elevatedOverlay16Light = const Color(0xffeeeeee) + Palette.backgroundColorLight;
  static Color elevatedOverlay16Dark = const Color.fromRGBO(255, 255, 255, 0.15) + Palette.backgroundColorDark;
  static Color elevatedOverlayLight = Colors.white;
  // static const Color elevatedOverlayLight = Color(0xffDFe3FA);
  // static Color elevatedOverlayDark = const Color.fromRGBO(255, 255, 255, 0.16) + Palette.backgroundColorDark;
  // static const Color elevatedOverlayDark = Color(0xff1f213a);
  static const Color elevatedOverlayDark = Color(0xff1e2139);
  // static const Color elevatedOverlayDark = Color(0xff252945);
  //
  static const Color transparent = Colors.transparent;
  static const Color appBarLight = Color(0xFF1f213a);
  static const Color appBarDark = Color(0xFF1f213a);
  static const Color iconLight = Color(0xFF1e2139);
  static const Color iconDark = Color(0xFF888eb0);
  static const Color errorRedLight = Color(0xFFB00020);
  static const Color errorRedDark = Color(0xFFCF6679);
  static const Color destructiveRed = Color(0xFFec5757);
  static const Color destructiveRedHover = Color(0xFFff9796);
  static const Color inputBgColorLight = Color(0xfff8f8fb);
  static const Color inputBgColorDark = Color(0xff252945);

  static const Color inputBorderColorLight = Color(0xffDCDCDC);
  // static const Color inputBorderColorDark = Color(0xff222742) + Color(0xff1f213a);
  static const Color inputBorderColorDark = Color(0xff2f3453);

  static const Color disabledColorLight = Color(0xffe2e6f9);
  static const Color disabledColorDark = Color(0xff6e6e6e);
  // static const Color disabledColorDark = Color(0xff707484);
  // static Color disabledColorDark = const Color(0xffe1e6f9) + Palette.backgroundColorDark;

  static Color get primary => Utils.foldTheme(light: () => primaryColor.shade500, dark: () => primaryColor.shade400);

  static Color get primaryVariant => Utils.foldTheme(light: () => primaryColor.shade400, dark: () => primaryVariantDark);

  static Color get secondary => Utils.foldTheme(light: () => secondaryColor.shade200, dark: () => secondaryColor.shade200);

  static Color get secondaryVariant => Utils.foldTheme(light: () => secondaryColor.shade900, dark: () => secondaryColor.shade200);

  static Color get background => Utils.foldTheme(light: () => backgroundColorLight, dark: () => backgroundColorDark);

  static Color get surface => background;

  static Color get errorRed => Utils.foldTheme(light: () => errorRedLight, dark: () => errorRedDark);

  static Color get onPrimary => Utils.foldTheme(light: () => onPrimaryLight, dark: () => onPrimaryDark);

  static Color get onSecondary => Utils.foldTheme(light: () => onSecondaryLight, dark: () => onSecondaryDark);

  static Color get onBackground => Utils.foldTheme(light: () => onBackgroundLight, dark: () => onBackgroundDark);

  static Color get onSurface100 => Utils.foldTheme(light: () => onSurface100Light, dark: () => onSurface100Dark);

  // static Color get onSurface => Utils.foldTheme(light: () => onSurfaceLight, dark: () => onSurfaceDark);
  static Color get onSurface => Utils.foldTheme(light: () => onSurface100Light, dark: () => onSurfaceDark);

  static Color get onSurface60 => Utils.foldTheme(light: () => onSurface60Light, dark: () => onSurface60Dark);

  static Color get onError => Utils.foldTheme(light: () => onErrorLight, dark: () => onErrorDark);

  static Color get surfaceOverlay => Utils.foldTheme(light: () => surfaceOverlayLight, dark: () => surfaceOverlayDark);

  static Color get inputBgColor => Utils.foldTheme(light: () => inputBgColorLight, dark: () => inputBgColorDark)!;

  static Color get inputBorderColor => Utils.foldTheme(light: () => inputBorderColorLight, dark: () => inputBorderColorDark)!;

  static Color get inputBorderFocusedColor => primary;

  static Color get iconColor => Utils.foldTheme(light: () => iconLight, dark: () => iconDark);

  static Color get elevatedOverlay => Utils.foldTheme(light: () => elevatedOverlayLight, dark: () => elevatedOverlayDark)!;

  static Color get elevatedOverlay16 => Utils.foldTheme(light: () => elevatedOverlay16Light, dark: () => elevatedOverlay16Dark)!;

  static Color get disabledColor => Utils.foldTheme(light: () => disabledColorLight, dark: () => disabledColorDark);

  static Color get appBar => Utils.foldTheme(light: () => appBarLight, dark: () => appBarDark);
}
