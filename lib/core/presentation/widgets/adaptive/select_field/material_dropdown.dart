part of 'adaptive_dropdown.dart';

class _MaterialDropdown<Model> extends StatelessWidget {
  final String? Function(Model?)? text;
  final Widget? Function(Model?)? child;
  final List<Widget> Function(BuildContext)? selectedItemBuilder;
  final String? Function(Model?)? errorText;
  final bool alignedDropdown;
  final AlignmentDirectional alignment;
  final Color? backgroundColorDark;
  final Color? backgroundColorLight;
  final InputBorder? border;
  final Color? borderColorDark;
  final Color? borderColorLight;
  final BorderRadius? borderRadius;
  final Color? buttonColor;
  final ColorScheme? colorScheme;
  final EdgeInsetsGeometry? contentPadding;
  final InputDecoration? decoration;
  final double diameterRatio;
  final bool disabled;
  final String disabledHint;
  final Widget? disabledHintWidget;
  final Color? dropdownColor;
  final int elevation;
  final InputBorder? errorBorder;
  final InputBorder? focusedBorder;
  final InputBorder? focusedErrorBorder;
  final Model groupValue;
  final double? height;
  final Color? highlightColor;
  final String hint;
  final Color? hintColor;
  final double? hintFontSize;
  final FontWeight? hintFontWeight;
  final Widget? hintWidget;
  final IconData? icon;
  final Color? iconDisabledColor;
  final Color? iconEnabledColor;
  final double iconSize;
  final bool isDense;
  final bool isExpanded;
  final double? itemFontSize;
  final FontWeight? itemFontWeight;
  final List<Model> items;
  final bool looping;
  //
  final double magnification;

  final int maxLines;
  final double? menuMaxHeight;
  final double offAxisFraction;
  final void Function(Model?) onChanged;
  final PlatformType? platform;
  final double? radius;
  final Widget? selectionOverlay;
  final ShapeBorder? shape;
  final Color? splashColor;
  final bool useMagnifier;
  final bool validate;

  const _MaterialDropdown({
    Key? key,
    this.radius,
    required this.items,
    this.text,
    this.child,
    this.hint = '-- Choose --',
    this.hintWidget,
    this.disabledHint = '-- Invalid selection --',
    this.disabledHintWidget,
    required this.groupValue,
    this.validate = false,
    this.errorText,
    this.disabled = false,
    this.iconSize = 19.0,
    this.isDense = false,
    this.isExpanded = true,
    this.alignedDropdown = false,
    required this.onChanged,
    this.maxLines = 1,
    this.buttonColor,
    this.itemFontSize,
    this.itemFontWeight,
    this.highlightColor,
    this.backgroundColorLight,
    this.backgroundColorDark,
    this.borderColorLight,
    this.borderColorDark,
    this.hintColor,
    this.hintFontSize,
    this.hintFontWeight,
    this.colorScheme,
    this.splashColor,
    this.border,
    this.errorBorder,
    this.focusedBorder,
    this.focusedErrorBorder,
    this.shape,
    this.contentPadding,
    this.alignment = AlignmentDirectional.centerStart,
    this.borderRadius,
    this.elevation = 8,
    this.dropdownColor,
    this.height,
    this.icon,
    this.iconDisabledColor,
    this.iconEnabledColor,
    this.menuMaxHeight,
    this.decoration,
    this.selectedItemBuilder,
    this.magnification = 1.0,
    this.looping = false,
    this.useMagnifier = true,
    this.diameterRatio = 1.07,
    this.offAxisFraction = 0.0,
    this.platform,
    this.selectionOverlay = const CupertinoPickerDefaultSelectionOverlay(),
  }) : super(key: key);

  TextStyle get _disabledTextStyle => _textStyle.copyWith(color: Palette.disabledColor);
  TextStyle get _errorTextStyle => _textStyle.copyWith(color: Palette.errorRed, fontSize: 12);
  bool get _hasErrors => validate && errorText?.call(groupValue) != null;
  TextStyle get _hintTextStyle => _textStyle.copyWith(
        fontSize: hintFontSize,
        fontWeight: hintFontWeight ?? FontWeight.w400,
        color: hintColor ?? Utils.resolveColor(Palette.onSurfaceLight.withOpacity(0.3), dark: Palette.onSurfaceDark.withOpacity(0.5)),
      );

