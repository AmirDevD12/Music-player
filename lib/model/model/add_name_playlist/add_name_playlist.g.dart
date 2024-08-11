// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_name_playlist.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SaveNamePlayListAdapter extends TypeAdapter<SaveNamePlayList> {
  @override
  final int typeId = 0;

  @override
  SaveNamePlayList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SaveNamePlayList(
      fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SaveNamePlayList obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.namePlayList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SaveNamePlayListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
