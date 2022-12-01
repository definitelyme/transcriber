import 'package:json_annotation/json_annotation.dart';

class StringSerializer implements JsonConverter<String?, dynamic> {
  const StringSerializer();

  @override
  String? fromJson(dynamic value) => value == null ? null : '$value';

  @override
  dynamic toJson(String? instance) => instance;
}
