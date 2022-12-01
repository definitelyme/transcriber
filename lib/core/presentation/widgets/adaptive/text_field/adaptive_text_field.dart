library adaptive_text_field.dart;

import 'package:transcriber/core/presentation/index.dart';
import 'package:transcriber/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

part './_fields.dart';

enum TextFieldType {
  /// [TextField], [CupertinoTextField.borderless].
  textfield,

  /// [TextFormField], [CupertinoTextFormFieldRow].
  formfield;

  T when<T>({
    required T Function() textfield,
    required T Function() formfield,
  }) {
    switch (this) {
      case TextFieldType.textfield:
        return textfield();
      case TextFieldType.formfield:
        return formfield();
    }
  }
}

class AdaptiveTextFormInput extends StatefulWidget {
  final TextFieldType _textFieldType;

  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;

  /// Additional configurations for Cupertino TextFormField.
  final _CupertinoTextFieldData Function(_CupertinoTextFieldData)? cupertinoData;

  /// Additional configurations for Material TextFormField.
  final _MaterialTextFieldData Function(_MaterialTextFieldData)? materialData;

  final String? Function(String?)? validator;
  final TextInputAction? action;
  final bool? alignLabelWithHint;
  final bool autoCorrect;
  final bool? autoDisposeController;
  final Iterable<String> autoFillHints;
  final bool autoFocus;
  final AutovalidateMode? autovalidateMode;
  final InputBorder? border;
  final BorderRadius? borderRadius;
  final TextCapitalization capitalization;
  final TextEditingController? controller;
  final Color? cursorColor;
  final InputDecoration? decoration;
  final bool? dense;
  final bool disabled;
  final InputBorder? disabledBorder;
  final bool enableInteractiveSelection;
  final bool enableSuggestions;
  final InputBorder? enabledBorder;
  final InputBorder? errorBorder;
  final String? errorText;
  final bool expands;
  final Color? fillColor;
  final bool? filled;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final FocusNode? focus;
  final InputBorder? focusBorder;
  final InputBorder? focusedBorder;
  final InputBorder? focusedErrorBorder;
  final TextStyle? hintStyle;
  final String? hintText;
  final String? initial;
  final List<TextInputFormatter> inputFormatters;
  final Brightness? keyboardAppearance;
  final TextInputType keyboardType;
  final String? label;
  final TextStyle? labelStyle;
  final int? maxLength;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final int? maxLines;
  final int? minLines;
  final FocusNode? next;
  final bool obscureText;
  final VoidCallback? onEditingComplete;
  final VoidCallback? onTap;
  final Widget? prefix;
  final TextStyle? prefixStyle;
  final String? prefixText;
  final bool? readOnly;
  final TextSelectionControls? selectionControls;
  final bool showCursor;
  final bool showMaxLength;
  final TextStyle? style;
  final Widget? suffix;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final TextDirection? textDirection;
  final ToolbarOptions? toolbarOptions;
  final bool validate;

  const AdaptiveTextFormInput({
    super.key,
    this.onChanged,
    this.onFieldSubmitted,
    this.cupertinoData,
    this.materialData,
    this.validator,
    this.action,
    this.alignLabelWithHint,
    this.autoCorrect = false,
    this.autoDisposeController,
    this.autoFillHints = const [],
    this.autoFocus = false,
    this.autovalidateMode,
    this.border,
    this.borderRadius,
    this.capitalization = TextCapitalization.none,
    this.controller,
    this.cursorColor,
    this.decoration,
    this.dense,
    this.disabled = false,
    this.disabledBorder,
    this.enableInteractiveSelection = true,
    this.enableSuggestions = true,
    this.enabledBorder,
    this.errorBorder,
    this.errorText,
    this.expands = false,
    this.fillColor,
    this.filled,
    this.floatingLabelBehavior,
    this.focus,
    this.focusBorder,
    this.focusedBorder,
    this.focusedErrorBorder,
    this.hintStyle,
    this.hintText,
    this.initial,
    this.inputFormatters = const [],
    this.keyboardAppearance,
    this.keyboardType = TextInputType.text,
    this.label,
    this.labelStyle,
    this.maxLength,
    this.maxLengthEnforcement,
    this.maxLines,
    this.minLines,
    this.next,
    this.obscureText = false,
    this.onEditingComplete,
    this.onTap,
    this.prefix,
    this.prefixStyle,
    this.prefixText,
    this.readOnly,
    this.selectionControls,
    this.showCursor = true,
    this.showMaxLength = false,
    this.style,
    this.suffix,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.textDirection,
    this.toolbarOptions,
    this.validate = false,
  }) : _textFieldType = TextFieldType.formfield;

