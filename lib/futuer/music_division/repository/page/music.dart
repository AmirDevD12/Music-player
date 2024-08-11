import 'package:amir_music/core/resource/my_colors.dart';
import 'package:amir_music/core/resource/typography.dart';
import 'package:amir_music/core/widgets/FutureBuilder_widget.dart';
import 'package:amir_music/core/widgets/bottom_shit_arrange_widget.dart';
import 'package:amir_music/core/widgets/container/bottom_shit_container.dart';
import 'package:amir_music/core/widgets/container/gride_item_container.dart';
import 'package:amir_music/core/widgets/container/secondary_Container.dart';
import 'package:amir_music/core/widgets/item_listview_artist.dart';
import 'package:amir_music/core/widgets/textfild_with_text.dart';
import 'package:amir_music/futuer/music_division/data/model_all_songs/model_all_songs.dart';
import 'package:amir_music/futuer/music_division/repository/controller/music_controller.dart';
import 'package:amir_music/futuer/music_division/repository/widget/listView_songs.dart';
import 'package:amir_music/futuer/select_name_songs/repository/page/select_name_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';

// extension Subscript<T> on Iterable<T> {
//   T? operator [](int index) => length > index ? elementAt(index) : null;
// }
class MusicDivision extends GetView<MusicDivisionController> {
  const MusicDivision({super.key});

  static const routeHomeWidget = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 15),
      child: SingleChildScrollView(
        controller: controller.scrollController,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Row(
                children: [
                  GridSortContainer(
                    onTap: () {
                      Get.bottomSheet(BottomShitContainer(
                          child: BottomShitArrangeWidget()));
                    },
                    child: SvgPicture.asset(
                      'assets/icon/menu.svg',
                      semanticsLabel: 'My SVG Image',
                      height: 20,
                      color: MyColors.backIcon,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Expanded(
                      child: TextFiledText(
                    textInput: 'search',
                  ))
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding:  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Grouping",
                        style: Fonts.normal.copyWith(
                            color: MyColors.white, fontWeight: FontWeight.bold),
                      ),
                      SecondaryContainer(
                        onTap: () {
                          Get.toNamed(ArtistSelectionScreen.routerArtistSelectionScreen);
                        },
                        child: Text(
                          "Add Grouping",
                          style: Fonts.xs.copyWith(
                              color: MyColors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 200,
                  child: Row(
                    children: [
                      Obx(() {
                        final myMap = controller.listGrouping.entries.toList();
                        return Expanded(
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.listGrouping.length,
                              itemBuilder: (context, index) {
                                final name = myMap[index].key;
                                final listSongModel =
                                    myMap[index].value as List<ModelAllSongs>;
                                final length = listSongModel.length.toString();
                                return ElementGrouping(
                                  index: index,
                                  listSongModel: listSongModel,
                                  title: name,
                                  subTitle: length,
                                );
                              }),
                        );
                      }),

                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15.0, horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Artist",
                        style: Fonts.normal.copyWith(
                            color: MyColors.white, fontWeight: FontWeight.bold),
                      ),
                      SecondaryContainer(
                        onTap: () {
                          // homeController.changeIndexPage(1);
                          // homeController.toggelWidgetHomePage(homeController.indexPage.value);
                        },
                        child: Text(
                          "Explore more",
                          style: Fonts.xs.copyWith(
                              color: MyColors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 150,
                  child: Row(
                    children: [
                      Obx(
                        () => Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: controller.songsArtist.length > 100
                                ? 10
                                : controller.songsArtist.length ~/ 2,
                            itemBuilder: (context, index) {
                              final singer =
                                  controller.songsArtist.keys.toList()[index];
                              final songs = controller.songsArtist[singer]!.first;
                              return GestureDetector(
                                onTap: () {
                                  // homeController.toggelWidgetHomePage(
                                  //     SongsArtist(
                                  //         songList: songsBySinger[singer]!, back: "HomeWidget",));
                                },
                                child: SizedBox(
                                  height: 150,
                                  child: ItemListviewArtist(
                                      id: songs.id,
                                      nameArtist: songs.artist.toString()),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "songs",
                        style: Fonts.normal.copyWith(
                            color: MyColors.white, fontWeight: FontWeight.bold),
                      ),
                      SecondaryContainer(
                        onTap: () {
                          // SongSortType songSort = SongSortType.DATE_ADDED;
                          // if (homeController.saveSorting.value ==
                          //     'Based on name') {
                          //   songSort = SongSortType.DISPLAY_NAME;
                          // } else if (homeController.saveSorting.value ==
                          //     'Based on artist') {
                          //   songSort = SongSortType.ARTIST;
                          // }
                          // songsViewController.changeBuildSongs(
                          //     FutureBuilderSongs(
                          //         futureSongs: songs.getSongs(
                          //             songSortType: songSort)));
                          // homeController.changeIndexPage(3);
                        },
                        child: Text(
                          "Explore more",
                          style: Fonts.xs.copyWith(
                              color: MyColors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            DivisionSongsList()
          ],
        ),
      ),
    );
  }
}
