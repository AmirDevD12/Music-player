import 'package:amir_music/futuer/music_division/data/model_all_songs/model_all_songs.dart';
import 'package:on_audio_query/on_audio_query.dart';

abstract class ISongsModel {
  final List<ModelAllSongs> songsList =[];
  final Map<String, List<ModelAllSongs>> groupMap ={};
  final Map<String, List<ModelAllSongs>> artistMap ={};
  Map<String, List<ModelAllSongs>> getArtistSongs();
  List<ModelAllSongs> getAllSongs();
  Map<String, List<ModelAllSongs>> getGroupSongs();
  Future<void> updateSongs({required int index , required ModelAllSongs song});
  Future<void> deleteSongs({required ModelAllSongs song});
  Future<void> addSongs({required ModelAllSongs song});
  List<ModelAllSongs> changeSortSongs({required SongSortType sort});
}