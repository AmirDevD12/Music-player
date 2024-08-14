import 'dart:math';

import 'package:amir_music/futuer/music_division/data/model_all_songs/model_all_songs.dart';
import 'package:amir_music/futuer/music_division/repository/controller/music_controller.dart';
import 'package:get/get.dart';

class MusicGroupController extends GetxController {
  final MusicDivisionController musicController;

  MusicGroupController({required this.musicController});

  final Map<String, List<ModelAllSongs>> group = {};
  RxBool showSongs = false.obs;
  late final ModelAllSongs randomSongs;
  RxBool loading = false.obs;

  Random random = Random();

  @override
  void onInit() {
    super.onInit();
    showSongs.value = false;
    final index = random.nextInt(musicController.songsList.length - 1);
    randomSongs = musicController.songsList[index];
    group.assignAll(musicController.mapSongsGrouping);

    Future.delayed(const Duration(milliseconds: 500)).then((value) {
      showSongs.value = true;
      update();
    });
  }
}
