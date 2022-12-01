library adaptive_dropdown.dart;

import 'package:transcriber/Core/presentation/index.dart';
import 'package:transcriber/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

part 'cupertino_picker.dart';
part 'material_dropdown.dart';

const _kPlaceholder = "- Set 'text' property -";

class AdaptiveDropdown<Model> extends StatelessWidget {
  static const double kErrorHeightDiff = 21;
  static const EdgeInsetsGeometry kdropdownContentPadding = EdgeInsets.symmetric(vertical: 7.0, horizontal: 12.0);
  static const double kdropdownHeight = 46;

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
  final double magnification;
  //
  final int maxLines;

  final double? menuMaxHeight;
  final double offAxisFraction;
  final void Function(Model?) onChanged;
  final double? pickerHeight;
  final PlatformType? platform;
  final double? radius;
  final Widget? selectionOverlay;
  final ShapeBorder? shape;
  final Color? splashColor;
  final bool useMagnifier;
  final bool validate;

  const AdaptiveDropdown({
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
    this.pickerHeight,
    this.magnification = 1.0,
    this.looping = false,
    this.useMagnifier = true,
    this.diameterRatio = 1.07,
    this.offAxisFraction = 0.0,
    this.selectionOverlay = const CupertinoPickerDefaultSelectionOverlay(),
    this.platform,
  }) : super(key: key);

  bool get _hasError => errorText?.call(groupValue) != null && validate;
  double get _height => _hasError && !Utils.platform.isIOS
      ? height != null
          ? height! + AdaptiveDropdown.kErrorHeightDiff
          : AdaptiveDropdown.kdropdownHeight + AdaptiveDropdown.kErrorHeightDiff
      : height ?? AdaptiveDropdown.kdropdownHeight;

