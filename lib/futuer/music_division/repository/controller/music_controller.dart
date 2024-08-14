import 'dart:async';
import 'dart:math';

import 'package:amir_music/core/resource/constants.dart';
import 'package:amir_music/core/shardrefrense/shareprerefrens.dart';
import 'package:amir_music/futuer/music_division/data/model_all_songs/model_all_songs.dart';
import 'package:amir_music/futuer/music_division/data/model_hive/music_group.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:on_audio_query/on_audio_query.dart';

class MusicDivisionController extends GetxController {
  final List<SongModel> receiveSongs;

  MusicDivisionController({required this.receiveSongs});

  final appSharedPreferences = AppSharedPreferences();
  bool isFirstLaunch = false;
  final Map<String, List<ModelAllSongs>> listGrouping =
      <String, List<ModelAllSongs>>{}.obs;
  final Map<String, List<String>> listNameGrouping = {
    "Pop": Constants.namePop,
    "classic": Constants.nameClassic,
    "Rap": Constants.nameRap,
    "Nostalgia": Constants.nameNostalgia
  };
  List<SongModel> allSongs = [];
  RxList songsList = <ModelAllSongs>[].obs;
  final Map<String, List<ModelAllSongs>> songsArtist =
      <String, List<ModelAllSongs>>{}.obs;
  final RxBool showSongs = false.obs;
  final ScrollController scrollController = ScrollController();
  final Rx<SongSortType> songSortType = SongSortType.DATE_ADDED.obs;
  RxBool loading = true.obs;
  RxInt visibleItemCount = 10.obs;
  List<ModelAllSongs> songsRandom = [];
  final boxAllSongs = Hive.box<ModelAllSongs>("AllSongs");
  Random random = Random();
  late ModelAllSongs randomSongs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    checkFirstLaunch();

    getAllSongsLocal();
    ever(songsList, (value) {
      everSongsList();
    });
    Future.delayed(const Duration(seconds: 3)).then((value) {
      showSongs.value = true;
      scrollController.addListener(_scrollListener);
      update();
    });
  }

  checkFirstLaunch() {
    final bool check = appSharedPreferences.load(Constants.keyCheckFirstLaunch);

    if (check) {
      isFirstLaunch = true;
    } else {
      appSharedPreferences.saveUserData(true, Constants.keyCheckFirstLaunch);
    }
  }

  void addHiveDataToMap() async {
    final box = Hive.box<MusicGroup>('musicGroup');

    List<MusicGroup> storedGroups = box.values.toList();

    for (var group in storedGroups) {
      if (!listNameGrouping.containsKey(group.keyName)) {
        listNameGrouping[group.keyName] = group.namesArtists;
      } else {
        listNameGrouping[group.keyName]!.addAll(group.namesArtists);
      }
    }
  }

  Future<void> _scrollListener() async {

    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      Future.delayed(const Duration(microseconds: 500)).then((s) {
          if(visibleItemCount.value+50>songsList.length){
            visibleItemCount.value=songsList.length;
          }else {
            visibleItemCount.value += 50;
          }
          update();

      });

    }
  }

  void getGroupList() {
    final groupMap = <String, String>{};
    for (var name in listNameGrouping.keys) {
      for (var value in listNameGrouping[name]!) {
        groupMap[value] = name;
      }
    }

    for (var song in songsList) {
      final modelSong = song as ModelAllSongs;
      for (var value in groupMap.keys) {
        if (song.displayName.contains(value) || song.displayName == value) {
          final groupName = groupMap[value];
          if (listGrouping.containsKey(groupName)) {
            listGrouping[groupName]!.add(modelSong);
          } else {
            listGrouping[groupName!] = [modelSong];
          }
          break;
        }
      }
    }
  }

  getAllSongsLocal({SongSortType? sortType}) async {
    if (!isFirstLaunch) {
      allSongs.assignAll(receiveSongs);
      modelAllSongs();
    } else {
      loadSongs();
      print("*** user lunched previouse ***");
    }
  }

  getListArtist() {
    for (var song in songsList) {
      final singer = song.artist;
      songsArtist.putIfAbsent(singer, () => []).add(song);
    }
  }

  Future<void> modelAllSongs() async {
    final List<ModelAllSongs> models = allSongs.map((songs) {
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
    }).toList();

    await boxAllSongs.addAll(models);
    loadSongs();
  }

  void addSong(ModelAllSongs song) async {
    songsList.add(song);
    await boxAllSongs.add(song);
  }

  void removeSong(ModelAllSongs song) async {
    final index = songsList.indexOf(song);
    if (index != -1) {
      songsList.removeAt(index);
      await boxAllSongs.deleteAt(index);
    }
  }

  void updateSong(int index, ModelAllSongs updatedSong) async {
    if (index >= 0 && index < songsList.length) {
      songsList[index] = updatedSong;
      await boxAllSongs.putAt(index, updatedSong);
      update(['song_$index']); // فقط آیتم خاص را آپدیت می‌کنیم
    }
  }

void changeSortSongs(SongSortType sort){
    if (sort case SongSortType.DATE_ADDED) {
      songsList.sort((a, b) => a.dateAdded!.compareTo(b.dateAdded!));
      songsList.value=songsList.reversed.toList();
      songSortType.value = SongSortType.DATE_ADDED;
    }else if(sort case SongSortType.DISPLAY_NAME){
      songsList.sort((a, b) => a.displayName.compareTo(b.displayName));
      songSortType.value=SongSortType.DISPLAY_NAME;
    }else{
      songsList.sort((a, b) => a.artist.compareTo(b.artist));
      songSortType.value=SongSortType.ARTIST;
    }
    update();
    Get.back();
}
  void loadSongs() {
    final storedSongs = boxAllSongs.values.toList();
    songsList.assignAll(storedSongs);
    final index = random.nextInt(songsList.length - 1);
    randomSongs = songsList[index];
    getListArtist();
    addHiveDataToMap();
    getGroupList();
  }

  everSongsList() {
    getListArtist();
    addHiveDataToMap();
    getGroupList();
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
