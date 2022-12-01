import 'package:transcriber/core/domain/entities/entities.dart';
import 'package:transcriber/core/domain/response/field_object/field_object_exception.dart';
import 'package:transcriber/core/domain/validator/validator.dart';
import 'package:dartz/dartz.dart';

class BasicTextField extends StringFieldObject {
  static const BasicTextField kDefaultString = BasicTextField._(Right(''));

  @override
  final Either<FieldObjectException<String>, String?> value;

  factory BasicTextField(String? input, {ValidatorFunction<String?>? other, bool validate = true}) =>
      BasicTextField._(!validate ? right(input) : Validator.isNotEmpty(input).flatMap(other ?? (a) => right(a)));

  const BasicTextField._(this.value);

  @override
  BasicTextField copyWith(String? newValue, {bool validate = true, ValidatorFunction<String?>? other}) =>
      BasicTextField(newValue, validate: validate, other: other);

  BasicTextField toUpperCase() => BasicTextField(getOrNull?.toUpperCase());

  BasicTextField toLowerCase() => BasicTextField(getOrNull?.toLowerCase());

  BasicTextField operator +(String other) => copyWith(getOrEmpty + other);

  BasicTextField operator -(String other) => copyWith(getOrEmpty.replaceAll(other, ''));
}
