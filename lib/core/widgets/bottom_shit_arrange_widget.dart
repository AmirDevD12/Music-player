import 'package:amir_music/core/resource/my_colors.dart';
import 'package:amir_music/core/resource/typography.dart';
import 'package:amir_music/futuer/home/repository/controller/home_controller.dart';
import 'package:amir_music/futuer/music_division/repository/controller/music_controller.dart';
import 'package:amir_music/view_model/songs_vm/controller/songs_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';

import 'arrangment_song_widget.dart';
import 'container/arrange_container.dart';

class BottomShitArrangeWidget extends StatelessWidget {
  BottomShitArrangeWidget({
    super.key,
  });

  final HomeController homeController = Get.find();
  final SongsController songsController = Get.find();

  final MusicDivisionController musicDivisionController =Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text('Arrangement of songs',
                style: Fonts.normal
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 25)),
          ),
          const SizedBox(height: 16),
          ArrangementContainer(
              onTap: () {
                homeController.showSongs.value = false;
                musicDivisionController.songsList.sort((a, b) => a.dateAdded!.compareTo(b.dateAdded!));
                Get.back();
                Future.delayed(const Duration(seconds: 2)).then((value) {
                  homeController.showSongs.value = true;
                });
              },
              color: musicDivisionController.songSortType.value == SongSortType.DATE_ADDED
                  ? MyColors.backIcon
                  : MyColors.white,
              child: ArrangementWidget(
                arrange: 'Based on add time',
                showIcon:
                musicDivisionController.songSortType.value == SongSortType.DATE_ADDED
                        ? true
                        : false,
              )),
          ArrangementContainer(
              onTap: () {
                homeController.showSongs.value = false;
                musicDivisionController.songsList.sort((a, b) => a.displayName.compareTo(b.displayName));


                Get.back();
                Future.delayed(const Duration(seconds: 2)).then((value) {
                  homeController.showSongs.value = true;
                });
              },
              color:musicDivisionController.songSortType.value==SongSortType.DISPLAY_NAME

              ? MyColors.backIcon
                  : MyColors.white,
              child: ArrangementWidget(
                arrange: 'Based on name',
                showIcon: musicDivisionController.songSortType.value==SongSortType.DISPLAY_NAME
                    ? true
                    : false,
              )),
          ArrangementContainer(
              onTap: () {
                homeController.showSongs.value = false;
                musicDivisionController.songsList.sort((a, b) => a.artist!.compareTo(b.artist!));


                Get.back();
                Future.delayed(const Duration(seconds: 2)).then((value) {
                  homeController.showSongs.value = true;
                });
              },
              color:  musicDivisionController.songSortType.value==SongSortType.ARTIST
                  ? MyColors.backIcon
                  : MyColors.white,
              child: ArrangementWidget(
                arrange: 'Based on artist',
                showIcon:  musicDivisionController.songSortType.value==SongSortType.ARTIST
                    ? true
                    : false,
              )),
        ],
      ),
    );
  }
}
