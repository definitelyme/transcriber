library my_hero_widget.dart;

import 'package:transcriber/Core/presentation/index.dart';
import 'package:flutter/material.dart';

/// A stateless widget to render MyHero.
class MyHero extends StatelessWidget {
  final Object? tag;
  final Widget child;
  final Color? color;
  final BorderRadius? borderRadius;
  final Duration animationDuration;
  final bool borderOnForeground;
  final Clip clipBehavior;
  final double elevation;
  final Color? shadowColor;
  final ShapeBorder? shape;
  final TextStyle? textStyle;
  final MaterialType type;
  final bool disabled;
  final double disabledOpacity;
  final bool material;

  const MyHero({
    Key? key,
    required this.tag,
    required this.child,
    this.color,
    this.borderRadius,
    this.animationDuration = kThemeChangeDuration,
    this.borderOnForeground = true,
    this.clipBehavior = Clip.none,
    this.elevation = 0,
    this.shadowColor,
    this.shape,
    this.textStyle,
    this.type = MaterialType.transparency,
    this.disabled = false,
    this.disabledOpacity = 1,
    this.material = true,
  }) : super(key: key);

  Widget get _child => !material
      ? child
      : Material(
          color: color,
          borderRadius: borderRadius,
          animationDuration: animationDuration,
          borderOnForeground: borderOnForeground,
          clipBehavior: clipBehavior,
          elevation: elevation,
          shadowColor: shadowColor,
          shape: shape,
          textStyle: textStyle,
          type: color != null ? MaterialType.canvas : type,
          child: child,
        );

  @override
  Widget build(BuildContext context) {
    return Disabled(
      disabled: disabled,
      opacity: disabledOpacity,
      child: tag == null ? _child : Hero(tag: tag!, child: _child),
    );
  }
}
