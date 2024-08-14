import 'package:amir_music/core/resource/my_colors.dart';
import 'package:amir_music/core/resource/typography.dart';
import 'package:amir_music/futuer/music_division/repository/controller/music_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';

import 'arrangment_song_widget.dart';
import 'container/arrange_container.dart';

class BottomShitArrangeWidget extends GetView<MusicDivisionController> {
  const BottomShitArrangeWidget({
    super.key,
  });

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
                controller.callSongsMethodModel(
                    sort: SongSortType.DATE_ADDED,
                    method: AllSongsMethodModel.changeSortSongs);
              },
              color: controller.songSortType.value == SongSortType.DATE_ADDED
                  ? MyColors.backIcon
                  : MyColors.white,
              child: ArrangementWidget(
                arrange: 'Based on add time',
                showIcon:
                    controller.songSortType.value == SongSortType.DATE_ADDED
                        ? true
                        : false,
              )),
          ArrangementContainer(
            onTap: () async {
              controller.callSongsMethodModel(
                  sort: SongSortType.DISPLAY_NAME,
                  method: AllSongsMethodModel.changeSortSongs);            },
            color: controller.songSortType.value == SongSortType.DISPLAY_NAME
                ? MyColors.backIcon
                : MyColors.white,
            child: ArrangementWidget(
              arrange: 'Based on name',
              showIcon:
                  controller.songSortType.value == SongSortType.DISPLAY_NAME
                      ? true
                      : false,
            ),
          ),
          ArrangementContainer(
              onTap: () {
                controller.callSongsMethodModel(
                    sort: SongSortType.ARTIST,
                    method: AllSongsMethodModel.changeSortSongs);              },
              color: controller.songSortType.value == SongSortType.ARTIST
                  ? MyColors.backIcon
                  : MyColors.white,
              child: ArrangementWidget(
                arrange: 'Based on artist',
                showIcon: controller.songSortType.value == SongSortType.ARTIST
                    ? true
                    : false,
              )),
        ],
      ),
    );
  }
}
