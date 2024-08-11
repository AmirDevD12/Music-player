import 'package:hive/hive.dart';
part "save_song_index.g.dart";
@HiveType(typeId: 1)
class SaveSong {
  SaveSong(this.indexSongs);
  @HiveField(0)
  int indexSongs;
}