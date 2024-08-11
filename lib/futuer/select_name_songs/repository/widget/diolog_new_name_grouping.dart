import 'package:amir_music/futuer/music_division/data/model_hive/music_group.dart';
import 'package:amir_music/futuer/music_division/repository/controller/music_controller.dart';
import 'package:amir_music/futuer/select_name_songs/repository/controller/select_name_songs_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

void showNameInputDialog() {
  final SelectNameSongsController selectController = Get.find();
  final MusicDivisionController musicDivisionController =Get.find();
  Get.defaultDialog(

    title: "Enter List Name",
    content: Column(
      children: [
        TextField(
          controller: selectController.nameController,
          decoration: InputDecoration(
            labelText: 'Enter Name for List',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
        ),
      ],
    ),
    confirm: ElevatedButton(
      onPressed: () {
        final listName = selectController.nameController.text;
        if (listName.isNotEmpty) {
          musicDivisionController.listNameGrouping[listName]=selectController.selectedArtists;
          final musicGroup =MusicGroup(keyName: listName, namesArtists:selectController.selectedArtists );
          final boxMusicGroup = Hive.box<MusicGroup>("MusicGroup");
          boxMusicGroup.add(musicGroup);
          musicDivisionController.getGroupList();
          Get.back();
          Get.back();
        } else {
          Get.snackbar("Error", "Please enter a name for the list.",
              snackPosition: SnackPosition.BOTTOM);
        }

      },
      child: Text("Confirm"),
    ),
    cancel: ElevatedButton(
      onPressed: () {
        Get.back(); // بستن دیالوگ بدون انجام کاری
      },
      child: Text("Cancel"),
    ),
  );
}
