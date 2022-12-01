library widget_focus.dart;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum WidgetFocusMode { focus, unfocus }

/// A stateless widget to render WidgetFocus.
class WidgetFocus extends StatelessWidget {
  final HitTestBehavior? behavior;
  final Widget child;
  final bool focus;
  final FocusNode? focusNode;
  final bool hideKeyboard;
  final WidgetFocusMode mode;
  final bool onDrag;
  final VoidCallback? onTap;
  final bool showKeyboard;
  final bool unfocus;

  const WidgetFocus({
    Key? key,
    this.onDrag = false,
    this.mode = WidgetFocusMode.unfocus,
    required this.child,
    this.focusNode,
    this.hideKeyboard = true,
    this.showKeyboard = true,
    this.unfocus = true,
    this.focus = true,
    this.behavior,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _changeFocus() {
      if (mode == WidgetFocusMode.unfocus) {
        if (unfocus) FocusManager.instance.primaryFocus?.unfocus();
        if (hideKeyboard) SystemChannels.textInput.invokeMethod('TextInput.hide');
      } else {
        if (focusNode != null && focus) {
          focusNode!.requestFocus();
          if (showKeyboard) SystemChannels.textInput.invokeMethod('TextInput.show');
        } else if (focus) {
          FocusManager.instance.primaryFocus?.requestFocus();
        }

        if (showKeyboard) SystemChannels.textInput.invokeMethod('TextInput.show');
      }
    }

    Widget _maybeFocus({required WidgetBuilder child}) =>
        focusNode != null ? Focus(canRequestFocus: true, child: Builder(builder: (c) => child(c))) : child(context);

    return _maybeFocus(
      child: (c) => GestureDetector(
        behavior: behavior ?? HitTestBehavior.translucent,
        onVerticalDragStart: onDrag ? (_) => _changeFocus() : null,
        onHorizontalDragStart: onDrag ? (_) => _changeFocus() : null,
        onTap: () {
          _changeFocus();
          onTap?.call();
        },
        child: child,
      ),
    );
  }
}
