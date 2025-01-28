// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChapterAdapter extends TypeAdapter<Chapter> {
  @override
  final int typeId = 2;

  @override
  Chapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Chapter(
      topicName: fields[0] as String,
      paragraphs: (fields[1] as List).cast<String>(),
      links: (fields[2] as List).cast<String>(),
      ytLinks: (fields[3] as List).cast<YoutubeLinks>(),
    );
  }

  @override
  void write(BinaryWriter writer, Chapter obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.topicName)
      ..writeByte(1)
      ..write(obj.paragraphs)
      ..writeByte(2)
      ..write(obj.links)
      ..writeByte(3)
      ..write(obj.ytLinks);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
