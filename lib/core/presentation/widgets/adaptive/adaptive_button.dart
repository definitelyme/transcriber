import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transcriber/core/presentation/index.dart';
import 'package:transcriber/utils/utils.dart';

enum ButtonType {
  /// [TextButton], [CupertinoButton]
  text,

  /// [ElevatedButton], [CupertinoButton.filled]
  elevated;

  T when<T>({
    required T Function() text,
    required T Function() elevated,
  }) {
    switch (this) {
      case ButtonType.text:
        return text();
      case ButtonType.elevated:
        return elevated();
    }
  }
}

_CupertinoButtonData get __cupertinoData => const _CupertinoButtonData();
_MaterialButtonData get __materialData => const _MaterialButtonData();
_LoadingIndicatorConfiguration get __loadingData => const _LoadingIndicatorConfiguration();

class AdaptiveButton extends StatelessWidget {
  /// Called when this button is long pressed
  final Function()? onLongPress;

  /// Additional configurations for Cupertino Buttons.
  final _CupertinoButtonData Function(_CupertinoButtonData)? cupertinoData;

  /// Additional configurations for Material Buttons.
  final _MaterialButtonData Function(_MaterialButtonData)? materialData;

  /// Loading Indicator configuration
  final _LoadingIndicatorConfiguration Function(_LoadingIndicatorConfiguration)? loadingData;

  /// The alignment of the button's [child]. Always defauls to [Alignment.center].
  final AlignmentGeometry alignment;

  /// Background color of this button.
  ///
  /// Not applicable to [CupertinoButton.filled].
  final Color? backgroundColor;

  // The border radius of the button.
  final BorderRadius? borderRadius;

  /// Widget to display inside the button.
  final Widget? child;

  /// [true] if the button is disabled.
  final bool disabled;

  /// Set to [true] if the button should expand to fill the available width
  final bool expand;

  /// The font family to use for the text in this button.
  final String? fontFamily;

  /// The font size to use for the text in this button.
  final double? fontSize;

  /// The font weight to use for the text in this button.
  final FontWeight? fontWeight;

  /// If true, `Text` is used for button's child. Otherwise, `AutoSizedText` is used
  ///
  /// Defaults to false
  final bool? isDefaultText;

  /// Maximum fontsize for button's text widget. Default is `AdaptiveText.maxFontSize`
  final double? maxFontSize;

  /// The maximum number of lines for the text to span, wrapping if necessary.
  final int? maxLines;

  /// Called when the button is tapped or otherwise activated.
  final VoidCallback? onPressed;

  /// Padding applied to the button's [child].
  final EdgeInsets? padding;

  /// The border side to use for the button's border.
  final BorderSide? side;

  /// The text to display in this button.
  ///
  /// If this is set, [child] should be null.
  final String? text;

  /// The color to use for this button's text in Light mode.
  final Color? textColor;

  /// The color to use for this button's text in Dark mode.
  final Color? textColorDark;

  /// The style to use for this button's text.
  final TextStyle? textStyle;

  /// The type of button to use.
  final ButtonType type;

  /// The amount of space between words in this button's text.
  final double? wordSpacing;

  AdaptiveButton({
    super.key,
    this.onLongPress,
    this.alignment = Alignment.center,
    this.backgroundColor,
    this.borderRadius,
    this.child,
    this.disabled = false,
    this.expand = false,
    this.fontFamily,
    this.fontSize,
    this.fontWeight,
    this.isDefaultText = false,
    this.maxFontSize,
    this.maxLines,
    this.onPressed,
    this.padding,
    this.side,
    this.text,
    this.textColor,
    this.textColorDark,
    this.textStyle,
    this.wordSpacing,
    this.cupertinoData,
    this.materialData,
    this.loadingData,
  })  : assert(text != null || child != null),
        type = disabled && (Platform.isIOS || Platform.isMacOS) ? ButtonType.elevated : ButtonType.text;

  const AdaptiveButton.elevated({
    super.key,
    this.onLongPress,
    this.alignment = Alignment.center,
    this.backgroundColor,
    this.borderRadius,
    this.child,
    this.disabled = false,
    this.expand = false,
    this.fontFamily,
    this.fontSize,
    this.fontWeight,
    this.isDefaultText = false,
    this.maxFontSize,
    this.maxLines,
    this.onPressed,
    this.padding,
    this.side,
    this.text,
    this.textColor,
    this.textColorDark,
    this.textStyle,
    this.wordSpacing,
    this.cupertinoData,
    this.materialData,
    this.loadingData,
  })  : assert(text != null || child != null),
        type = ButtonType.elevated;

