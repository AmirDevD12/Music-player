import 'package:amir_music/futuer/music_division/data/model_all_songs/model_all_songs.dart';
import 'package:amir_music/view_model/songs_vm/receive_songs.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

class FetchSongsToLocalPhone extends ReceiveSongs {
  final bool lunchApp;
  final boxAllSongs = Hive.box<ModelAllSongs>("AllSongs");

  // Private constructor
  FetchSongsToLocalPhone._internal({required this.lunchApp}) {
    if (lunchApp&&boxAllSongs.values.isNotEmpty) {
      if (kDebugMode) {
        print("*** Already Launch ***");
      }
    } else {
      fetchSongs();
    }
  }

  // Single instance
  static FetchSongsToLocalPhone? _instance;

  // Factory constructor for singleton pattern
  factory FetchSongsToLocalPhone({required bool lunchApp}) {
    _instance ??= FetchSongsToLocalPhone._internal(lunchApp: lunchApp);
    return _instance!;
  }

  Future<void> fetchSongs() async {
    getSongs().then((allSongs) async {
      await boxAllSongs.addAll(allSongs.map((songs) {
        return ModelAllSongs(
            title: songs.title,
            displayName: songs.displayName,
            artist: songs.artist ?? "Unknown",
            data: songs.data,
            uri: songs.uri,
            dateAdded: songs.dateAdded,
            duration: songs.duration,
            id: songs.id,
            favorite: false);
      }).toList());
    });
  }
}