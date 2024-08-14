import 'dart:async';
import 'dart:math';
import 'package:amir_music/core/models/songs_method_model.dart';
import 'package:amir_music/futuer/music_division/data/model_all_songs/model_all_songs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';

class MusicDivisionController extends GetxController {
  final SongsMethodModel songsMethodModel;

  MusicDivisionController({required this.songsMethodModel});

  final RxList songsList = <ModelAllSongs>[].obs;
  final Map<String, List<ModelAllSongs>> mapSongsGrouping =
      <String, List<ModelAllSongs>>{}.obs;
  final Map<String, List<ModelAllSongs>> mapSongsArtist =
      <String, List<ModelAllSongs>>{}.obs;
  final RxBool showSongs = false.obs;
  final ScrollController scrollController = ScrollController();
  final Rx<SongSortType> songSortType = SongSortType.DATE_ADDED.obs;
  final RxInt visibleItemCount = 10.obs;
  final Random random = Random();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    callSongsMethodModel( method: AllSongsMethodModel.loadSongs,);
    callSongsMethodModel( method: AllSongsMethodModel.getGroupList,);
    callSongsMethodModel( method: AllSongsMethodModel.getListArtist,);
    Future.delayed(const Duration(seconds: 3)).then((value) {
      showSongs.value = true;
      scrollController.addListener(_scrollListener);
      update();
    });
  }

  Future<void> _scrollListener() async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      Future.delayed(const Duration(microseconds: 500)).then((s) {
        if (visibleItemCount.value + 50 > songsList.length) {
          visibleItemCount.value = songsList.length;
        } else {
          visibleItemCount.value += 50;
        }
        update();
      });
    }
  }

  // void getGroupList() {}
  //
  // getListArtist() {}
  //
  // void addSong(ModelAllSongs song) async {}
  //
  // void removeSong(ModelAllSongs song) async {}
  //
  // void updateSong(int index, ModelAllSongs updatedSong) async {}
  //
  // void changeSortSongs(SongSortType sort) {}
  //
  // void loadSongs() {}

  void callSongsMethodModel(
      { ModelAllSongs? song,
      required AllSongsMethodModel method,
      int? index,
      SongSortType? sort}) {
    switch (method) {
      case AllSongsMethodModel.addSong:
      // TODO: Handle this case.
      case AllSongsMethodModel.removeSong:
      // TODO: Handle this case.
      case AllSongsMethodModel.updateSong:
      // TODO: Handle this case.
      case AllSongsMethodModel.changeSortSongs:
        songsList.value=songsMethodModel.changeSortSongs(sort: sort!);
        songSortType.value=sort;
        update();
        Get.back();
      // TODO: Handle this case.
      case AllSongsMethodModel.loadSongs:
        // TODO: Handle this case.
        songsList.value=songsMethodModel.songsList;

      case AllSongsMethodModel.getGroupList:
        // TODO: Handle this case.
        mapSongsGrouping.assignAll(songsMethodModel.groupMap);
      case AllSongsMethodModel.getListArtist:
        // TODO: Handle this case.
        mapSongsArtist.assignAll(songsMethodModel.artistMap);
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    showSongs.value = false;

    scrollController.removeListener(_scrollListener);
    showSongs.value = false;
  }
}

enum AllSongsMethodModel {
  addSong,
  removeSong,
  updateSong,
  changeSortSongs,
  loadSongs,
  getGroupList,
  getListArtist
}