  Color get _backgroundColor => backgroundColor ?? Palette.primary;
  BorderRadius get _borderRadius => borderRadius ?? BorderRadius.circular(Const.buttonRadius);
  _CupertinoButtonData get _cupertinoData => cupertinoData?.call(__cupertinoData) ?? __cupertinoData;
  double get _fontSize => fontSize ?? 16.sp;
  _LoadingIndicatorConfiguration get _loadingData => loadingData?.call(__loadingData) ?? __loadingData;
  _MaterialButtonData get _materialData => materialData?.call(__materialData) ?? __materialData;
  EdgeInsetsGeometry? get _padding => const EdgeInsets.symmetric(horizontal: 8, vertical: 8).merge(padding);
  Widget get _buttonChild => Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AdaptiveText(
            text ?? '',
            maxLines: maxLines,
            softWrap: true,
            textAlign: TextAlign.center,
            fontSize: _fontSize,
            fontWeight: fontWeight,
            wordSpacing: wordSpacing,
            textColor: textColor,
            textColorDark: textColorDark,
            style: TextStyle(fontFamily: fontFamily).merge(textStyle),
          ),
          //
          Visibility(
            visible: _loadingData.isLoading,
            child: Padding(
              padding: const EdgeInsets.all(2).copyWith(left: 0.02.w),
              child: CircularProgressBar.adaptive(
                value: _loadingData.value,
                color: _loadingData._colorLight,
                colorDark: _loadingData._colorDark,
                height: _loadingData._height,
                width: _loadingData._width,
                strokeWidth: _loadingData.strokeWidth,
                radius: _loadingData.radius,
              ),
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return PlatformBuilder(
      cupertino: SizedBox(
        width: expand ? double.infinity : _cupertinoData.width,
        height: _cupertinoData._height,
        child: type.when(
          elevated: () => CupertinoButton.filled(
            alignment: alignment,
            borderRadius: _borderRadius,
            pressedOpacity: _cupertinoData.pressedOpacity,
            minSize: _cupertinoData.minSize,
            disabledColor: _cupertinoData.disabledColor,
            padding: _padding,
            onPressed: disabled ? null : onPressed,
            child: child ?? _buttonChild,
          ),
          text: () => DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: _borderRadius,
              border: side?.let((it) => Border.fromBorderSide(it)),
            ),
            child: CupertinoButton(
              alignment: alignment,
              borderRadius: _borderRadius,
              pressedOpacity: _cupertinoData.pressedOpacity,
              minSize: _cupertinoData.minSize,
              color: _backgroundColor,
              disabledColor: _cupertinoData.disabledColor,
              padding: _padding,
              onPressed: disabled ? null : onPressed,
              child: child ?? _buttonChild,
            ),
          ),
        ),
      ),
      material: SizedBox(
        width: expand ? double.infinity : _materialData.width,
        height: _materialData._height,
        child: type.when(
          elevated: () => ElevatedButton(
            onPressed: disabled ? null : onPressed,
            autofocus: _materialData.autofocus,
            clipBehavior: _materialData.clipBehavior,
            onLongPress: onLongPress,
            focusNode: _materialData.focusNode,
            style: ElevatedButton.styleFrom(
              disabledBackgroundColor: _backgroundColor == Colors.transparent ? _backgroundColor : _backgroundColor.withOpacity(0.4),
              backgroundColor: _backgroundColor,
              alignment: alignment,
              elevation: _materialData.elevation,
              padding: _padding,
              shape: _materialData.shape ?? RoundedRectangleBorder(borderRadius: _borderRadius),
              tapTargetSize: _materialData.tapTargetSize,
              disabledForegroundColor: Palette.onSurface,
              splashFactory: CustomSplashFactory(splashColor: _materialData.splashColor),
              // foregroundColor: _materialData.highlightColor,
              textStyle: textStyle,
              enableFeedback: _materialData.enableFeedback,
              animationDuration: _materialData.animationDuration,
            ).copyWith(overlayColor: MaterialStateProperty.all(_materialData.highlightColor)),
            child: child ?? _buttonChild,
          ),
          text: () => Disabled(
            disabled: disabled,
            opacity: 0.5,
            child: TextButton(
              onPressed: disabled ? null : onPressed,
              autofocus: _materialData.autofocus,
              clipBehavior: _materialData.clipBehavior,
              onLongPress: onLongPress,
              focusNode: _materialData.focusNode,
              style: TextButton.styleFrom(
                backgroundColor: disabled
                    ? _backgroundColor == Colors.transparent
                        ? _backgroundColor
                        : _backgroundColor.withOpacity(0.4)
                    : _backgroundColor,
                alignment: alignment,
                elevation: _materialData.elevation,
                side: side,
                padding: _padding,
                shape: _materialData.shape ?? RoundedRectangleBorder(borderRadius: _borderRadius),
                tapTargetSize: _materialData.tapTargetSize,
                disabledForegroundColor: Palette.onSurface,
                splashFactory: CustomSplashFactory(splashColor: _materialData.splashColor),
                // foregroundColor: _materialData.highlightColor,
                textStyle: textStyle,
                animationDuration: _materialData.animationDuration,
                enableFeedback: _materialData.enableFeedback,
              ).copyWith(overlayColor: MaterialStateProperty.all(_materialData.highlightColor)),
              child: child ?? _buttonChild,
            ),
          ),
        ),
      ),
    );
  }
}