  const AdaptiveTextFormInput.textfield({
    super.key,
    this.onChanged,
    void Function(String)? onSubmitted,
    this.cupertinoData,
    this.materialData,
    this.action,
    this.alignLabelWithHint,
    this.autoCorrect = false,
    this.autoDisposeController,
    this.autoFillHints = const [],
    this.autoFocus = false,
    this.border,
    this.borderRadius,
    this.capitalization = TextCapitalization.none,
    this.controller,
    this.cursorColor,
    this.decoration,
    this.dense,
    this.disabled = false,
    this.disabledBorder,
    this.enableInteractiveSelection = true,
    this.enableSuggestions = true,
    this.enabledBorder,
    this.errorBorder,
    this.errorText,
    this.expands = false,
    this.fillColor,
    this.filled,
    this.floatingLabelBehavior,
    this.focus,
    this.focusBorder,
    this.focusedBorder,
    this.focusedErrorBorder,
    this.hintStyle,
    this.hintText,
    this.initial,
    this.inputFormatters = const [],
    this.keyboardAppearance,
    this.keyboardType = TextInputType.text,
    this.label,
    this.labelStyle,
    this.maxLength,
    this.maxLengthEnforcement,
    this.maxLines,
    this.minLines,
    this.next,
    this.obscureText = false,
    this.onEditingComplete,
    this.onTap,
    this.prefix,
    this.prefixStyle,
    this.prefixText,
    this.readOnly,
    this.selectionControls,
    this.showCursor = true,
    this.showMaxLength = false,
    this.style,
    this.suffix,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.textDirection,
    this.toolbarOptions,
    this.validate = false,
  })  : _textFieldType = TextFieldType.textfield,
        onFieldSubmitted = onSubmitted,
        validator = null,
        autovalidateMode = null;

  @override
  _AdaptiveTextFormInputState createState() => _AdaptiveTextFormInputState();

  _CupertinoTextFieldData get _cupertinoData => _CupertinoTextFieldData(
      borderRadius: borderRadius, fillColor: fillColor, prefix: prefix, suffix: suffix, textFieldType: TextFieldType.textfield);

  _MaterialTextFieldData get _materialData => _MaterialTextFieldData(textFieldType: _textFieldType);
}

class _AdaptiveTextFormInputState extends State<AdaptiveTextFormInput> with AutomaticKeepAliveClientMixin<AdaptiveTextFormInput> {
  late TextEditingController _textEditingController;

  bool didUpdateController = false;

