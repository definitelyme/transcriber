library toast_manager.dart;

import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:transcriber/utils/utils.dart';

final GlobalKey<ScaffoldMessengerState> scaffoldMessagerKey = GlobalKey<ScaffoldMessengerState>();
mixin ToastManager {
  static void short(
    String msg, {
    SnackBarAction? action,
    Color? backgroundColor,
    ShapeBorder shape = const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
    DismissDirection dismissDirection = DismissDirection.down,
  }) {
    cancel();

    final snackbar = SnackBar(
      content: Text(msg),
      duration: const Duration(seconds: 2),
      backgroundColor: backgroundColor,
      shape: shape,
      action: action,
      dismissDirection: dismissDirection,
    );

    scaffoldMessagerKey.currentState?.showSnackBar(snackbar);
  }

  static void long(
    String msg, {
    SnackBarAction? action,
    Color? backgroundColor,
    ShapeBorder shape = const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
    DismissDirection dismissDirection = DismissDirection.down,
  }) {
    cancel();

    final snackbar = SnackBar(
      content: Text(msg),
      duration: const Duration(seconds: 5),
      backgroundColor: backgroundColor,
      shape: shape,
      action: action,
      dismissDirection: dismissDirection,
    );

    scaffoldMessagerKey.currentState?.showSnackBar(snackbar);
  }

  static void custom({
    BuildContext? context,
    String? msg,
    Widget? child,
    Duration duration = const Duration(seconds: 5),
    Color? backgroundColor,
  }) {
    assert(msg != null || child != null, 'Either msg or child must be provided');

    if (child != null) {
      showToastWidget(
        child,
        dismissOtherToast: true,
        duration: duration,
        context: context,
      );
    }

    showToast(
      msg!,
      context: context,
      radius: Const.inputBorderRadius,
      duration: duration,
      position: ToastPosition.bottom,
      dismissOtherToast: true,
      backgroundColor: backgroundColor ?? Palette.backgroundInverted,
      textStyle: TextStyle(fontSize: 15.0, color: Palette.onSurfaceInverted),
    );
  }

  static void cancel() => scaffoldMessagerKey.currentState?.hideCurrentSnackBar();
}
