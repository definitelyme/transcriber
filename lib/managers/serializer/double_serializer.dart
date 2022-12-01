import 'package:json_annotation/json_annotation.dart';

class DoubleSerializer implements JsonConverter<double?, dynamic> {
  const DoubleSerializer();

  @override
  double? fromJson(dynamic value) {
    if (value == null) return null;

    if (value is double) {
      return value;
    } else if (value is int) {
      return value.toDouble();
    } else if (value is String) {
      return double.tryParse(value);
    } else {
      return null;
    }
  }

  @override
  dynamic toJson(double? instance) => instance;
}
