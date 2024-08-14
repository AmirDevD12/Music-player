import 'package:amir_music/core/resource/my_colors.dart';
import 'package:amir_music/core/resource/typography.dart';
import 'package:amir_music/core/widgets/bottom_shit_arrange_widget.dart';
import 'package:amir_music/core/widgets/bottomnavigation_widget.dart';
import 'package:amir_music/core/widgets/container/bottom_shit_container.dart';
import 'package:amir_music/core/widgets/container/gride_item_container.dart';
import 'package:amir_music/core/widgets/container/secondary_Container.dart';
import 'package:amir_music/core/widgets/textfild_with_text.dart';
import 'package:amir_music/futuer/explore_artist/repository/controller/artist_controller.dart';
import 'package:amir_music/futuer/explore_artist/repository/page/artist_page.dart';
import 'package:amir_music/futuer/music_division/repository/controller/music_controller.dart';
import 'package:amir_music/futuer/music_division/repository/widget/listView_artist_Widget.dart';
import 'package:amir_music/futuer/music_division/repository/widget/listView_group_widget.dart';
import 'package:amir_music/futuer/music_division/repository/widget/listView_songs_Widget.dart';
import 'package:amir_music/futuer/select_name_songs/repository/controller/select_name_songs_controller.dart';
import 'package:amir_music/futuer/select_name_songs/repository/page/select_name_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class MusicDivision extends GetView<MusicDivisionController> {
  const MusicDivision({super.key});

  static const routeMusicDivision = "/MusicDivision";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors.background,
        body: SafeArea(
          child: Padding(
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
                        padding: const EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Grouping",
                              style: Fonts.normal.copyWith(
                                  color: MyColors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            SecondaryContainer(
                              onTap: () {
                                Get.put(SelectNameSongsController());
                                Get.toNamed(ArtistSelectionScreen
                                    .routerArtistSelectionScreen);
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
                      const ListviewGroupWidget(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Artist",
                              style: Fonts.normal.copyWith(
                                  color: MyColors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            SecondaryContainer(
                              onTap: () {
                                Get.put(ExploreArtistController(
                                    musicController:
                                        Get.find<MusicDivisionController>()));

                                Get.to(const ExploreArtist());
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
                      const ListviewArtistWidget(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "songs",
                              style: Fonts.normal.copyWith(
                                  color: MyColors.white,
                                  fontWeight: FontWeight.bold),
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
                  const ListviewSongsWidget()
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: const BottomNavigationWidget());
  }
}
