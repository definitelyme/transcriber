library field_object.dart;

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transcriber/core/domain/response/index.dart';
import 'package:transcriber/utils/utils.dart';
import 'package:dartz/dartz.dart';

@immutable
abstract class FieldObject<T> {
  const FieldObject();

  Either<FieldObjectException<String>, T?> get value;

  Either<FieldObjectException<dynamic>, Unit> get mapped => value.fold((f) => left(f), (_) => right(unit));

  bool get isValid => value.isRight();

  T get getExact {
    return value.fold((_) {
      assert(getOrEmpty != null);
      return getOrEmpty as T;
    }, (i) => i!);
  }

  T? get getOrNull => value.fold((_) => null, id);

  T? get getOrEmpty {
    return value.fold((_) {
      if (typesEqual<T, int>() || typesEqual<T, int?>()) return -1 as T;
      if (typesEqual<T, double>() || typesEqual<T, double?>()) return 0.0 as T;
      if (typesEqual<T, num>() || typesEqual<T, num?>()) return -1 as T;
      if (typesEqual<T, String>() || typesEqual<T, String?>()) return '' as T;
      if (typesEqual<T, Iterable<dynamic>>() || typesEqual<T, Iterable<dynamic>?>()) return [] as T;
      return null;
    }, id);
  }

  dynamic get _getOrError => value.fold((f) => 'FieldObject<$T>(${f.message})', id);

  FieldObject<T> copyWith(T newValue) => throw UnimplementedError();

  @override
  bool operator ==(other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is FieldObject<T> && const DeepCollectionEquality().equals(value, other.value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @override
  String toString() => '$_getOrError';
}

abstract class StringFieldObject extends FieldObject<String> {
  const StringFieldObject();

  @override
  Either<FieldObjectException<String>, String?> get value;

  @override
  String get getOrEmpty => value.fold((_) => '', (it) => it!);
}
