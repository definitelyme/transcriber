library unique_id.dart;

import 'dart:math' as math;

import 'package:freezed_annotation/freezed_annotation.dart';

class UniqueId<T> {
  final T value;

  const UniqueId._(this.value);

  factory UniqueId.fromExternal(T id) => UniqueId._(id);

  factory UniqueId.random({int chars = 2, int numbers = 4}) {
    final _random = math.Random();

    /// Generate random list of numbers of length [numbers]
    final _numbers = List.generate(numbers, (_) => _random.nextInt(10), growable: false);

    /// Generate random list of alphabets of length [chars]
    final _chars = List.generate(chars, (_) => String.fromCharCode(_random.nextInt(26) + 65), growable: false);

    /// Join the two lists and convert to string
    return UniqueId._((_chars.join().toUpperCase() + _numbers.join()) as T);
  }

  @override
  bool operator ==(other) => other is UniqueId<T> && const DeepCollectionEquality().equals(value, other.value);

  @override
  int get hashCode => Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @override
  String toString() => '$_getOrError';

  dynamic get _getOrError => value ?? 'UniqueId<$T>($value)';

  bool get isValid => value != null;
}
