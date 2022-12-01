library validator.dart;

import 'package:transcriber/core/domain/response/index.dart';
import 'package:built_collection/built_collection.dart';
import 'package:dartz/dartz.dart';

const Pattern emailPattern =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
const Pattern emptyStringPattern = r'^\s*$';

enum FieldValidation {
  none,
  basic,
  deep;

  T when<T>({
    T Function()? basic,
    T Function()? deep,
    T Function()? none,
    required T Function() orElse,
  }) {
    switch (this) {
      case FieldValidation.basic:
        return basic != null ? basic() : orElse();
      case FieldValidation.deep:
        return deep != null ? deep() : orElse();
      case FieldValidation.none:
        return none != null ? none() : orElse();
    }
  }
}

typedef ValidatorFunction<G> = _Validator<G> Function(G);

typedef _Validator<U> = Either<FieldObjectException<String>, U>;

class Validator {
  Validator._();

  static _Validator<T> isNotEmpty<T>(T? value) {
    // Returns the string without any leading and trailing whitespace
    if (value == null) return left(FieldObjectException.empty());

    if (value is String && value.trim().isEmpty) return left(FieldObjectException.empty());

    if (value is BuiltList && value.isEmpty) return left(FieldObjectException.empty());

    if (RegExp('$emptyStringPattern').hasMatch('$value')) return left(FieldObjectException.empty());

    return right((value is String ? value.trim() as T : value));
  }

  static _Validator<String?> emailValidator(String? email) {
    // Returns the string without any leading and trailing whitespace
    if (email == null) return left(FieldObjectException.empty());

    var clean = email.trim();

    if (clean.isEmpty) return left(FieldObjectException.empty());

    if (!RegExp('$emailPattern').hasMatch(clean)) return left(FieldObjectException.invalid(INVALID_EMAIL_MESSAGE));

    return right(email);
  }
}
