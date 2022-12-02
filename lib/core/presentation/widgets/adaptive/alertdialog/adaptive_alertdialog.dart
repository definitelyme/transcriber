import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:transcriber/core/presentation/index.dart';
import 'package:transcriber/managers/theme/theme.dart';

import 'package:transcriber/utils/utils.dart';

part 'alertdialog_button_configuration.dart';

/// A stateless widget to render AdaptiveAlertdialog.
class AdaptiveAlertdialog<E extends Object?> extends StatelessWidget {
  final double _width;

  final double? maxHeight;
  final List<Widget>? body;
  final Axis buttonDirection;
  final String? content;
  final MainAxisAlignment contentMainAxisAlignment;
  final CrossAxisAlignment contentCrossAxisAlignment;
  final double? titleFontSize;
  final int titleMaxLines;
  final double? titleMaxFontSize;
  final double? contentFontSize;
  final EdgeInsets? contentPadding;
  final TextAlign contentTextAlignment;
  final TextStyle? contentTextStyle;
  final Color? backgroundColor;
  final E? defaultValue;
  final double minContentFontSize;
  final String? title;
  final Alignment titleAlignment;
  final double? titleHeight;
  final EdgeInsetsGeometry? titlePadding;
  final EdgeInsets? actionsPadding;
  final TextAlign titleTextAlignment;
  final TextStyle? titleTextStyle;
  final Widget? titleWidget;
  final bool material;
  final EdgeInsets? materialActionsPadding;
  final AlertDialogButtonConfig<E> Function(AlertDialogButtonConfig<E>)? leadingButtonConfig;
  final AlertDialogButtonConfig<E> Function(AlertDialogButtonConfig<E>)? trailingButtonConfig;

  AdaptiveAlertdialog({
    Key? key,
    double? width,
    this.maxHeight,
    this.title,
    this.titleHeight,
    this.titleWidget,
    this.titlePadding,
    this.titleAlignment = Alignment.center,
    this.titleTextAlignment = TextAlign.center,
    this.contentMainAxisAlignment = MainAxisAlignment.start,
    this.contentCrossAxisAlignment = CrossAxisAlignment.center,
    this.contentTextAlignment = TextAlign.center,
    this.titleTextStyle,
    this.titleFontSize,
    this.titleMaxLines = 1,
    this.titleMaxFontSize,
    this.body,
    this.content,
    this.contentPadding,
    this.contentTextStyle,
    this.contentFontSize,
    this.actionsPadding,
    this.minContentFontSize = 14,
    this.backgroundColor,
    this.defaultValue,
    this.buttonDirection = Axis.vertical,
    this.material = false,
    this.materialActionsPadding,
    this.leadingButtonConfig,
    this.trailingButtonConfig,
  })  : _width = width ?? 0.63.w,
        super(key: key);

  AlertDialogButtonConfig<E> get _leadingButtonConfig =>
      leadingButtonConfig?.call(AlertDialogButtonConfig.leadingButtonConfig as AlertDialogButtonConfig<E>) ??
      AlertDialogButtonConfig.leadingButtonConfig as AlertDialogButtonConfig<E>;

  AlertDialogButtonConfig<E> get _trailingButtonConfig {
    return trailingButtonConfig?.call(AlertDialogButtonConfig.trailingButtonConfig as AlertDialogButtonConfig<E>) ??
        AlertDialogButtonConfig.trailingButtonConfig as AlertDialogButtonConfig<E>;
  }

  Widget get _title => SizedBox(
        width: title == null && titleWidget == null ? null : _width,
        height: title == null && titleWidget == null ? null : _titleHeight,
        child: Material(
          type: MaterialType.transparency,
          textStyle: titleTextStyle,
          child: Align(
            alignment: titleAlignment,
            child: title?.let(
                  (it) => AdaptiveText(
                    it,
                    softWrap: true,
                    maxLines: titleMaxLines,
                    textAlign: titleTextAlignment,
                    fontSize: titleFontSize ?? Utils.isPlatform(cupertino: 17.sp, material: 20.sp)!,
                    fontWeight: FontWeight.w600,
                    textColor: Palette.onSurfaceLight,
                    textColorDark: Palette.onSurfaceDark,
                    style: titleTextStyle,
                  ),
                ) ??
                titleWidget,
          ),
        ),
      );

