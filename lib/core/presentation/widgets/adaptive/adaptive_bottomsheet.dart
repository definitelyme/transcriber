library adaptive_bottomsheet.dart;

import 'package:transcriber/core/presentation/index.dart';
import 'package:transcriber/utils/utils.dart';
import 'package:flutter/material.dart';

enum _AdaptiveBottomSheetType { normal, column }

/// A stateless widget to render AdaptiveBottomSheet.
class AdaptiveBottomSheet extends StatelessWidget {
  final _AdaptiveBottomSheetType _type;

  final Widget? Function(Widget)? closeButton;
  final Color? backgroundColor;
  final double? backgroundOpacity;
  final double barHeight;
  final double barWidth;
  final Widget? child;
  final List<Widget>? children;
  final CrossAxisAlignment crossAxisAlignment;
  final double? gapBeforeBar;
  final double? gapBetweenBarAndContent;
  final MainAxisSize mainAxisSize;
  final bool safeAreaBottom;
  final bool? safeAreaTop;
  final bool showBar;
  final bool showCloseButton;
  final String? subtitle;
  final int? subtitleMaxLines;
  final EdgeInsetsGeometry? subtitlePadding;
  final TextStyle? subtitleStyle;
  final TextAlign? subtitleTextAlign;
  final String? title;
  final int? titleMaxLines;
  final EdgeInsetsGeometry? titlePadding;
  final TextStyle? titleStyle;
  final TextAlign? titleTextAlign;
  final Radius topRadius;
  final EdgeInsetsGeometry padding;

  const AdaptiveBottomSheet({
    Key? key,
    required this.child,
    this.backgroundColor,
    this.topRadius = const Radius.circular(24),
    this.safeAreaTop,
    this.safeAreaBottom = true,
    this.backgroundOpacity,
    this.showBar = true,
    this.gapBeforeBar,
    this.gapBetweenBarAndContent,
    this.barHeight = 0.006,
    this.barWidth = 0.2,
  })  : children = null,
        title = null,
        subtitle = null,
        titleMaxLines = null,
        subtitleMaxLines = null,
        closeButton = null,
        showCloseButton = false,
        titleStyle = null,
        subtitleStyle = null,
        titlePadding = null,
        titleTextAlign = null,
        subtitlePadding = null,
        subtitleTextAlign = null,
        padding = EdgeInsets.zero,
        mainAxisSize = MainAxisSize.min,
        crossAxisAlignment = CrossAxisAlignment.start,
        _type = _AdaptiveBottomSheetType.normal,
        super(key: key);

  const AdaptiveBottomSheet.column({
    Key? key,
    required this.children,
    this.title,
    this.subtitle,
    this.titlePadding,
    this.titleTextAlign,
    this.subtitlePadding,
    this.subtitleTextAlign,
    this.backgroundColor,
    this.topRadius = const Radius.circular(24),
    this.safeAreaTop,
    this.safeAreaBottom = true,
    this.backgroundOpacity,
    this.showBar = true,
    this.titleMaxLines,
    this.subtitleMaxLines,
    this.closeButton,
    this.showCloseButton = true,
    this.titleStyle,
    this.subtitleStyle,
    double? gapBeforeBar,
    EdgeInsetsGeometry? padding,
    this.gapBetweenBarAndContent,
    this.barHeight = 0.006,
    this.barWidth = 0.2,
    this.mainAxisSize = MainAxisSize.min,
    this.crossAxisAlignment = CrossAxisAlignment.stretch,
  })  : child = null,
        gapBeforeBar = gapBeforeBar ?? (showCloseButton ? 0.01 : 0),
        padding = padding ?? EdgeInsets.zero,
        _type = _AdaptiveBottomSheetType.column,
        super(key: key);

  Widget? get _closeButton {
    if (!showCloseButton && closeButton == null && showBar) return Center(child: _topBar);
    return showCloseButton && closeButton == null ? BottomsheetCloseButton(middle: _topBar) : closeButton?.call(_topBar);
  }

  Widget get _topBar => ClipRRect(
        borderRadius: BorderRadius.circular(Const.cardRadius),
        child: DecoratedBox(
          decoration: const BoxDecoration(color: Colors.grey),
          child: SizedBox(height: barHeight.h, width: barWidth.w),
        ),
      );

  bool get _safeAreaTop => safeAreaTop ?? Utils.isPlatform(material: false, cupertino: true)!;

  Color? _backgroundColor(BuildContext ctx) => backgroundOpacity == null
      ? (backgroundColor ?? Utils.resolveColor(Palette.elevatedOverlayLight, dark: Palette.elevatedOverlay07Dark))
      : (backgroundColor ?? Utils.resolveColor(Palette.elevatedOverlayLight, dark: Palette.elevatedOverlay07Dark))
          ?.withOpacity(backgroundOpacity!);

  Widget _child(BuildContext ctx) {
    return _type.when(
      normal: child ?? Utils.nothing,
      column: Padding(
        padding: padding,
        child: Column(
          mainAxisSize: mainAxisSize,
          crossAxisAlignment: crossAxisAlignment,
          children: <Widget>[
            if (gapBeforeBar != null) gapBeforeBar!.vsh,
            //
            if (_closeButton != null) _closeButton!,
            //
            if (gapBetweenBarAndContent != null) gapBetweenBarAndContent!.vsh,
            //
            if (title != null)
              Padding(
                padding: titlePadding ?? EdgeInsets.symmetric(horizontal: sidePadding).copyWith(bottom: 8),
                child: AdaptiveText(
                  title!,
                  maxLines: titleMaxLines,
                  textAlign: titleTextAlign,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  textColor: Utils.isDarkMode(ctx) && Utils.platform.isIOS ? Palette.onSurface100Dark : null,
                  style: titleStyle,
                ),
              ),
            //
            if (subtitle != null)
              Padding(
                padding: subtitlePadding ?? EdgeInsets.symmetric(horizontal: sidePadding).copyWith(bottom: 8),
                child: AdaptiveText(
                  subtitle!,
                  maxLines: subtitleMaxLines,
                  textAlign: subtitleTextAlign,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                  textColor: Utils.isDarkMode(ctx) && Utils.platform.isIOS ? Palette.onSurfaceDark : null,
                  style: subtitleStyle,
                ),
              ),
            //
            ...(children ?? const []),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      clipBehavior: Clip.antiAlias,
      scrollDirection: Axis.vertical,
      controller: ScrollController(),
      physics: const ClampingScrollPhysics(),
      padding: MediaQuery.of(context).viewInsets,
      reverse: true,
      child: WidgetFocus(
        unfocus: false,
        child: Material(
          color: _backgroundColor(context),
          borderRadius: BorderRadius.only(topLeft: topRadius, topRight: topRadius),
          child: _safeAreaTop || safeAreaBottom
              ? SafeArea(top: _safeAreaTop, left: false, right: false, bottom: safeAreaBottom, child: _child(context))
              : _child(context),
        ),
      ),
    );
  }
}

extension on _AdaptiveBottomSheetType {
  T when<T>({
    required T normal,
    required T column,
  }) {
    switch (this) {
      case _AdaptiveBottomSheetType.column:
        return column;
      case _AdaptiveBottomSheetType.normal:
      default:
        return normal;
    }
  }
}
