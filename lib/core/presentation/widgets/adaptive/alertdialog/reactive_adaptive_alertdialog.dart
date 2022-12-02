library reactive_adaptive_alertdialog.dart;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum _BlocType { create, value }

/// A stateless widget to render ReactiveAdaptiveAlertdialog.
class ReactiveAdaptiveAlertdialog<Reactive extends BlocBase<ReactiveState>, ReactiveState> extends StatelessWidget {
  final Reactive bloc;
  final Widget Function(BuildContext, ReactiveState) dialog;
  final List<BlocListener<Reactive, ReactiveState>> listeners;
  final _BlocType _type;

  const ReactiveAdaptiveAlertdialog({
    Key? key,
    required this.bloc,
    required this.dialog,
    this.listeners = const [],
  })  : _type = _BlocType.create,
        super(key: key);

  const ReactiveAdaptiveAlertdialog.value({
    Key? key,
    required this.bloc,
    required this.dialog,
    this.listeners = const [],
  })  : _type = _BlocType.value,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return _type == _BlocType.create
        ? BlocProvider(
            create: (_) => bloc,
            child: listeners.isNotEmpty
                ? MultiBlocListener(listeners: listeners, child: BlocBuilder<Reactive, ReactiveState>(builder: (c, s) => dialog.call(c, s)))
                : BlocBuilder<Reactive, ReactiveState>(builder: (c, s) => dialog.call(c, s)))
        : BlocProvider.value(
            value: bloc,
            child: listeners.isNotEmpty
                ? MultiBlocListener(listeners: listeners, child: BlocBuilder<Reactive, ReactiveState>(builder: (c, s) => dialog.call(c, s)))
                : BlocBuilder<Reactive, ReactiveState>(builder: (c, s) => dialog.call(c, s)));
  }
}
