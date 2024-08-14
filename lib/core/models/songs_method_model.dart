import 'package:amir_music/core/models/i_songs_model.dart';
import 'package:amir_music/futuer/music_division/data/model_all_songs/model_all_songs.dart';
import 'package:amir_music/futuer/music_division/data/model_hive/music_group.dart';
import 'package:hive/hive.dart';
import 'package:on_audio_query/on_audio_query.dart';

class SongsMethodModel implements ISongsModel {
  final boxAllSongs = Hive.box<ModelAllSongs>("AllSongs");
  final boxGroup = Hive.box<MusicGroup>("MusicGroup");

  @override
  // TODO: implement songsList
  List<ModelAllSongs> get songsList => getAllSongs();

  @override
  // TODO: implement artistMap
  Map<String, List<ModelAllSongs>> get artistMap => getArtistSongs();

  @override
  // TODO: implement groupMap
  Map<String, List<ModelAllSongs>> get groupMap => getGroupSongs();

  @override
  List<ModelAllSongs> changeSortSongs({required SongSortType sort}) {
    final allSongs = getAllSongs();
    // TODO: implement changeSortSongs
    if (sort case SongSortType.DATE_ADDED) {
      allSongs.sort((a, b) => a.dateAdded!.compareTo(b.dateAdded!));
      return allSongs.reversed.toList();
    } else if (sort case SongSortType.DISPLAY_NAME) {
      allSongs.sort((a, b) => a.displayName.compareTo(b.displayName));
      return allSongs;
    } else {
      allSongs.sort((a, b) => a.artist.compareTo(b.artist));
      return allSongs;
    }
  }

  @override
  Future<void> addSongs({required ModelAllSongs song}) async {
    // TODO: implement addSongs
    songsList.add(song);
    await boxAllSongs.add(song);
  }

  @override
  Future<void> deleteSongs({required ModelAllSongs song}) async {
    // TODO: implement deleteSongs
    final index = songsList.indexOf(song);
    if (index != -1) {
      songsList.removeAt(index);
      await boxAllSongs.deleteAt(index);
    }
  }

  @override
  Future<void> updateSongs(
      {required int index, required ModelAllSongs song}) async {
    // TODO: implement updateSongs
    if (index >= 0 && index < songsList.length) {
      songsList[index] = song;
      await boxAllSongs.putAt(index, song);
    }
  }

  @override
  List<ModelAllSongs> getAllSongs() {
    // TODO: implement getAllSongs
    final listAllSongs = boxAllSongs.values.toList();
    return listAllSongs;
  }

  @override
  Map<String, List<ModelAllSongs>> getArtistSongs() {
    // TODO: implement getArtistSongs
    final Map<String, List<ModelAllSongs>> songsArtist = {};
    for (var song in songsList) {
      final singer = song.artist;
      songsArtist.putIfAbsent(singer, () => []).add(song);
    }
    return songsArtist;
  }

  @override
  Map<String, List<ModelAllSongs>> getGroupSongs() {
    // TODO: implement getGroupSongs
    Map<String, List<ModelAllSongs>> listGrouping = {};
    final listMusicGroup = boxGroup.values.toList();
    Map<String, List<String>> mapListMusicGroup = {};
    for (var value in listMusicGroup) {
      mapListMusicGroup[value.keyName] = value.namesArtists;
    }
    final groupMap = <String, String>{};
    for (var name in mapListMusicGroup.keys) {
      for (var value in mapListMusicGroup[name]!) {
        groupMap[value] = name;
      }
    }

    for (var song in songsList) {
      for (var value in groupMap.keys) {
        if (song.displayName.contains(value) || song.displayName == value) {
          final groupName = groupMap[value];
          if (listGrouping.containsKey(groupName)) {
            listGrouping[groupName]!.add(song);
          } else {
            listGrouping[groupName!] = [song];
          }
          break;
        }
      }
    }
    return listGrouping;
  }
}
