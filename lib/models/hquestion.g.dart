// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hquestion.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HquestionAdapter extends TypeAdapter<Hquestion> {
  @override
  final int typeId = 3;

  @override
  Hquestion read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Hquestion(
      text: fields[0] as String,
      topic: fields[2] as Topics,
      part: fields[1] as int,
      wasAskedBefore: fields[3] as bool,
      shouldSay: (fields[4] as List?)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, Hquestion obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.text)
      ..writeByte(1)
      ..write(obj.part)
      ..writeByte(2)
      ..write(obj.topic)
      ..writeByte(3)
      ..write(obj.wasAskedBefore)
      ..writeByte(4)
      ..write(obj.shouldSay);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HquestionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
