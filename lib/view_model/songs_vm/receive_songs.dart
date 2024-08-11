import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:amir_music/model/model/save_song/save_song_index.dart';
import 'package:on_audio_query/on_audio_query.dart';
class ReceiveSongs {
  List<SongModel> listSongRecent = [];

  Future<List<SongModel>> getSongs({SongSortType? songSortType}) async {
   final songs = await _fetchSongs(songSortType ?? SongSortType.DATE_ADDED);

   listSongRecent = songs.reversed.toList();
   return listSongRecent;
  }

  Future<List<SongModel>> _fetchSongs(SongSortType sortType) async {
    if (kIsWeb) {
      // Handle web platform differently, if needed
      return [];
    }

    return OnAudioQuery().querySongs(sortType: sortType,   );
  }
  List<String> getArtistNames() {
    final artistNames = listSongRecent
        .map((song) {
      final parts = song.displayName.split(' - ');
      return parts.first;
    })
        .toSet()
        .toList();
    return artistNames;
  }


  // Future<Map<String, List<SongModel>>> getArtists() async {
  //   final songs = await getSongs();
  //   final Map<String, List<SongModel>> songsBySinger = {};
  //   for (final song in songs) {
  //     final singer = song.artist ?? 'Unknown';
  //     if (songsBySinger.containsKey(singer)) {
  //       songsBySinger[singer]!.add(song);
  //     } else {
  //       songsBySinger[singer] = [song];
  //     }
  //   }
  //
  //   return songsBySinger;
  // }

  Future<List<String>> getPaths() async {
    final songs = await getSongs();
    final Set<String> pathsSet = {};
    for (var song in songs) {
      pathsSet.add(song.uri!);
    }
    return pathsSet.toList();
  }

  Future<List<SongModel>> getSongsByIndex(List<SaveSong> listIndex) async {
    final songs = await getSongs();
    final List<SongModel> songsByIndex = [];
    for (int i = 0; i < listIndex.length; i++) {
      songsByIndex.add(songs[listIndex[i].indexSongs]);
    }
    return songsByIndex;
  }

  void pushSongRecent(SongModel song) {
    if (listSongRecent.length == 100) {
      listSongRecent.removeAt(0);
    }
    listSongRecent.add(song);
  }

  Future<List<SongModel>> recentAdd() async {
    final songs = await getSongs();
    for (var song in songs.reversed.toList()) {
      pushSongRecent(song);
    }
    return listSongRecent.reversed.toList();
  }

  Future<List<String>> getAlbums() async {
    final songs = await getSongs();
    final Set<String> albumsSet = {};
    for (var song in songs) {
      albumsSet.add(song.album!);
    }
    return albumsSet.toList();
  }

  Future<int> countSongs() async {
    final songs = await getSongs();
    return songs.length;
  }

  Future<List<SongModel>> groupListSongs(List<String> group) async {
    final songs = await getSongs();
    List<SongModel> groupSongs = [];
    for (var song in songs) {
      for (var namePop in group) {
        if (song.displayName.contains(namePop) || song.displayName == namePop) {
          groupSongs.add(song);
        }
      }
    }
    return groupSongs;
  }
}
