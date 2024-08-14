import 'package:amir_music/core/resource/my_colors.dart';
import 'package:amir_music/futuer/music_division/data/model_hive/music_group.dart';
import 'package:amir_music/futuer/music_division/repository/controller/music_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class SelectNameSongsController extends GetxController {
  final MusicDivisionController musicController = Get.find();
  List<String> selectedArtists = <String>[].obs;
  List<String> artistNames = <String>[].obs;
  final TextEditingController nameController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    loadArtistNames();
  }

  void loadArtistNames() {
    final names = musicController.songsList
        .map((song) {
          final List<String> parts = song.displayName.split(' - ');
          return parts.first;
        })
        .toSet()
        .toList();
    artistNames.assignAll(names );
  }

  void toggleArtistSelection(String artistName) {
    if (selectedArtists.contains(artistName)) {
      selectedArtists.remove(artistName);
    } else {
      selectedArtists.add(artistName);
    }
    loadArtistNames();
  }

  void filterArtistNames(String query) {
    if (query.isEmpty) {
      loadArtistNames();
    } else {
      final filtered = artistNames
          .where((artist) => artist.toLowerCase().contains(query.toLowerCase()))
          .toList();
      artistNames.assignAll(filtered);
    }
  }

  checkNameGroupList() {
    final listName = nameController.text;
    final bool isHaveNameList =
        musicController.mapSongsGrouping.containsKey(listName);
    if (listName.isNotEmpty && !isHaveNameList) {
      // musicController.listNameGrouping[listName] = selectedArtists;
      final musicGroup =
          MusicGroup(keyName: listName, namesArtists: selectedArtists);
      final boxMusicGroup = Hive.box<MusicGroup>("MusicGroup");
      boxMusicGroup.add(musicGroup);
      musicController.callSongsMethodModel(method: AllSongsMethodModel.getGroupList);
      selectedArtists.clear();
      Get.back();
      Get.back();
    } else {
      Get.snackbar(
          backgroundColor: MyColors.white,
          "Error",
          isHaveNameList ? "This name exists" : "Please enter a name trust ",
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