  @override
  void didUpdateWidget(covariant AdaptiveTextFormInput oldWidget) {
    // Only run if controller was initialized within this widget && initial is! null
    if (widget.controller == null && widget.initial != null) {
      // Ensure "initial" !- controller's text && controller hasn't been updated
      if (widget.initial != _textEditingController.text && !didUpdateController)
        setState(() {
          _textEditingController = _textEditingController..text = widget.initial!;
          didUpdateController = true;
        });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    if (_autoDisposeController) _textEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _textEditingController = widget.controller ??
        (widget.initial != null && widget.initial!.isNotEmpty ? TextEditingController(text: widget.initial) : TextEditingController());

    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

  bool get _autoDisposeController => widget.autoDisposeController ?? widget.controller == null;

  Iterable<String>? get _autoFillHints {
    if (widget.disabled) return null;
    if (widget.readOnly != null && widget.readOnly!) return null;
    return widget.autoFillHints;
  }

  _CupertinoTextFieldData get _cupertinoData => widget.cupertinoData?.call(widget._cupertinoData) ?? widget._cupertinoData;

  Color? get _cursorColor => Palette.primary;

  TextStyle get _disabledTextStyle => _textStyle.copyWith(color: Palette.disabledColor);

  TextStyle get _errorTextStyle => _textStyle.copyWith(color: Palette.errorRed, fontSize: 12);

  TextStyle get _hintTextStyle => _textStyle
      .copyWith(
        fontWeight: FontWeight.w400,
        color: Utils.resolveColor(Palette.onSurfaceLight.withOpacity(0.3), dark: Palette.onSurfaceDark.withOpacity(0.5)),
      )
      .merge(widget.hintStyle);

  Brightness get _keyboardAppearance => widget.keyboardAppearance ?? Utils.brightness;

  _MaterialTextFieldData get _materialData => widget.materialData?.call(widget._materialData) ?? widget._materialData;

  TextFieldType get _textFieldType =>
      Utils.isPlatform(cupertino: _cupertinoData.textFieldType, material: _materialData.textFieldType) ?? widget._textFieldType;

  TextStyle get _textStyle =>
      widget.style ?? TextStyle(color: Palette.onSurface, fontSize: 14, fontWeight: FontWeight.w600).merge(widget.style);

  void _setNewFocus() {
    widget.focus?.unfocus();
    FocusScope.of(context).requestFocus(widget.next);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return PlatformBuilder(
      cupertino: _textFieldType.when(
        formfield: () => _cupertinoTextFormField,
        textfield: () => CupertinoFormRow(
          prefix: widget.prefixText != null ? AdaptiveText(widget.prefixText!, style: widget.prefixStyle) : null,
          error: widget.validate ? widget.errorText?.let((it) => Text(it, style: TextStyle(color: Palette.errorRed))) : Utils.nothing,
          padding: EdgeInsets.zero,
          child: _cupertinoTextField,
        ),
      ),
      material: _textFieldType.when(
        textfield: () => _materialTextField,
        formfield: () => _materialTextFormField,
      ),
    );
  }
}

class _CupertinoTextFieldData {
  final BoxDecoration? _decoration;
  final EdgeInsetsGeometry? _padding;

  final Color borderColorDark;
  final Color borderColorLight;
  final BorderRadius? borderRadius;
  final OverlayVisibilityMode clearButtonMode;
  final Color? fillColor;
  final Widget? prefix;
  final OverlayVisibilityMode prefixMode;
  final Widget? suffix;
  final OverlayVisibilityMode suffixMode;
  final TextFieldType? textFieldType;

  const _CupertinoTextFieldData({
    EdgeInsetsGeometry? padding,
    this.borderColorLight = Palette.inputBorderColorLight,
    this.borderColorDark = Palette.inputBorderColorDark,
    this.borderRadius,
    this.clearButtonMode = OverlayVisibilityMode.never,
    this.fillColor,
    BoxDecoration? decoration,
    this.prefix,
    this.prefixMode = OverlayVisibilityMode.editing,
    this.suffix,
    this.suffixMode = OverlayVisibilityMode.editing,
    this.textFieldType,
  })  : _padding = padding,
        _decoration = decoration;

  bool get _prefixVisible => prefix != null && (prefixMode == OverlayVisibilityMode.always || prefixMode == OverlayVisibilityMode.editing);
  bool get _suffixVisible => suffix != null && (suffixMode == OverlayVisibilityMode.always || suffixMode == OverlayVisibilityMode.editing);
  Color get borderColor => Utils.resolveColor(borderColorLight, dark: borderColorDark)!;
  BoxDecoration get decoration =>
      _decoration ??
      BoxDecoration(
        borderRadius: borderRadius ?? const BorderRadius.all(Radius.circular(Const.inputBorderRadius)),
        color: fillColor ?? Utils.resolveColor(CupertinoColors.extraLightBackgroundGray, dark: Palette.inputBgColor),
        border: Border.all(color: Palette.inputBorderColor, width: 1.5),
      );

  EdgeInsetsGeometry get padding {
    if (_padding != null) return _padding!;

    // var value = Const.inputPadding.copyWith(top: 10.0, bottom: 10.0);
    var value = Const.inputPadding;

    if (_prefixVisible) {
      value = value.copyWith(left: 0);
    } else if (_suffixVisible) {
      value = value.copyWith(right: 0);
    }

    return value;
  }

  _CupertinoTextFieldData copyWith({
    BoxDecoration? decoration,
    EdgeInsetsGeometry? padding,
    Color? borderColorDark,
    Color? borderColorLight,
    BorderRadius? borderRadius,
    OverlayVisibilityMode? clearButtonMode,
    Color? fillColor,
    Widget? prefix,
    OverlayVisibilityMode? prefixMode,
    Widget? suffix,
    OverlayVisibilityMode? suffixMode,
    TextFieldType? textFieldType,
  }) =>
      _CupertinoTextFieldData(
        decoration: decoration ?? this.decoration,
        padding: padding ?? this.padding,
        borderColorDark: borderColorDark ?? this.borderColorDark,
        borderColorLight: borderColorLight ?? this.borderColorLight,
        borderRadius: borderRadius ?? this.borderRadius,
        clearButtonMode: clearButtonMode ?? this.clearButtonMode,
        fillColor: fillColor ?? this.fillColor,
        prefix: prefix ?? this.prefix,
        prefixMode: prefixMode ?? this.prefixMode,
        suffix: suffix ?? this.suffix,
        suffixMode: suffixMode ?? this.suffixMode,
        textFieldType: textFieldType ?? this.textFieldType,
      );
}

class _MaterialTextFieldData {
  final EdgeInsetsGeometry? _padding;

  final Widget? prefixIcon;
  final Color? prefixIconColor;
  final BoxConstraints? prefixIconConstraints;
  final Widget? suffixIcon;
  final Color? suffixIconColor;
  final BoxConstraints? suffixIconConstraints;
  final TextStyle? suffixStyle;
  final String? suffixText;
  final TextFieldType? textFieldType;

  const _MaterialTextFieldData({
    EdgeInsetsGeometry? padding,
    this.prefixIcon,
    this.prefixIconColor,
    this.prefixIconConstraints,
    this.suffixIcon,
    this.suffixIconColor,
    this.suffixIconConstraints,
    this.suffixStyle,
    this.suffixText,
    this.textFieldType,
  }) : _padding = padding;

  EdgeInsetsGeometry get padding => _padding ?? Const.inputPadding;

  _MaterialTextFieldData copyWith({
    EdgeInsetsGeometry? padding,
    Widget? prefixIcon,
    Color? prefixIconColor,
    BoxConstraints? prefixIconConstraints,
    Widget? suffixIcon,
    Color? suffixIconColor,
    BoxConstraints? suffixIconConstraints,
    TextStyle? suffixStyle,
    String? suffixText,
    TextFieldType? textFieldType,
  }) =>
      _MaterialTextFieldData(
        padding: padding ?? this.padding,
        prefixIcon: prefixIcon ?? this.prefixIcon,
        prefixIconColor: prefixIconColor ?? this.prefixIconColor,
        prefixIconConstraints: prefixIconConstraints ?? this.prefixIconConstraints,
        suffixIcon: suffixIcon ?? this.suffixIcon,
        suffixIconColor: suffixIconColor ?? this.suffixIconColor,
        suffixIconConstraints: suffixIconConstraints ?? this.suffixIconConstraints,
        suffixStyle: suffixStyle ?? this.suffixStyle,
        suffixText: suffixText ?? this.suffixText,
        textFieldType: textFieldType ?? this.textFieldType,
      );
}
