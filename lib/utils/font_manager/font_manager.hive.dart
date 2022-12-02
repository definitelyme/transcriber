// GENERATED CODE - DO NOT MODIFY BY HAND

part of font_manager.dart;

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FontManagerAdapter extends TypeAdapter<FontManager> {
  @override
  final int typeId = 2;

  @override
  FontManager read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FontManager(
      fields[0] as String,
      (fields[1] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, FontManager obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj._fontFamily)
      ..writeByte(1)
      ..write(obj._urls);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FontManagerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
