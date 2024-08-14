import 'package:amir_music/core/resource/constants.dart';
import 'package:amir_music/futuer/music_division/data/model_hive/music_group.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

class DefaultGroupNameList {
  final bool launchApp;
  final boxGroup = Hive.box<MusicGroup>("MusicGroup");

  // Private constructor
  DefaultGroupNameList._internal({required this.launchApp}) {
    if (launchApp) {
      if (kDebugMode) {
        print("*** Already Add Name Group ***");
      }
    } else {
      addNameGroup();
    }
  }

  // Single instance
  static DefaultGroupNameList? _instance;

  // Factory constructor to return the singleton instance
  factory DefaultGroupNameList({required bool launchApp}) {
    _instance ??= DefaultGroupNameList._internal(launchApp: launchApp);
    return _instance!;
  }

  // Method to add name groups to the Hive box
  void addNameGroup() {
    final Map<String, List<String>> listNameGrouping = {
      "Pop": Constants.namePop,
      "classic": Constants.nameClassic,
      "Rap": Constants.nameRap,
      "Nostalgia": Constants.nameNostalgia
    };

    listNameGrouping.forEach((key, value) {
      boxGroup.add(MusicGroup(keyName: key, namesArtists: value));
    });
  }
}
