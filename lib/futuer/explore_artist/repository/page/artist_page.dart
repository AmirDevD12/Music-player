import 'dart:ui';

import 'package:amir_music/core/resource/my_colors.dart';
import 'package:amir_music/core/resource/typography.dart';
import 'package:amir_music/core/widgets/item_listview_songs.dart';
import 'package:amir_music/futuer/artist_songs/repository/controller/artist_song_controller.dart';
import 'package:amir_music/futuer/artist_songs/repository/page/artist_song_page.dart';
import 'package:amir_music/futuer/explore_artist/repository/controller/artist_controller.dart';
import 'package:amir_music/futuer/music_division/data/model_all_songs/model_all_songs.dart';
import 'package:amir_music/futuer/music_division/repository/controller/music_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:shimmer/shimmer.dart';

class ExploreArtist extends GetView<ExploreArtistController> {
  static const routerExploreArtist = "/ExploreArtist";

  const ExploreArtist({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors.background,
        body: SingleChildScrollView(
          controller: controller.scrollController,
          child: Column(
            children: [
              Container(
                  width: double.infinity,
                  height: 270,
                  color: Colors.black.withOpacity(1),
                  alignment: Alignment.center,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      // Original Image
                      QueryArtworkWidget(
                          artworkFit: BoxFit.cover,
                          nullArtworkWidget: Container(
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/songg.jpg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          id: controller.randomSongs.id ?? -1,
                          type: ArtworkType.AUDIO),
                      // Blurred Overlay
                      Positioned.fill(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Container(
                              // Adjust the opacity here
                              ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 15),
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    // if (widget.back == "HomeWidget") {
                                    //   // homeController.toggelWidgetHomePage(
                                    //   //     homeController.home);
                                    // } else {
                                    //   // homeController.toggelWidgetHomePage(
                                    //   //     homeController.exploreArtist.value);
                                    // }
                                  },
                                  icon: Icon(
                                    Icons.arrow_back,
                                    color: MyColors.white,
                                    size: 35,
                                  )),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, bottom: 30),
                          child: Row(children: [
                            QueryArtworkWidget(
                                nullArtworkWidget: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(
                                    "assets/images/songg.jpg",
                                    height: 150,
                                    width: 150,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                keepOldArtwork: true,
                                artworkBorder:
                                    const BorderRadius.all(Radius.circular(20)),
                                artworkWidth: 150,
                                artworkHeight: 150,
                                id: controller.randomSongs.id ?? -1,
                                type: ArtworkType.AUDIO),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          softWrap: true,
                                          overflow: TextOverflow.ellipsis,
                                          style: Fonts.sm.copyWith(
                                              color: MyColors.white,
                                              fontWeight: FontWeight.bold),
                                          maxLines: 1,
                                          controller.randomSongs.displayName,
                                        ),
                                        Text(
                                          overflow: TextOverflow.ellipsis,
                                          style: Fonts.xs.copyWith(
                                              color: MyColors.white,
                                              fontWeight: FontWeight.bold),
                                          controller.randomSongs.artist,
                                          maxLines: 1,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: MyColors.white, width: 1)),
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 15),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 40),
                                    child: Text(
                                      "Play",
                                      style: Fonts.xs.copyWith(
                                          color: MyColors.white,
                                          fontWeight: FontWeight.bold),
                                      maxLines: 1,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ]),
                        ),
                      )
                    ],
                  )),
          GetBuilder(
            builder: (ExploreArtistController controller) {
              return  ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.itemShow.value,
                itemBuilder: (context, index) {
                  final singer = controller.artists.keys.toList()[index];
                  final List<ModelAllSongs> songs = controller.artists[singer]!;
                  if (index < controller.itemShow.value - 1 ||
                      controller.itemShow.value ==
                          controller.artists.length) {
                    return controller.showSongs.value == false
                        ? Shimmer.fromColors(
                      baseColor: Colors.grey[500]!,
                      highlightColor: Colors.white,
                      child: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        padding: const EdgeInsets.symmetric(
                          vertical: 30,
                        ),
                        color: Colors.green,
                        child: const SizedBox(),
                      ),
                    )
                        : ItemListviewSongs(
                      title: songs[0].artist,
                      subTitle: "number: ${songs.length.toString()}",
                      id: songs[0].id ?? -1,
                      onTap: () {
                        Get.put(ArtistSongController(
                            musicController: Get.find<MusicDivisionController>()));

                        Get.to(const ArtistSongPage(),
                            arguments: {"listArtistSongs": songs});
                      },
                      index: index,
                      changeFavorite: () {},
                      favorite: false,
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              );
            },)
            ],
          ),
        ));
  }
}
