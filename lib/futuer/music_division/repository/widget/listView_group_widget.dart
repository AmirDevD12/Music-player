import 'package:amir_music/core/resource/constants.dart';
import 'package:amir_music/core/widgets/item_listview_grouping_music.dart';
import 'package:amir_music/futuer/music_division/repository/controller/music_controller.dart';
import 'package:amir_music/futuer/show_group_songs/presentation/controller/music_group_controller.dart';
import 'package:amir_music/futuer/show_group_songs/presentation/page/music_group_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListviewGroupWidget extends GetView<MusicDivisionController> {
  const ListviewGroupWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      child: Row(
        children: [
          Obx(() {
            final myMap =
            controller.listGrouping.entries.toList();
            return Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.listGrouping.length,
                  itemBuilder: (context, index) {
                    final name = myMap[index].key;
                    final listSongModel = myMap[index].value;
                    final length = listSongModel.length;
                    int randomNumber = 0;
                    if (length != 0) {
                      randomNumber =
                          controller.random.nextInt(length);
                    } else {
                      randomNumber = -1;
                    }
                    return ItemListviewGrouping(
                      title: name,
                      subTitle: length,
                      image:
                      Constants.groupingImageMusic[index],
                      id: listSongModel[randomNumber].id,
                      onTap: () {
                        Get.put(MusicGroupController(
                            musicController: Get.find<
                                MusicDivisionController>()));

                        Get.to(const MusicGroupPage(),
                            arguments: {
                              "listGroupSongs": listSongModel,
                              "nameList": name
                            });
                      },
                    );
                  }),
            );
          }),
        ],
      ),
    )
    ;
  }
}
