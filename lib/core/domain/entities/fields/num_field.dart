library num_field.dart;

import 'package:transcriber/core/domain/entities/entities.dart';
import 'package:transcriber/core/domain/response/field_object/field_object_exception.dart';
import 'package:transcriber/core/domain/validator/validator.dart';
import 'package:transcriber/utils/utils.dart';
import 'package:dartz/dartz.dart';

class NumField<U extends num?> extends FieldObject<U> {
  static const NumField DEFAULT = NumField._(Right(0));

  @override
  final Either<FieldObjectException<String>, U> value;

  factory NumField(U input, {ValidatorFunction<U>? other, bool validate = true}) =>
      NumField<U>._(other?.let((it) => Validator.isNotEmpty(input).flatMap(it)) ?? (validate ? Validator.isNotEmpty(input) : right(input)));

  const NumField._(this.value);

  NumField<U> operator +(num other) {
    if (typesEqual<U, int>()) return copyWith(((getOrNull as int) + other) as U);
    if (typesEqual<U, int?>()) return copyWith(((getOrNull as int? ?? 0) + other) as U);
    if (typesEqual<U, double>()) return copyWith(((getOrNull as double) + other) as U);
    if (typesEqual<U, double?>()) return copyWith(((getOrNull as double? ?? 0) + other) as U);
    if (typesEqual<U, num>()) return copyWith(((getOrNull as num) + other) as U);
    return copyWith(((getOrNull ?? 0) + other) as U);
  }

  NumField<U> operator -(num other) {
    if (typesEqual<U, int>()) return copyWith(((getOrNull as int) - other) as U);
    if (typesEqual<U, int?>()) return copyWith(((getOrNull as int? ?? 0) - other) as U);
    if (typesEqual<U, double>()) return copyWith(((getOrNull as double) - other) as U);
    if (typesEqual<U, double?>()) return copyWith(((getOrNull as double? ?? 0) - other) as U);
    if (typesEqual<U, num>()) return copyWith(((getOrNull as num) - other) as U);
    return copyWith(((getOrNull ?? 0) - other) as U);
  }

  @override
  NumField<U> copyWith(U newValue) => NumField<U>(newValue);
}
