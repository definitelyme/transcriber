import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'field_object_exception.freezed.dart';

// Validation messages
const String REQUIRED_FIELD_MESSAGE = 'Field is required!';
const String INVALID_FIELD_MESSAGE = 'Provide a valid input!';
const String INVALID_EMAIL_MESSAGE = 'Provide a valid e-mail';

@freezed
class FieldObjectException<T> with _$FieldObjectException<T> {
  const factory FieldObjectException({required String message}) = _FieldObjectException<T>;

  factory FieldObjectException.empty([String? message]) => FieldObjectException(message: message ?? REQUIRED_FIELD_MESSAGE);

  factory FieldObjectException.invalid([String? message]) => FieldObjectException(message: message ?? INVALID_FIELD_MESSAGE);

  factory FieldObjectException.lengthAware([String? message]) => FieldObjectException(message: message ?? INVALID_FIELD_MESSAGE);
}
