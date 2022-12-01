library base_data_model.dart;

import 'package:transcriber/core/domain/entities/entities.dart';

abstract class BaseEntity with Comparable<BaseEntity> {
  const BaseEntity();

  UniqueId<String?> get id;
  DateTime? get createdAt;
  DateTime? get updatedAt;
  DateTime? get deletedAt;

  bool get isDeleted => deletedAt != null;

  bool get isNotDeleted => !isDeleted;

  @override
  int compareTo(BaseEntity other) => other.createdAt!.compareTo(createdAt!);
}
