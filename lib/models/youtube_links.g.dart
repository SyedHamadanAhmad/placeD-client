// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'youtube_links.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class YoutubeLinksAdapter extends TypeAdapter<YoutubeLinks> {
  @override
  final int typeId = 1;

  @override
  YoutubeLinks read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return YoutubeLinks(
      title: fields[0] as String,
      video_url: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, YoutubeLinks obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.video_url);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is YoutubeLinksAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
