library adaptive_list_tile.dart;

import 'package:transcriber/Core/presentation/index.dart';
import 'package:cupertino_list_tile/cupertino_list_tile.dart';
import 'package:enough_platform_widgets/enough_platform_widgets.dart' show CupertinoCheckboxListTile;
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

enum AdaptiveListTileType { normal, switchType, selectable }

/// A stateless widget to render AdaptiveListTile.
class AdaptiveListTile extends StatelessWidget {
  final Key? widgetKey;

  final AdaptiveListTileType _type;

  final void Function(bool?)? onChanged;
  final Color? activeColor;
  final Color? checkColor;
  final ImageProvider<Object>? activeThumbImage;
  final Color? activeTrackColor;
  final bool autofocus;
  final BorderSide border;
  final BorderRadius borderRadius;
  final EdgeInsets? contentPadding;
  final ListTileControlAffinity? controlAffinity;
  final bool cupertino;
  final ShapeBorder? cupertinoBorder;
  final Color cupertinoPressedColor;
  final bool? dense;
  final DragStartBehavior? dragStartBehavior;
  final bool? enableFeedback;
  final bool enabled;
  final Color? focusColor;
  final FocusNode? focusNode;
  final double? horizontalTitleGap;
  final Color? hoverColor;
  final Color? inactiveThumbColor;
  final ImageProvider<Object>? inactiveThumbImage;
  final Color? inactiveTrackColor;
  final bool isThreeLine;
  final Widget? leading;
  // List tile type
  final bool material;

  final double? minLeadingWidth;
  final double? minVerticalPadding;
  final MouseCursor? mouseCursor;
  final bool noCupertinoBorder;
  final VoidCallback? onLongPress;
  final VoidCallback? onTap;
  final Widget? secondary;
  final Color? thumbColor;
  final bool selected;
  final Color? selectedTileColor;
  final ShapeBorder? shape;
  final Widget? subtitle;
  final Color? tileColor;
  final Widget? title;
  final Color? cupertinoTrackColor;
  final Widget? trailing;
  final OutlinedBorder? checkBoxShape;
  // Switch
  final bool value;

  final VisualDensity? visualDensity;

  const AdaptiveListTile({
    Key? key,
    this.widgetKey,
    bool? value,
    this.onChanged,
    this.autofocus = false,
    this.contentPadding,
    this.dense,
    this.enableFeedback,
    this.enabled = true,
    this.focusColor,
    this.focusNode,
    this.horizontalTitleGap,
    this.hoverColor,
    this.isThreeLine = false,
    this.leading,
    this.minLeadingWidth,
    this.minVerticalPadding,
    this.mouseCursor,
    this.onLongPress,
    this.onTap,
    this.selected = false,
    this.thumbColor,
    this.selectedTileColor,
    this.shape,
    this.subtitle,
    this.title,
    this.tileColor,
    this.cupertinoTrackColor,
    this.activeColor,
    this.checkColor,
    this.activeThumbImage,
    this.activeTrackColor,
    ListTileControlAffinity? controlAffinity,
    this.inactiveThumbColor,
    this.inactiveThumbImage,
    this.inactiveTrackColor,
    this.secondary,
    this.dragStartBehavior,
    this.trailing,
    this.visualDensity,
    this.checkBoxShape,
    this.borderRadius = BorderRadius.zero,
    this.border = BorderSide.none,
    this.cupertinoPressedColor = CupertinoColors.systemFill,
    this.cupertinoBorder,
    this.material = false,
    this.cupertino = false,
    this.noCupertinoBorder = false,
    AdaptiveListTileType? type,
  })  : _type = type ?? AdaptiveListTileType.normal,
        controlAffinity = controlAffinity ?? ListTileControlAffinity.platform,
        value = value ?? false,
        assert((material && !cupertino) || (!material || cupertino) || (!material || !cupertino)),
        assert(
            type != AdaptiveListTileType.selectable || (type == AdaptiveListTileType.selectable && (value != null || onChanged != null))),
        super(key: key);

