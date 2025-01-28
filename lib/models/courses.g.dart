// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'courses.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CoursesAdapter extends TypeAdapter<Courses> {
  @override
  final int typeId = 0;

  @override
  Courses read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Courses(
      courseId: fields[0] as String,
      courseName: fields[1] as String,
      courseImg: fields[2] as String,
      content: (fields[3] as List).cast<Chapter>(),
    );
  }

  @override
  void write(BinaryWriter writer, Courses obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.courseId)
      ..writeByte(1)
      ..write(obj.courseName)
      ..writeByte(2)
      ..write(obj.courseImg)
      ..writeByte(3)
      ..write(obj.content);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CoursesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
