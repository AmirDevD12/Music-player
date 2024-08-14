import 'dart:ui';

import 'package:amir_music/core/resource/my_colors.dart';
import 'package:amir_music/core/resource/typography.dart';
import 'package:amir_music/core/widgets/container/secondary_Container.dart';
import 'package:amir_music/core/widgets/item_listview_songs.dart';
import 'package:amir_music/futuer/music_division/data/model_all_songs/model_all_songs.dart';
import 'package:amir_music/futuer/show_group_songs/presentation/controller/music_group_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:shimmer/shimmer.dart';

class MusicGroupPage extends GetView<MusicGroupController> {
  static const routerMusicGroupPage = "/MusicGroupPage";

  const MusicGroupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final  listGroupSongs = Get.arguments["listGroupSongs"];
    final name = Get.arguments["nameList"];

    return Scaffold(
        backgroundColor: MyColors.background,
        body: SingleChildScrollView(
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
                              vertical: 17, horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  onPressed: () {

                                  },
                                  icon: Icon(
                                    Icons.arrow_back,
                                    color: MyColors.white,
                                    size: 35,
                                  )),
                              SizedBox(
                                width: 40,
                                child: IconButton(
                                    onPressed: () {

                                    },
                                    icon:Image.asset("assets/icon/dots.png",color: MyColors.white,

                                    ) ),
                              ),
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
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        name??"",
                        maxLines: 1,
                        style: Fonts.normal.copyWith(
                            color: MyColors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SecondaryContainer(
                      onTap: () {
                        // homeController.toggelWidgetHomePage(homeController.home);
                      },
                      child: Text(
                        "Play All",
                        style: Fonts.xs.copyWith(
                            color: MyColors.white, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),

              GetBuilder(
                builder: (MusicGroupController controller) {
                  return  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: listGroupSongs.length,
                    itemBuilder: (context, index) {
                      final songs = listGroupSongs[index];
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
                          title: songs.title,
                          subTitle: songs.artist,
                          id: songs.id ?? -1,
                          onTap: () {


                          },
                          index: index,
                          changeFavorite: () {},
                          favorite: false,
                        );
                    },
                  );
                },)
            ],
          ),
        ));
  }
}