  double get _titleHeight => titleHeight ?? 0.03.h;

  Widget _content(BuildContext c) {
    return SingleChildScrollView(
      clipBehavior: Clip.antiAlias,
      physics: Utils.physics,
      scrollDirection: Axis.vertical,
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: LimitedBox(
        maxHeight: maxHeight ?? double.infinity,
        child: SizedBox(
          width: _width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: contentMainAxisAlignment,
            crossAxisAlignment: contentCrossAxisAlignment,
            children: [
              ...body ??
                  [
                    Flexible(
                      child: SingleChildScrollView(
                        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                        child: content?.let(
                              (it) => AdaptiveText(
                                '$content',
                                softWrap: true,
                                textAlign: contentTextAlignment,
                                fontSize: contentFontSize ?? 16.sp,
                                fontWeight: FontWeight.w400,
                                style: contentTextStyle,
                              ),
                            ) ??
                            Utils.nothing,
                      ),
                    ),
                  ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _leadingButton(BuildContext c) =>
      _leadingButtonConfig._child ??
      AdaptiveButton(
        onPressed: () => _leadingButtonConfig.onPressed(defaultValue),
        maxLines: _leadingButtonConfig._maxLines,
        text: _leadingButtonConfig._text,
        materialData: (d) => d.copyWith(
          height: _leadingButtonConfig._height,
          width: _leadingButtonConfig._width ?? 0.25.w,
          splashColor: _leadingButtonConfig.splashColor,
          highlightColor: _leadingButtonConfig.highlightColor,
        ),
        cupertinoData: (d) => d.copyWith(
          height: _leadingButtonConfig._cupertinoHeight,
          width: _leadingButtonConfig._cupertinoWidth,
        ),
        loadingData: (d) => d.copyWith(
          isLoading: _leadingButtonConfig._isLoading,
        ),
        fontSize: _leadingButtonConfig._fontSize,
        maxFontSize: _leadingButtonConfig._maxFontSize,
        textColor: _leadingButtonConfig.textColor,
        disabled: _leadingButtonConfig._disabled,
        padding: _leadingButtonConfig._padding,
        textStyle: _leadingButtonConfig._textStyle,
        backgroundColor: _leadingButtonConfig._backgroundColor,
        borderRadius: _leadingButtonConfig._borderRadius,
      );

  MaterialAlertDialogData _materialAlertDialogData(BuildContext c) => MaterialAlertDialogData(
        scrollable: false,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 2.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: backgroundColor ?? Theme.of(c).scaffoldBackgroundColor,
        titlePadding: titlePadding ?? EdgeInsets.symmetric(horizontal: 0.04.w, vertical: 0.04.w),
        insetPadding: EdgeInsets.zero,
        contentPadding: EdgeInsets.symmetric(
          horizontal: sidePadding,
          vertical: sidePadding,
        ).copyWith(top: title != null ? 0.0 : null).merge(contentPadding),
        titleTextStyle: DefaultTextStyle.of(c).style.merge(TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600).merge(titleTextStyle)),
        actionsPadding: EdgeInsets.symmetric(vertical: 0.02.w, horizontal: 0.02.w).merge(actionsPadding),
        actions: [
          if (_leadingButtonConfig._visible) _leadingButton(c),
          if (_trailingButtonConfig._visible) _trailingButton(c),
        ],
      );

  Widget _trailingButton(BuildContext c) {
    return _trailingButtonConfig._child ??
        AdaptiveButton(
          onPressed: () => _trailingButtonConfig.onPressed(defaultValue),
          maxLines: _trailingButtonConfig._maxLines,
          text: _trailingButtonConfig._text,
          materialData: (d) => d.copyWith(
            height: _trailingButtonConfig._height,
            width: _trailingButtonConfig._width ?? 0.25.w,
            splashColor: _trailingButtonConfig.splashColor,
            highlightColor: _trailingButtonConfig.highlightColor,
          ),
          cupertinoData: (d) => d.copyWith(
            height: _trailingButtonConfig._cupertinoHeight,
            width: _trailingButtonConfig._cupertinoWidth,
          ),
          loadingData: (d) => d.copyWith(
            isLoading: _trailingButtonConfig._isLoading,
          ),
          fontSize: _trailingButtonConfig._fontSize,
          maxFontSize: _trailingButtonConfig._maxFontSize,
          textColor: _trailingButtonConfig.textColor,
          disabled: _trailingButtonConfig._disabled,
          padding: _trailingButtonConfig._padding,
          textStyle: _trailingButtonConfig._textStyle,
          backgroundColor: _trailingButtonConfig._backgroundColor,
          borderRadius: _trailingButtonConfig._borderRadius,
        );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(color: Palette.onSurface),
      child: MediaQuery.removeViewInsets(
        context: context,
        removeLeft: true,
        removeRight: true,
        child: material
            ? AlertDialog(
                scrollable: _materialAlertDialogData(context).scrollable!,
                clipBehavior: _materialAlertDialogData(context).clipBehavior!,
                elevation: _materialAlertDialogData(context).elevation!,
                shape: _materialAlertDialogData(context).shape!,
                backgroundColor: _materialAlertDialogData(context).backgroundColor!,
                titlePadding: _materialAlertDialogData(context).titlePadding!,
                insetPadding: _materialAlertDialogData(context).insetPadding!,
                contentPadding: contentPadding ?? _materialAlertDialogData(context).contentPadding!,
                titleTextStyle: _materialAlertDialogData(context).titleTextStyle!,
                contentTextStyle: contentTextStyle,
                title: _title,
                content: _content(context),
                actionsPadding: EdgeInsets.zero.merge(materialActionsPadding),
                actions: _materialAlertDialogData(context).actions,
              )
            : Theme(
                data: Utils.isPlatform(
                  cupertino: Utils.isDarkMode(context) ? ThemeData.dark() : ThemeData.light(),
                  material: context.read<ThemeCubit>().state.themeData(),
                )!,
                child: PlatformAlertDialog(
                  widgetKey: key,
                  title: _title,
                  content: _content(context),
                  material: (_, __) => _materialAlertDialogData(context),
                  cupertino: (_, __) => CupertinoAlertDialogData(
                    scrollController: ScrollController(),
                    insetAnimationCurve: Curves.easeInOutCubic,
                    insetAnimationDuration: const Duration(milliseconds: 1500),
                    actions: [
                      if (_leadingButtonConfig._visible)
                        _leadingButtonConfig._child ??
                            Visibility(
                              visible: !_leadingButtonConfig._isLoading,
                              replacement: const Center(
                                child: SizedBox(
                                  height: kMinInteractiveDimensionCupertino,
                                  child: CircularProgressBar.adaptive(width: 23, height: 23, strokeWidth: 2),
                                ),
                              ),
                              child: Disabled(
                                opacity: 0.6,
                                disabled: _leadingButtonConfig._disabled,
                                child: CupertinoDialogAction(
                                  isDefaultAction: _leadingButtonConfig._isDefaultAction,
                                  isDestructiveAction: _leadingButtonConfig._isDestructiveAction,
                                  onPressed: () => _leadingButtonConfig.onPressed(defaultValue),
                                  textStyle: _leadingButtonConfig._textStyle,
                                  child: Text('${_leadingButtonConfig._text}'),
                                ),
                              ),
                            ),
                      //
                      if (_trailingButtonConfig._visible)
                        _trailingButtonConfig._child ??
                            Visibility(
                              visible: !_trailingButtonConfig._isLoading,
                              replacement: const Center(
                                child: SizedBox(
                                  height: kMinInteractiveDimensionCupertino,
                                  child: CircularProgressBar.adaptive(width: 23, height: 23, strokeWidth: 2),
                                ),
                              ),
                              child: Disabled(
                                opacity: 0.6,
                                disabled: _trailingButtonConfig._disabled,
                                child: CupertinoDialogAction(
                                  isDefaultAction: _trailingButtonConfig._isDefaultAction,
                                  isDestructiveAction: _trailingButtonConfig._isDestructiveAction,
                                  onPressed: () => _trailingButtonConfig.onPressed(defaultValue),
                                  textStyle: _trailingButtonConfig._textStyle,
                                  child: Text('${_trailingButtonConfig._text}'),
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
