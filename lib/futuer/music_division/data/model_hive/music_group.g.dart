// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_group.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MusicGroupAdapter extends TypeAdapter<MusicGroup> {
  @override
  final int typeId = 3;

  @override
  MusicGroup read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MusicGroup(
      keyName: fields[0] as String,
      namesArtists: (fields[1] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, MusicGroup obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.keyName)
      ..writeByte(1)
      ..write(obj.namesArtists);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MusicGroupAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