  const AdaptiveListTile.adaptiveSwitch({
    Key? key,
    this.widgetKey,
    required this.value,
    required this.onChanged,
    this.activeColor,
    this.activeThumbImage,
    this.activeTrackColor,
    this.autofocus = false,
    this.contentPadding,
    this.controlAffinity = ListTileControlAffinity.platform,
    this.dense,
    this.inactiveThumbColor,
    this.inactiveThumbImage,
    this.inactiveTrackColor,
    this.isThreeLine = false,
    this.secondary,
    this.selected = false,
    this.thumbColor,
    this.selectedTileColor,
    this.shape,
    this.subtitle,
    this.title,
    this.tileColor,
    this.cupertinoTrackColor,
    this.borderRadius = BorderRadius.zero,
    this.border = BorderSide.none,
    this.dragStartBehavior = DragStartBehavior.start,
    this.material = false,
    this.cupertino = false,
    this.noCupertinoBorder = false,
  })  : _type = AdaptiveListTileType.switchType,
        enableFeedback = null,
        checkColor = null,
        enabled = true,
        focusColor = null,
        focusNode = null,
        horizontalTitleGap = null,
        hoverColor = null,
        leading = null,
        minLeadingWidth = null,
        minVerticalPadding = null,
        mouseCursor = null,
        onLongPress = null,
        onTap = null,
        trailing = null,
        visualDensity = null,
        checkBoxShape = null,
        cupertinoPressedColor = CupertinoColors.systemFill,
        cupertinoBorder = null,
        assert((material && !cupertino) || (!material || cupertino) || (!material || !cupertino)),
        super(key: key);

  const AdaptiveListTile.selectable({
    Key? key,
    this.widgetKey,
    required this.value,
    required this.onChanged,
    this.activeColor,
    this.autofocus = false,
    this.contentPadding,
    this.controlAffinity = ListTileControlAffinity.platform,
    this.dense,
    this.secondary,
    this.selected = false,
    this.selectedTileColor,
    this.shape,
    this.subtitle,
    this.title,
    this.tileColor,
    this.checkColor,
    this.checkBoxShape,
    this.borderRadius = BorderRadius.zero,
    this.border = BorderSide.none,
    this.dragStartBehavior = DragStartBehavior.start,
    this.material = false,
    this.cupertino = false,
    this.noCupertinoBorder = false,
  })  : _type = AdaptiveListTileType.selectable,
        enableFeedback = null,
        cupertinoTrackColor = null,
        thumbColor = null,
        inactiveThumbColor = null,
        inactiveThumbImage = null,
        inactiveTrackColor = null,
        activeTrackColor = null,
        activeThumbImage = null,
        isThreeLine = false,
        enabled = true,
        focusColor = null,
        focusNode = null,
        horizontalTitleGap = null,
        hoverColor = null,
        leading = null,
        minLeadingWidth = null,
        minVerticalPadding = null,
        mouseCursor = null,
        onLongPress = null,
        onTap = null,
        trailing = null,
        visualDensity = null,
        cupertinoPressedColor = CupertinoColors.systemFill,
        cupertinoBorder = null,
        assert((material && !cupertino) || (!material || cupertino) || (!material || !cupertino)),
        super(key: key);

  Color get _inactiveThumbColor => inactiveThumbColor ?? Colors.grey;
  Color get _inactiveTrackColor => inactiveTrackColor ?? Colors.grey.shade300;

