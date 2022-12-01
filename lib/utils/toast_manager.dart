library toast_manager.dart;

import 'package:flutter/material.dart';
import 'package:transcriber/utils/utils.dart';

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
    required Widget child,
    SnackBarAction? action,
    Color? backgroundColor,
    ShapeBorder shape = const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
    DismissDirection dismissDirection = DismissDirection.down,
  }) {
    cancel();

    final snackbar = SnackBar(
      content: child,
      backgroundColor: backgroundColor,
      shape: shape,
      action: action,
      dismissDirection: dismissDirection,
    );

    scaffoldMessagerKey.currentState?.showSnackBar(snackbar);
  }

  static void cancel() => scaffoldMessagerKey.currentState?.hideCurrentSnackBar();
}
