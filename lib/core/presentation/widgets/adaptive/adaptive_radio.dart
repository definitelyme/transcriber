library adaptive_radio.dart;

import 'package:transcriber/Core/presentation/index.dart';
import 'package:transcriber/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

typedef _StringBuilder<T> = String? Function(T?);

const _nullStringValue = '-- Invalid! [Property is null] --';

/// A stateless widget to render AdaptiveRadioList.
class AdaptiveRadioList<T> extends StatelessWidget {
  final Color? activeColor;
  final _StringBuilder<T> builder;
  final bool enabled;
  final Color? fillColor;
  final Color? focusColor;
  final FocusNode? focusNode;
  final Color? hoverColor;
  final Color? inActiveColor;
  final List<T> items;
  final MaterialTapTargetSize? materialTapTargetSize;
  final ValueChanged<T?>? onChanged;
  final MaterialStateProperty<Color?>? overlayColor;
  final PlatformType? platform;
  final T? selected;
  final double? splashRadius;
  final VisualDensity? visualDensity;

  const AdaptiveRadioList({
    Key? key,
    this.activeColor,
    required this.builder,
    this.enabled = true,
    this.fillColor,
    this.focusColor,
    this.focusNode,
    this.hoverColor,
    this.inActiveColor,
    required this.items,
    this.materialTapTargetSize,
    required this.onChanged,
    this.overlayColor,
    this.platform,
    this.selected,
    this.splashRadius,
    this.visualDensity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10.0,
      runSpacing: 5.0,
      children: items
          .map(
            (e) => AdaptiveRadio<T>(
              value: e,
              builder: builder,
              groupValue: selected,
              onChanged: onChanged,
              activeColor: activeColor,
              enabled: enabled,
              fillColor: fillColor,
              focusColor: focusColor,
              focusNode: focusNode,
              hoverColor: hoverColor,
              materialTapTargetSize: materialTapTargetSize,
              overlayColor: overlayColor,
              splashRadius: splashRadius,
              visualDensity: visualDensity,
              platform: platform,
              inActiveColor: inActiveColor,
            ),
          )
          .toList(),
    );
  }
}

/// A stateless widget to render AdaptiveRadio.
class AdaptiveRadio<T> extends StatelessWidget {
  final Color? activeColor;
  final _StringBuilder<T> builder;
  final bool enabled;
  final Color? fillColor;
  final Color? focusColor;
  final FocusNode? focusNode;
  final T? groupValue;
  final Color? hoverColor;
  final Color? inActiveColor;
  final MaterialTapTargetSize? materialTapTargetSize;
  final ValueChanged<T?>? onChanged;
  final MaterialStateProperty<Color?>? overlayColor;
  final PlatformType? platform;
  final double? splashRadius;
  final T value;
  final VisualDensity? visualDensity;

  const AdaptiveRadio({
    Key? key,
    this.activeColor,
    required this.builder,
    this.enabled = true,
    this.fillColor,
    this.focusColor,
    this.focusNode,
    required this.groupValue,
    this.hoverColor,
    this.inActiveColor,
    this.materialTapTargetSize,
    required this.onChanged,
    this.overlayColor,
    this.platform,
    this.splashRadius,
    required this.value,
    this.visualDensity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformBuilder.builder(
      platform: platform,
      material: (c) => _MaterialRadioChoice<T>(
        value: value,
        builder: builder,
        onChanged: onChanged,
        child: Radio<T>(
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
          activeColor: activeColor,
          fillColor: MaterialStateProperty.resolveWith((st) {
            if (st.toList(growable: false).firstOrNull() == MaterialState.selected) return fillColor;
            return inActiveColor;
          }),
          visualDensity: visualDensity,
          focusColor: focusColor,
          hoverColor: hoverColor,
          overlayColor: overlayColor,
          splashRadius: splashRadius,
          focusNode: focusNode,
          materialTapTargetSize: materialTapTargetSize,
        ),
      ),
      cupertino: (c) => CupertinoRadioChoice(
        groupValue: groupValue,
        onChanged: onChanged,
        value: value,
        builder: builder,
        enabled: enabled,
        selectedColor: activeColor,
        unSelectedColor: inActiveColor,
      ),
    );
  }
}

class CupertinoRadioChoice<T> extends StatefulWidget {
  final _StringBuilder<T> builder;

  /// Defines if the widget shall be enabled (clickable) or not
  final bool enabled;

  /// Contains a map which defines which choices shall be displayed (key => value).
  /// Values are the values displyed in the choices
  final T? groupValue;

  /// Function is called if the user selects another choice
  final ValueChanged<T?>? onChanged;

  /// The color of the selected radio choice
  final Color? selectedColor;

  /// The color of the not selected radio choice(s)
  final Color? unSelectedColor;

  /// Defines which choice shall be selected initally by key
  final T value;

  const CupertinoRadioChoice({
    Key? key,
    required this.groupValue,
    required this.onChanged,
    required this.value,
    required this.builder,
    this.selectedColor,
    this.unSelectedColor,
    this.enabled = true,
  }) : super(key: key);

  @override
  _CupertinoRadioChoiceState<T> createState() => _CupertinoRadioChoiceState();
}

/// State of the widget
class _CupertinoRadioChoiceState<T> extends State<CupertinoRadioChoice<T>> {
  T? _selectedValue;

  @override
  void didUpdateWidget(CupertinoRadioChoice<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.groupValue != oldWidget.groupValue || widget.value != oldWidget.value) {
      _selectedValue = widget.groupValue;
    }
  }

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.groupValue;
  }

  bool get checked => widget.value == _selectedValue;
  Color get selectedColor => widget.selectedColor ?? CupertinoColors.systemBlue;
  Color get unSelectedColor => widget.unSelectedColor ?? CupertinoColors.inactiveGray;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      disabledColor: widget.enabled ? selectedColor : unSelectedColor,
      color: checked ? selectedColor : unSelectedColor,
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      padding: const EdgeInsets.all(10.0),
      onPressed: !widget.enabled || _selectedValue == widget.value
          ? null
          : () {
              setState(() => _selectedValue = widget.value);
              widget.onChanged?.call(widget.value);
            },
      child: AdaptiveText(
        widget.builder(widget.value) ?? _nullStringValue,
        fontSize: 15,
        fontWeight: FontWeight.w400,
        textColor: Palette.onPrimary,
        textColorDark: Palette.onPrimary,
      ),
    );
  }
}

class _MaterialRadioChoice<T> extends StatefulWidget {
  final _StringBuilder<T> builder;
  final Radio<T> child;
  final ValueChanged<T?>? onChanged;
  final T value;

  const _MaterialRadioChoice({
    Key? key,
    required this.builder,
    required this.child,
    required this.onChanged,
    required this.value,
  }) : super(key: key);

  @override
  State<_MaterialRadioChoice<T>> createState() => __MaterialRadioChoiceState();
}

class __MaterialRadioChoiceState<T> extends State<_MaterialRadioChoice<T>> {
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          widget.child,
          //
          GestureDetector(
            onTap: () => widget.onChanged?.call(widget.value),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 2.0),
              child: AdaptiveText(
                widget.builder(widget.value) ?? _nullStringValue,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
