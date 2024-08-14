import 'dart:math';
import 'dart:ui';

import 'package:amir_music/core/resource/my_colors.dart';
import 'package:amir_music/core/resource/typography.dart';
import 'package:amir_music/core/widgets/item_listview_songs.dart';
import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';

class SongsArtist extends StatefulWidget {
  final List<SongModel> songList;
  final String back;

  const SongsArtist({super.key, required this.songList, required this.back});

  @override
  State<SongsArtist> createState() => _SongsArtistState();
}

class _SongsArtistState extends State<SongsArtist> {

  Random random = Random();
  int id = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    id = random.nextInt(widget.songList.length);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                      id: widget.songList[id].id,
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
                                if (widget.back == "HomeWidget") {
                                  // homeController.toggelWidgetHomePage(
                                  //     homeController.home);
                                } else {
                                  // homeController.toggelWidgetHomePage(
                                  //     homeController.exploreArtist.value);
                                }
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
                            id: widget.songList[id].id,
                            type: ArtworkType.AUDIO),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 190,
                              child: Text(
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                style: Fonts.sm.copyWith(
                                    color: MyColors.white,
                                    fontWeight: FontWeight.bold),
                                maxLines: 1,
                                widget.songList[id].artist ?? "",
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 190,
                              child: Text(
                                overflow: TextOverflow.ellipsis,
                                style: Fonts.xs.copyWith(
                                    color: MyColors.white,
                                    fontWeight: FontWeight.bold),
                                widget.songList[id].title,
                                maxLines: 1,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: MyColors.white, width: 1)),
                              margin: const EdgeInsets.symmetric(vertical: 15),
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
                        )
                      ]),
                    ),
                  )
                ],
              )),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 15),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 200,
                      child: Text(
                        widget.songList[id].artist ?? "",
                        style: Fonts.sm.copyWith(
                            fontSize: 25,
                            color: MyColors.white,
                            fontWeight: FontWeight.bold),
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: widget.songList.length,
                  itemBuilder: (context, index) {
                    final songs = widget.songList[index];
                    return ItemListviewSongs(
                      subTitle: songs.artist ?? "",
                      title: songs.title,
                      id: songs.id,
                      onTap: () {}, changeFavorite: () {  }, index: index, favorite: false,

                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
