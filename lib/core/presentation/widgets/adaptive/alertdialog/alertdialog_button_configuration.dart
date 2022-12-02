part of 'adaptive_alertdialog.dart';

class AlertDialogButtonConfig<E> {
  final String? _text;
  final bool _isLoading;
  final bool _disabled;
  final bool _visible;
  final bool _isDefaultAction;
  final bool _isDestructiveAction;
  final bool _autoPop;
  final E Function()? _onPressed;
  final FutureOr<E> Function()? _onPressedFuture;
  final double? _height;
  final double? _width;
  final double? _cupertinoHeight;
  final double? _cupertinoWidth;
  final double? _fontSize;
  final double _maxFontSize;
  final int? _maxLines;
  final Color? _textColor;
  final Color? _backgroundColor;
  final Color? _splashColor;
  final Color? _highlightColor;
  final TextStyle? _textStyle;
  final EdgeInsets? _padding;
  final Widget? _child;
  final BorderRadius? _borderRadius;

  const AlertDialogButtonConfig._(
    this._text,
    this._isLoading,
    this._disabled,
    this._visible,
    this._isDefaultAction,
    this._isDestructiveAction,
    this._autoPop,
    this._onPressed,
    this._onPressedFuture,
    this._height,
    this._width,
    this._cupertinoHeight,
    this._cupertinoWidth,
    this._fontSize,
    this._maxFontSize,
    this._maxLines,
    this._textColor,
    this._backgroundColor,
    this._splashColor,
    this._highlightColor,
    this._textStyle,
    this._padding,
    this._child,
    this._borderRadius,
  )   : assert(_text != null || _child != null),
        assert(!(_isDefaultAction && _isDestructiveAction)),
        assert(_autoPop || _onPressed != null || _onPressedFuture != null),
        assert((_onPressed == null && _onPressedFuture != null) ||
            (_onPressed != null && _onPressedFuture == null) ||
            (_onPressed == null && _onPressedFuture == null));

  Future<void> onPressed(E? defaultValue) async {
    if (_autoPop) {
      unawaited(navigator.pop((await _onPressedFuture?.call()) ?? _onPressed?.call() ?? defaultValue));
    } else {
      (await _onPressedFuture?.call()) ?? _onPressed?.call();
    }
  }

  Color? get textColor => _isDestructiveAction == true ? Palette.destructiveRed : _textColor;

  Color? get highlightColor => _isDestructiveAction == true ? Palette.destructiveRed.withOpacity(0.07) : _highlightColor;

  Color? get splashColor => _isDestructiveAction == true ? Palette.destructiveRed.withOpacity(0.18) : _splashColor;

  factory AlertDialogButtonConfig.leading({
    String? text,
    bool? isLoading,
    bool? disabled,
    bool? visible,
    bool? isDefaultAction,
    bool? isDestructiveAction,
    bool? autoPop,
    E Function()? onPressed,
    FutureOr<E> Function()? onPressedFuture,
    double? height,
    double? width,
    double? cupertinoHeight,
    double? cupertinoWidth,
    double? fontSize,
    double? maxFontSize,
    int? maxLines,
    Color? textColor,
    Color? backgroundColor,
    Color? splashColor,
    Color? highlightColor,
    TextStyle? textStyle,
    EdgeInsets? padding,
    Widget? child,
    BorderRadius? borderRadius,
  }) =>
      AlertDialogButtonConfig._(
        text ?? 'Cancel',
        isLoading ?? false,
        disabled ?? false,
        visible ?? true,
        isDefaultAction ?? false,
        isDestructiveAction ?? false,
        autoPop ?? true,
        onPressed,
        onPressedFuture,
        height ?? 0.045.h,
        width ?? 0.25.w,
        cupertinoHeight ?? 0.045.h,
        cupertinoWidth ?? 0.25.w,
        fontSize ?? 17.sp,
        maxFontSize ?? 18,
        maxLines,
        textColor ?? Palette.onSurface,
        backgroundColor ?? Colors.transparent,
        splashColor ?? Utils.resolveColor(Colors.grey.shade300, dark: Colors.grey.shade800),
        highlightColor,
        const TextStyle(fontWeight: FontWeight.w600).merge(textStyle),
        padding,
        child,
        borderRadius,
      );