class _LoadingIndicatorConfiguration {
  final Color? colorDark;
  final Color? colorLight;
  final double? height;
  final bool isLoading;
  final double radius;
  final double strokeWidth;
  final double? value;
  final double? width;

  const _LoadingIndicatorConfiguration({
    this.colorLight,
    this.colorDark,
    this.height,
    this.width,
    this.value,
    this.isLoading = false,
    this.strokeWidth = 2,
    this.radius = 12,
  });

  double get _height => height ?? 0.025.h;
  double get _width => width ?? 0.025.h;
  Color? get _colorLight => colorLight ?? Colors.white;
  Color? get _colorDark => colorDark ?? Colors.white;

  _LoadingIndicatorConfiguration copyWith({
    Color? colorLight,
    Color? colorDark,
    double? height,
    double? width,
    double? value,
    bool? isLoading,
    double? strokeWidth,
    double? radius,
  }) {
    return _LoadingIndicatorConfiguration(
      colorLight: colorLight ?? this.colorLight,
      colorDark: colorDark ?? this.colorDark,
      height: height ?? this.height,
      width: width ?? this.width,
      value: value ?? this.value,
      isLoading: isLoading ?? this.isLoading,
      strokeWidth: strokeWidth ?? this.strokeWidth,
      radius: radius ?? this.radius,
    );
  }
}

class _CupertinoButtonData {
  final Color disabledColor;
  final double? height;
  final double minSize;
  final double pressedOpacity;
  final double? width;

  const _CupertinoButtonData({
    this.disabledColor = CupertinoColors.inactiveGray,
    this.height,
    this.minSize = kMinInteractiveDimensionCupertino,
    this.pressedOpacity = 0.65,
    this.width,
  });

  double get _height => height ?? 0.055.h;

  _CupertinoButtonData copyWith({
    Color? disabledColor,
    double? height,
    double? minSize,
    double? pressedOpacity,
    double? width,
  }) {
    return _CupertinoButtonData(
      disabledColor: disabledColor ?? this.disabledColor,
      height: height ?? this.height,
      minSize: minSize ?? this.minSize,
      pressedOpacity: pressedOpacity ?? this.pressedOpacity,
      width: width ?? this.width,
    );
  }
}

class _MaterialButtonData {
  final Duration? animationDuration;
  final bool autofocus;
  final Clip clipBehavior;
  final Color? disabledColor;
  final double elevation;
  final bool enableFeedback;
  final FocusNode? focusNode;
  final double? height;
  final Color? highlightColor;
  final ButtonBarLayoutBehavior? layoutBehavior;
  final OutlinedBorder? shape;
  final Color? splashColor;
  final MaterialTapTargetSize? tapTargetSize;
  final double? width;

  const _MaterialButtonData({
    this.animationDuration,
    this.autofocus = false,
    this.clipBehavior = Clip.hardEdge,
    this.disabledColor,
    this.elevation = 2,
    this.enableFeedback = true,
    this.focusNode,
    this.height,
    this.highlightColor,
    this.layoutBehavior,
    this.shape,
    this.splashColor,
    this.tapTargetSize,
    this.width,
  });

  double get _height => height ?? 0.055.h;

  _MaterialButtonData copyWith({
    Duration? animationDuration,
    bool? autofocus,
    Clip? clipBehavior,
    Color? disabledColor,
    double? elevation,
    bool? enableFeedback,
    FocusNode? focusNode,
    double? height,
    Color? highlightColor,
    ButtonBarLayoutBehavior? layoutBehavior,
    OutlinedBorder? shape,
    Color? splashColor,
    MaterialTapTargetSize? tapTargetSize,
    double? width,
  }) {
    return _MaterialButtonData(
      animationDuration: animationDuration ?? this.animationDuration,
      autofocus: autofocus ?? this.autofocus,
      clipBehavior: clipBehavior ?? this.clipBehavior,
      disabledColor: disabledColor ?? this.disabledColor,
      elevation: elevation ?? this.elevation,
      enableFeedback: enableFeedback ?? this.enableFeedback,
      focusNode: focusNode ?? this.focusNode,
      height: height ?? this.height,
      highlightColor: highlightColor ?? this.highlightColor,
      layoutBehavior: layoutBehavior ?? this.layoutBehavior,
      shape: shape ?? this.shape,
      splashColor: splashColor ?? this.splashColor,
      tapTargetSize: tapTargetSize ?? this.tapTargetSize,
      width: width ?? this.width,
    );
  }
}
