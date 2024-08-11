import 'package:amir_music/view_model/songs_vm/receive_songs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectNameSongsController extends GetxController {
  final ReceiveSongs receiveSongs = Get.find();
  RxList<String> selectedArtists = <String>[].obs;
  RxList<String> artistNames = <String>[].obs;
  final TextEditingController nameController = TextEditingController();

  void loadArtistNames() {
    final nameAll = receiveSongs.getArtistNames();
    artistNames.assignAll(nameAll);
  }

  @override
  void onInit() {
    super.onInit();
    loadArtistNames();
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
}
