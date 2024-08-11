// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_song_index.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SaveSongAdapter extends TypeAdapter<SaveSong> {
  @override
  final int typeId = 1;

  @override
  SaveSong read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SaveSong(
      fields[0] as int,
    );
  }

  @override
  void write(BinaryWriter writer, SaveSong obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.indexSongs);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SaveSongAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
