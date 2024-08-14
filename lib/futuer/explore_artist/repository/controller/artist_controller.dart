import 'dart:math';

import 'package:amir_music/futuer/music_division/data/model_all_songs/model_all_songs.dart';
import 'package:amir_music/futuer/music_division/repository/controller/music_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExploreArtistController extends GetxController {
  final MusicDivisionController musicController;

  ExploreArtistController({required this.musicController});

  final Map<String, List<ModelAllSongs>> artists = {};
  RxBool showSongs = false.obs;
  late final ModelAllSongs randomSongs;
  RxInt itemShow = 0.obs;
  RxBool loading = false.obs;
  final ScrollController scrollController = ScrollController();
  Random random = Random();

  @override
  void onInit() {
    super.onInit();
    showSongs.value = false;
    final index = random.nextInt(musicController.songsList.length - 1);
    randomSongs = musicController.songsList[index];
    artists.assignAll(musicController.mapSongsArtist);
    itemShow.value = artists.length > 10 ? 10 : artists.length;

    Future.delayed(const Duration(milliseconds: 500)).then((value) {
      showSongs.value = true;
      update();
      scrollController.addListener(_scrollListener);
    });
  }

  Future<void> _scrollListener() async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      Future.delayed(const Duration(milliseconds: 500)).then((s) {
        if (itemShow.value + 50 > artists.length) {
          itemShow.value = artists.length;
        } else {
          itemShow.value += 50;
        }
        update();
      });
    }
  }
}
