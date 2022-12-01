import 'package:transcriber/core/domain/entities/entities.dart';
import 'package:transcriber/core/domain/response/field_object/field_object_exception.dart';
import 'package:transcriber/core/domain/validator/validator.dart';
import 'package:dartz/dartz.dart';

class EmailAddress extends FieldObject<String?> {
  static const EmailAddress DEFAULT = EmailAddress._(Right(''));
  static const String kPlaceholder = 'johndoe@email.com';

  @override
  final Either<FieldObjectException<String>, String?> value;

  factory EmailAddress(String? email, {bool validate = true}) {
    return EmailAddress._(!validate ? right(email) : Validator.emailValidator(email));
  }

  const EmailAddress._(this.value);

  bool get isEmpty => value.fold((_) => true, (r) => r!.isEmpty);

  @override
  EmailAddress copyWith(String? newValue) => EmailAddress(newValue);
}
