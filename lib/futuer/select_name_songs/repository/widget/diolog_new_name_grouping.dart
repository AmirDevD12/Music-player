import 'package:amir_music/futuer/music_division/repository/controller/music_controller.dart';
import 'package:amir_music/futuer/select_name_songs/repository/controller/select_name_songs_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        /// check name
       selectController.checkNameGroupList();
      },
      child: Text("Confirm"),
    ),
    cancel: ElevatedButton(
      onPressed: () {
        Get.back();
      },
      child: Text("Cancel"),
    ),
  );
}
