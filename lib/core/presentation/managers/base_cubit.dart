import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef StateChange<T> = T Function(T);

abstract class BaseState {
  const BaseState();

  bool get isFetching => false;
  bool get isSaving => false;
  bool get isDeleting => false;
  bool get validate => false;
  Option<String?> get status => none();
}

mixin BaseCubit<State> on Cubit<State> {
  @override
  void emit(State state) {
    if (!isClosed) super.emit(state);
  }
}