  String? get _text {
    if (groupValue != null) {
      if (text != null) {
        return text?.call(groupValue) ?? (items.isEmpty ? disabledHint : hint);
      } else {
        return _kPlaceholder;
      }
    } else {
      return items.isEmpty ? disabledHint : hint;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Disabled(
      disabled: disabled,
      child: PlatformBuilder(
        material: _MaterialDropdown(
          child: child,
          hint: hint,
          hintWidget: hintWidget,
          disabledHint: disabledHint,
          disabledHintWidget: disabledHintWidget,
          text: text,
          items: items,
          groupValue: groupValue,
          onChanged: onChanged,
          disabled: disabled,
          iconSize: iconSize,
          isDense: isDense,
          isExpanded: isExpanded,
          alignedDropdown: alignedDropdown,
          buttonColor: buttonColor,
          itemFontSize: itemFontSize,
          itemFontWeight: itemFontWeight,
          highlightColor: highlightColor,
          backgroundColorLight: backgroundColorLight,
          backgroundColorDark: backgroundColorDark,
          hintColor: hintColor,
          hintFontSize: hintFontSize,
          hintFontWeight: hintFontWeight,
          borderColorLight: borderColorLight,
          borderColorDark: borderColorDark,
          colorScheme: colorScheme,
          splashColor: splashColor,
          border: border,
          errorBorder: errorBorder,
          focusedBorder: focusedBorder,
          focusedErrorBorder: focusedErrorBorder,
          shape: shape,
          contentPadding: contentPadding,
          alignment: alignment,
          borderRadius: borderRadius,
          elevation: elevation,
          dropdownColor: dropdownColor,
          height: _height,
          icon: icon,
          iconDisabledColor: iconDisabledColor,
          iconEnabledColor: iconEnabledColor,
          menuMaxHeight: menuMaxHeight,
          decoration: decoration,
          selectedItemBuilder: selectedItemBuilder,
          magnification: magnification,
          looping: looping,
          useMagnifier: useMagnifier,
          diameterRatio: diameterRatio,
          offAxisFraction: offAxisFraction,
          selectionOverlay: selectionOverlay,
          errorText: errorText,
          maxLines: maxLines,
          radius: radius,
          validate: validate,
          platform: platform,
        ),
        cupertino: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxHeight: _height),
                child: Row(
                  children: [
                    if (decoration?.prefixIcon != null) decoration!.prefixIcon!,
                    //
                    Flexible(
                      child: Material(
                        shape: shape ??
                            (borderRadius == null
                                ? RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(Const.inputBorderRadius),
                                    side: BorderSide(
                                      color: _hasError
                                          ? Palette.errorRed
                                          : Utils.resolveColor(
                                              borderColorLight ?? Palette.inputBorderColorLight,
                                              dark: borderColorDark ?? borderColorLight ?? Palette.inputBorderColorDark,
                                              ctx: context,
                                            )!,
                                      width: 1.0,
                                    ),
                                  )
                                : null),
                        color: Utils.resolveColor(backgroundColorLight ?? CupertinoColors.extraLightBackgroundGray,
                            dark: backgroundColorDark ?? Palette.inputBgColorDark),
                        borderRadius: borderRadius,
                        child: InkWell(
                          onTap: () async {
                            if (disabled || items.isEmpty) return;
                            //
                            final result = await Utils.showAdaptiveBottomSheet<Model?>(
                              context,
                              // isDismissible: false,
                              useRootNavigator: false,
                              builder: (_) => _CupertinoPicker(
                                items: items,
                                groupValue: groupValue,
                                itemFontSize: itemFontSize,
                                itemFontWeight: itemFontWeight,
                                maxLines: maxLines,
                                useMagnifier: useMagnifier,
                                magnification: magnification,
                                diameterRatio: diameterRatio,
                                dropdownColor: dropdownColor,
                                offAxisFraction: offAxisFraction,
                                looping: looping,
                                selectionOverlay: selectionOverlay,
                                backgroundColorLight: backgroundColorLight,
                                backgroundColorDark: backgroundColorDark,
                                onSelectedChanged: onChanged,
                                height: pickerHeight,
                                text: text,
                                child: child,
                              ),
                            );

                            if (result != null) onChanged(result);
                          },
                          borderRadius: Const.inputBorderRadius.br,
                          // customBorder: Border.all(
                          //   width: 1,
                          //   color: _hasError
                          //       ? Palette.errorRed
                          //       : Utils.resolveColor(
                          //           borderColorLight ?? Palette.inputBorderColorLight,
                          //           dark: borderColorDark ?? borderColorLight ?? Palette.inputBorderColorDark,
                          //           ctx: context,
                          //         )!,
                          // ),
                          highlightColor: Utils.resolveColor(
                            backgroundColorLight ?? Palette.inputBgColorLight,
                            dark: backgroundColorDark ?? Palette.inputBgColorDark,
                            ctx: context,
                          ),
                          child: DropdownMenuItem<Model?>(
                            value: groupValue,
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: contentPadding?.let((it) => AdaptiveDropdown.kdropdownContentPadding.add(it)) ??
                                  AdaptiveDropdown.kdropdownContentPadding,
                              child: child?.call(groupValue) ??
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: AdaptiveText(
                                          '$_text',
                                          maxLines: maxLines,
                                          softWrap: false,
                                          fontSize: groupValue == null ? hintFontSize : (itemFontSize ?? 14),
                                          fontWeight: groupValue == null ? hintFontWeight : itemFontWeight,
                                          textColor: groupValue == null ? hintColor : null,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      //
                                      Icon(
                                        icon ?? CupertinoIcons.chevron_down,
                                        size: iconSize,
                                        color: (disabled ? iconDisabledColor : iconEnabledColor) ??
                                            Utils.resolveColor(Palette.iconLight, dark: Palette.iconDark),
                                      ),
                                    ],
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //
            if (_hasError)
              AdaptiveText(
                '${errorText?.call(groupValue)}',
                maxLines: 1,
                softWrap: false,
                fontSize: 15,
                textColor: Palette.errorRed,
                overflow: TextOverflow.ellipsis,
              ),
          ],
        ),
      ),
    );
  }
}