  factory AlertDialogButtonConfig.trailing({
    String? text,
    bool? isLoading,
    bool? disabled,
    bool? visible,
    bool? isDefaultAction,
    bool? isDestructiveAction,
    bool? autoPop,
    E Function()? onPressed,
    FutureOr<E> Function()? onPressedFuture,
    double? height,
    double? width,
    double? cupertinoHeight,
    double? cupertinoWidth,
    double? fontSize,
    double? maxFontSize,
    int? maxLines,
    Color? textColor,
    Color? backgroundColor,
    Color? splashColor,
    Color? highlightColor,
    TextStyle? textStyle,
    EdgeInsets? padding,
    Widget? child,
    BorderRadius? borderRadius,
  }) =>
      AlertDialogButtonConfig._(
        text ?? 'OK',
        isLoading ?? false,
        disabled ?? false,
        visible ?? true,
        isDefaultAction ?? false,
        isDestructiveAction ?? false,
        autoPop ?? true,
        onPressed,
        onPressedFuture,
        height ?? 0.045.h,
        width ?? 0.25.w,
        cupertinoHeight ?? 0.045.h,
        cupertinoWidth ?? 0.25.w,
        fontSize ?? 17.sp,
        maxFontSize ?? 18,
        maxLines,
        textColor ?? Palette.primaryColor,
        backgroundColor ?? Colors.transparent,
        splashColor ?? Utils.resolveColor(Colors.grey.shade300, dark: Colors.white12),
        highlightColor,
        const TextStyle(fontWeight: FontWeight.w600).merge(textStyle),
        padding,
        child,
        borderRadius,
      );

  static AlertDialogButtonConfig<dynamic> get leadingButtonConfig => AlertDialogButtonConfig.leading();

  static AlertDialogButtonConfig<dynamic> get trailingButtonConfig => AlertDialogButtonConfig.trailing();

  AlertDialogButtonConfig<E> copyWith({
    String? text,
    bool? isLoading,
    bool? disabled,
    bool? visible,
    bool? isDefaultAction,
    bool? isDestructiveAction,
    bool? autoPop,
    E Function()? onPressed,
    FutureOr<E> Function()? onPressedFuture,
    double? height,
    double? width,
    double? cupertinoHeight,
    double? cupertinoWidth,
    double? fontSize,
    double? maxFontSize,
    int? maxLines,
    Color? textColor,
    Color? backgroundColor,
    Color? splashColor,
    Color? highlightColor,
    TextStyle? textStyle,
    EdgeInsets? padding,
    Widget? child,
    BorderRadius? borderRadius,
  }) =>
      AlertDialogButtonConfig._(
        text ?? _text,
        isLoading ?? _isLoading,
        disabled ?? _disabled,
        visible ?? _visible,
        isDefaultAction ?? _isDefaultAction,
        isDestructiveAction ?? _isDestructiveAction,
        autoPop ?? _autoPop,
        onPressed ?? _onPressed,
        onPressedFuture ?? _onPressedFuture,
        height ?? _height,
        width ?? _width,
        cupertinoHeight ?? _cupertinoHeight,
        cupertinoWidth ?? _cupertinoWidth,
        fontSize ?? _fontSize,
        maxFontSize ?? _maxFontSize,
        maxLines ?? _maxLines,
        textColor ?? _textColor,
        backgroundColor ?? _backgroundColor,
        splashColor ?? _splashColor,
        highlightColor ?? _highlightColor,
        textStyle ?? _textStyle,
        padding ?? _padding,
        child ?? _child,
        borderRadius ?? _borderRadius,
      );

  AlertDialogButtonConfig<E> merge(AlertDialogButtonConfig<E>? other) {
    return copyWith(
      text: other?._text ?? _text,
      isLoading: other?._isLoading ?? _isLoading,
      disabled: other?._disabled ?? _disabled,
      visible: other?._visible ?? _visible,
      isDefaultAction: other?._isDefaultAction ?? _isDefaultAction,
      isDestructiveAction: other?._isDestructiveAction ?? _isDestructiveAction,
      autoPop: other?._autoPop ?? _autoPop,
      onPressed: other?._onPressed ?? _onPressed,
      onPressedFuture: other?._onPressedFuture ?? _onPressedFuture,
      height: other?._height ?? _height,
      width: other?._width ?? _width,
      cupertinoHeight: other?._cupertinoHeight ?? _cupertinoHeight,
      cupertinoWidth: other?._cupertinoWidth ?? _cupertinoWidth,
      fontSize: other?._fontSize ?? _fontSize,
      maxFontSize: other?._maxFontSize ?? _maxFontSize,
      maxLines: other?._maxLines ?? _maxLines,
      textColor: other?._textColor ?? _textColor,
      backgroundColor: other?._backgroundColor ?? _backgroundColor,
      splashColor: other?._splashColor ?? _splashColor,
      textStyle: other?._textStyle ?? _textStyle,
      padding: other?._padding ?? _padding,
      child: other?._child ?? _child,
      borderRadius: other?._borderRadius ?? _borderRadius,
    );
  }
}
