// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QuestionAdapter extends TypeAdapter<Question> {
  @override
  final int typeId = 0;

  @override
  Question read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Question(
      text: fields[0] as String,
      topic: fields[2] as Topics,
      part: fields[1] as int,
      wasAskedBefore: fields[3] as bool,
      shouldSay: (fields[4] as List?)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, Question obj) {
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
      other is QuestionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TopicsAdapter extends TypeAdapter<Topics> {
  @override
  final int typeId = 1;

  @override
  Topics read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Topics.Style;
      case 1:
        return Topics.Entertainment;
      case 2:
        return Topics.Life;
      case 3:
        return Topics.Places;
      case 4:
        return Topics.Storytelling;
      case 5:
        return Topics.Education;
      case 6:
        return Topics.Person;
      case 7:
        return Topics.Environment;
      default:
        return Topics.Style;
    }
  }

  @override
  void write(BinaryWriter writer, Topics obj) {
    switch (obj) {
      case Topics.Style:
        writer.writeByte(0);
        break;
      case Topics.Entertainment:
        writer.writeByte(1);
        break;
      case Topics.Life:
        writer.writeByte(2);
        break;
      case Topics.Places:
        writer.writeByte(3);
        break;
      case Topics.Storytelling:
        writer.writeByte(4);
        break;
      case Topics.Education:
        writer.writeByte(5);
        break;
      case Topics.Person:
        writer.writeByte(6);
        break;
      case Topics.Environment:
        writer.writeByte(7);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TopicsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