  // PlatformType get _platform => platform ?? Utils.isPlatform(material: PlatformType.android, cupertino: PlatformType.ios)!;

  TextStyle get _textStyle =>
      TextStyle(color: Palette.onSurface, fontSize: itemFontSize ?? 14, fontWeight: itemFontWeight ?? FontWeight.w600);

  String? _text(Model? item) {
    if (item != null) {
      if (text != null) {
        return text?.call(item);
      } else {
        return _kPlaceholder;
      }
    } else {
      return hint;
    }
  }

  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxHeight: height ?? AdaptiveDropdown.kdropdownHeight,
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: alignedDropdown,
          layoutBehavior: ButtonBarLayoutBehavior.constrained,
          materialTapTargetSize: MaterialTapTargetSize.padded,
          buttonColor: buttonColor,
          highlightColor: highlightColor,
          splashColor: splashColor,
          colorScheme: colorScheme,
          shape: shape ??
              RoundedRectangleBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(radius ?? Const.inputBorderRadius),
                side: BorderSide(
                  color: Utils.resolveColor(
                    borderColorLight ?? Palette.inputBorderColorLight,
                    dark: borderColorDark ?? borderColorLight ?? Palette.inputBorderColorDark,
                    ctx: context,
                  )!,
                ),
              ),
          child: DropdownButtonFormField<Model?>(
            autovalidateMode: validate ? AutovalidateMode.always : AutovalidateMode.disabled,
            decoration: InputDecoration(
              border: border,
              focusedBorder: focusedBorder,
              errorBorder: errorBorder,
              focusedErrorBorder: focusedErrorBorder,
              hintStyle: _hintTextStyle,
              errorStyle: _errorTextStyle,
              contentPadding: contentPadding?.let(
                    (it) => AdaptiveDropdown.kdropdownContentPadding.add(it),
                  ) ??
                  AdaptiveDropdown.kdropdownContentPadding,
            ).merge(decoration),
            alignment: alignment,
            elevation: elevation,
            dropdownColor: dropdownColor,
            isDense: isDense,
            itemHeight: kMinInteractiveDimension,
            validator: (it) => _hasErrors ? errorText?.call(groupValue) : null,
            iconDisabledColor: iconDisabledColor,
            iconEnabledColor: iconEnabledColor,
            menuMaxHeight: menuMaxHeight,
            selectedItemBuilder: (_) => items
                .map((iv) =>
                    child?.call(iv) ??
                    Align(
                      alignment: Alignment.centerLeft,
                      child: AdaptiveText(
                        '${_text(iv)}',
                        maxLines: maxLines,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        fontSize: itemFontSize,
                        fontWeight: itemFontWeight,
                      ),
                    ))
                .toList(),
            items: items
                .map(
                  (item) => DropdownMenuItem<Model?>(
                    value: item,
                    alignment: Alignment.centerLeft,
                    enabled: !disabled,
                    child: child?.call(item) ??
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 2,
                              child: AdaptiveText(
                                '${_text(item)}',
                                maxLines: maxLines,
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                                fontSize: itemFontSize,
                                fontWeight: itemFontWeight,
                              ),
                            ),
                            if (item == groupValue)
                              Icon(
                                Icons.check_circle,
                                size: 20,
                                color: iconEnabledColor ?? Palette.primaryColor.shade400,
                              ),
                          ],
                        ),
                  ),
                )
                .toList(),
            disabledHint: disabledHintWidget ??
                Align(
                  alignment: Alignment.centerLeft,
                  child: AdaptiveText(
                    disabledHint,
                    maxLines: 1,
                    fontSize: itemFontSize,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    style: _disabledTextStyle,
                  ),
                ),
            hint: hintWidget ??
                Align(
                  alignment: Alignment.centerLeft,
                  child: AdaptiveText(
                    hint,
                    maxLines: 1,
                    fontSize: hintFontSize,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: hintFontWeight,
                    softWrap: true,
                    textColor: hintColor,
                    textColorDark: hintColor,
                    style: _hintTextStyle,
                  ),
                ),
            value: groupValue,
            // isExpanded: isExpanded,
            icon: Icon(icon ?? Icons.keyboard_arrow_down),
            iconSize: iconSize,
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }
}