  Widget cupertinoTiles(BuildContext context) => _type.fold(
        normal: () => ClipRRect(
          borderRadius: borderRadius,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: tileColor != null ? CupertinoDynamicColor.resolve(tileColor ?? CupertinoColors.systemBackground, context) : null,
              border: Border(top: border, bottom: border, right: border, left: border),
              borderRadius: borderRadius,
            ),
            child: CupertinoListTile(
              key: widgetKey,
              autofocus: autofocus,
              contentPadding: contentPadding,
              dense: dense,
              enabled: enabled,
              focusColor: focusColor,
              focusNode: focusNode,
              hoverColor: hoverColor,
              isThreeLine: isThreeLine,
              leading: leading,
              mouseCursor: mouseCursor,
              onLongPress: onLongPress,
              onTap: onTap,
              selected: selected,
              subtitle: subtitle,
              title: title,
              trailing: trailing,
              border: noCupertinoBorder ? const Border.fromBorderSide(BorderSide.none) : cupertinoBorder,
              pressColor: cupertinoPressedColor,
            ),
          ),
        ),
        switchType: () => CupertinoFormRow(
          padding: EdgeInsets.zero,
          child: MergeSemantics(
            child: CupertinoListTile(
              key: widgetKey,
              autofocus: autofocus,
              contentPadding: contentPadding,
              dense: dense,
              enabled: enabled,
              focusColor: focusColor,
              focusNode: focusNode,
              hoverColor: hoverColor,
              isThreeLine: isThreeLine,
              leading: leading ?? secondary,
              selected: selected,
              subtitle: subtitle,
              title: title,
              border: noCupertinoBorder ? const Border.fromBorderSide(BorderSide.none) : cupertinoBorder,
              onTap: onTap,
              mouseCursor: mouseCursor,
              onLongPress: onLongPress,
              pressColor: cupertinoPressedColor,
              trailing: CupertinoSwitch(
                key: widgetKey,
                value: value,
                onChanged: onChanged!,
                activeColor: activeColor,
                thumbColor: thumbColor,
                trackColor: cupertinoTrackColor,
                dragStartBehavior: dragStartBehavior!,
              ),
            ),
          ),
        ),
        selectable: () => DecoratedBox(
          decoration: BoxDecoration(color: tileColor, borderRadius: borderRadius),
          child: Material(
            type: MaterialType.transparency,
            child: CupertinoCheckboxListTile(
              value: value,
              onChanged: onChanged,
              contentPadding: contentPadding,
              activeColor: activeColor,
              title: title,
              subtitle: subtitle,
              selected: selected,
              checkColor: checkColor ?? activeColor,
            ),
          ),
        ),
      );

  Widget get materialTiles => _type.fold(
        normal: () => ListTile(
          key: widgetKey,
          autofocus: autofocus,
          contentPadding: contentPadding,
          dense: dense,
          enableFeedback: enableFeedback,
          enabled: enabled,
          focusColor: focusColor,
          focusNode: focusNode,
          horizontalTitleGap: horizontalTitleGap,
          selectedColor: selectedTileColor,
          hoverColor: hoverColor,
          isThreeLine: isThreeLine,
          leading: leading,
          minLeadingWidth: minLeadingWidth,
          minVerticalPadding: minVerticalPadding,
          mouseCursor: mouseCursor,
          onLongPress: onLongPress,
          onTap: onTap,
          selected: selected,
          selectedTileColor: selectedTileColor,
          shape: shape,
          subtitle: subtitle,
          tileColor: tileColor,
          title: title,
          trailing: trailing,
          visualDensity: visualDensity,
        ),
        switchType: () => SwitchListTile(
          key: widgetKey,
          value: value,
          onChanged: onChanged!,
          activeColor: activeColor,
          activeThumbImage: activeThumbImage,
          activeTrackColor: activeTrackColor,
          hoverColor: hoverColor,
          enableFeedback: enableFeedback,
          focusNode: focusNode,
          visualDensity: visualDensity,
          autofocus: autofocus,
          contentPadding: contentPadding,
          controlAffinity: controlAffinity!,
          dense: dense,
          inactiveThumbColor: _inactiveThumbColor,
          inactiveThumbImage: inactiveThumbImage,
          inactiveTrackColor: _inactiveTrackColor,
          isThreeLine: isThreeLine,
          secondary: secondary,
          selected: selected,
          selectedTileColor: selectedTileColor,
          shape: shape,
          subtitle: subtitle,
          title: title,
          tileColor: tileColor,
        ),
        selectable: () => DecoratedBox(
          decoration: BoxDecoration(color: tileColor, borderRadius: borderRadius),
          child: Material(
            type: MaterialType.transparency,
            child: CheckboxListTile(
              value: value,
              dense: dense,
              autofocus: autofocus,
              enableFeedback: enableFeedback,
              onChanged: onChanged,
              controlAffinity: controlAffinity!,
              contentPadding: contentPadding,
              activeColor: activeColor,
              title: title,
              isThreeLine: isThreeLine,
              subtitle: subtitle,
              tileColor: tileColor,
              visualDensity: visualDensity,
              secondary: trailing,
              selected: selected,
              selectedTileColor: selectedTileColor,
              checkColor: activeColor,
              checkboxShape: checkBoxShape,
              focusNode: focusNode,
              shape: shape,
              // side: BorderSide(color: border.color, width: border.width),
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    if (material)
      return ClipRRect(
        borderRadius: borderRadius,
        child: Material(
          elevation: 0.0,
          type: MaterialType.transparency,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius,
            side: border,
          ),
          child: materialTiles,
        ),
      );
    if (cupertino) return cupertinoTiles(context);

    return PlatformBuilder(
      material: ClipRRect(borderRadius: borderRadius, child: materialTiles),
      cupertino: cupertinoTiles(context),
    );
  }
}

extension on AdaptiveListTileType {
  T fold<T>({
    T Function()? switchType,
    T Function()? selectable,
    required T Function() normal,
  }) {
    switch (this) {
      case AdaptiveListTileType.switchType:
        return switchType != null ? switchType() : normal.call();
      case AdaptiveListTileType.selectable:
        return selectable != null ? selectable() : normal.call();
      case AdaptiveListTileType.normal:
      default:
        return normal.call();
    }
  }
}
