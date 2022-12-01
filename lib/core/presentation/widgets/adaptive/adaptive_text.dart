import 'package:transcriber/utils/utils.dart';
import 'package:flutter/material.dart';

enum _TextType { standard, rich }

/// A stateless widget to render AdaptiveText.
class AdaptiveText extends StatelessWidget {
  final _TextType _type;

  final String data;
  final TextDecoration? decoration;
  final String? fontFamily;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? height;
  final double? letterSpacing;
  final Locale? locale;
  final int? maxLines;
  final TextOverflow? overflow;
  final String? semanticsLabel;
  final bool? softWrap;
  final StrutStyle? strutStyle;
  final TextStyle? style;
  final TextAlign? textAlign;
  //
  final Color? textColor;
  final Color? textColorDark;
  final TextDirection? textDirection;
  final double? textScaleFactor;
  final TextSpan textSpan;
  final Key? widgetKey;
  final double? wordSpacing;

  const AdaptiveText(
    this.data, {
    Key? key,
    this.widgetKey,
    this.locale,
    this.maxLines,
    this.overflow,
    this.semanticsLabel,
    this.softWrap,
    this.strutStyle,
    this.style,
    this.textAlign,
    this.textDirection,
    this.textScaleFactor,
    this.fontFamily,
    this.textColor,
    this.textColorDark,
    this.fontSize,
    this.fontWeight,
    this.height,
    this.letterSpacing,
    this.wordSpacing,
    this.decoration,
  })  : _type = _TextType.standard,
        textSpan = const TextSpan(),
        super(key: key);

  const AdaptiveText.rich(
    this.textSpan, {
    Key? key,
    this.widgetKey,
    this.locale,
    this.maxLines,
    this.overflow,
    this.semanticsLabel,
    this.softWrap,
    this.strutStyle,
    this.style,
    this.textAlign,
    this.textDirection,
    this.textScaleFactor,
    this.fontFamily,
    this.textColor,
    this.textColorDark,
    this.fontSize,
    this.fontWeight,
    this.height,
    this.letterSpacing,
    this.wordSpacing,
    this.decoration,
  })  : _type = _TextType.rich,
        data = '',
        super(key: key);

  String? get _fontFamily => fontFamily ?? FontManager.family;
  double? get _fontSize => fontSize ?? 13;
  String get _semanticsLabel => semanticsLabel ?? (_type == _TextType.standard ? data : textSpan.toPlainText());
  bool get _softWrap => softWrap ?? true;
  Color get _textColor => textColor ?? Palette.onSurfaceLight;
  Color get _textColorDark => textColorDark ?? (textColor != Palette.onSurfaceLight ? textColor : null) ?? Palette.onSurfaceDark;

  TextStyle? _style(BuildContext ctx) => DefaultTextStyle.of(ctx).style.merge(Utils.platform.fold(
      material: () => TextStyle(
            color: Utils.resolveColor(_textColor, dark: _textColorDark, ctx: ctx),
            fontSize: _fontSize,
            fontWeight: fontWeight,
            fontFamily: _fontFamily,
            height: height,
            letterSpacing: letterSpacing,
            decoration: decoration,
            wordSpacing: wordSpacing,
            overflow: overflow,
          ),
      cupertino: () => TextStyle(
            color: Utils.resolveColor(_textColor, dark: _textColorDark, ctx: ctx),
            fontSize: _fontSize,
            fontWeight: fontWeight,
            fontFamily: _fontFamily,
            height: height,
            letterSpacing: letterSpacing,
            decoration: decoration,
            wordSpacing: wordSpacing,
            overflow: overflow,
          )));

  @override
  Widget build(BuildContext context) {
    return _type == _TextType.standard
        ? Text(
            data,
            key: widgetKey,
            locale: locale,
            maxLines: maxLines,
            overflow: overflow,
            semanticsLabel: _semanticsLabel,
            softWrap: _softWrap,
            strutStyle: strutStyle,
            textAlign: textAlign,
            textDirection: textDirection,
            textScaleFactor: textScaleFactor,
            style: _style(context)?.merge(style),
          )
        : Text.rich(
            textSpan,
            key: widgetKey,
            locale: locale,
            maxLines: maxLines,
            overflow: overflow,
            semanticsLabel: _semanticsLabel,
            softWrap: _softWrap,
            strutStyle: strutStyle,
            textAlign: textAlign,
            textDirection: textDirection,
            textScaleFactor: textScaleFactor,
            style: _style(context)?.merge(style),
          );
  }
}
