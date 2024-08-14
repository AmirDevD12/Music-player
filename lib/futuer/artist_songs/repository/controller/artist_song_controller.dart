
import 'dart:math';

import 'package:amir_music/futuer/music_division/data/model_all_songs/model_all_songs.dart';
import 'package:amir_music/futuer/music_division/repository/controller/music_controller.dart';
import 'package:get/get.dart';

class ArtistSongController extends GetxController{
  final MusicDivisionController musicController ;
  ArtistSongController({required this.musicController});
  Random random = Random();
  late final ModelAllSongs randomSongs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    final index = random.nextInt(musicController.songsList.length- 1);
    randomSongs = musicController.songsList[index];
  }
}