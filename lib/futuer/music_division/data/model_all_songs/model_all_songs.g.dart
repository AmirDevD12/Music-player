// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_all_songs.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ModelAllSongsAdapter extends TypeAdapter<ModelAllSongs> {
  @override
  final int typeId = 4;

  @override
  ModelAllSongs read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ModelAllSongs(
      title: fields[0] as String,
      displayName: fields[1] as String,
      artist: fields[2] as String,
      data: fields[3] as String,
      duration: fields[4] as int?,
      dateAdded: fields[5] as int?,
      uri: fields[6] as String?,
      id: fields[7] as int?,
      favorite: fields[8] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, ModelAllSongs obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.displayName)
      ..writeByte(2)
      ..write(obj.artist)
      ..writeByte(3)
      ..write(obj.data)
      ..writeByte(4)
      ..write(obj.duration)
      ..writeByte(5)
      ..write(obj.dateAdded)
      ..writeByte(6)
      ..write(obj.uri)
      ..writeByte(7)
      ..write(obj.id)
      ..writeByte(8)
      ..write(obj.favorite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ModelAllSongsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
