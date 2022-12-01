import 'package:json_annotation/json_annotation.dart';

String? serializeDateTime(DateTime? dateTime) => dateTime?.toIso8601String();
DateTime? deserializeDateTime(String value) => DateTime.tryParse(value);

class TimestampConverter implements JsonConverter<DateTime?, dynamic> {
  const TimestampConverter();

  @override
  DateTime? fromJson(dynamic value) => deserializeDateTime('$value')?.toLocal();

  @override
  dynamic toJson(DateTime? instance) => instance?.toIso8601String();
}
