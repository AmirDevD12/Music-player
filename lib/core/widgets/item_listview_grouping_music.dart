import 'package:amir_music/core/resource/typography.dart';
import 'package:amir_music/core/widgets/container/grouping_music.dart';
import 'package:amir_music/futuer/home/repository/controller/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../resource/my_colors.dart';

class ItemListviewGrouping extends StatefulWidget {
  final String image;
  final String title;
  final String subTitle;
  final int? id;

  const ItemListviewGrouping(
      {super.key,
      required this.image,
      required this.title,
      required this.subTitle,
      required this.id});
  @override
  State<ItemListviewGrouping> createState() => _ItemListviewGroupingState();
}

class _ItemListviewGroupingState extends State<ItemListviewGrouping> {
  // final SongList songs = Get.find();
  // final SongsViewController songsViewController = Get.find();
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GroupingMusicContainer(
      onTap: () async {
        // if(widget.title=="Favorite"){
        //   Get.find<FavoriteController>().updateFavorite(true);
        // }
        // var boxNamePlayList = await Hive.openBox<SaveSong>(widget.title);
        // Future<List<SongModel>> futureSong = songs.getSongs();
        // switch (widget.title) {
        //   case "Pop":
        //     futureSong = songs.groupListSongs(Constants.namePop);
        //     break;
        //   case "Rap":
        //     futureSong = songs.groupListSongs(Constants.nameRap);
        //     break;
        //   case "Classic":
        //     futureSong = songs.groupListSongs(Constants.nameClassic);
        //     break;
        //   case "Nostalgia":
        //     futureSong = songs.groupListSongs(Constants.nameNostalgia);
        //   case "Songs":
        //     futureSong=songs.getSongs();
        //   case "Album":
        //     // futureSong=songs.getAlbums();
        //     break;
        //   case "Recent Add":
        //     futureSong = songs.recentAdd();
        //   case "Artist":
        //     break;
        //   default:
        //     futureSong = songs.getSongsByIndex(boxNamePlayList.values.toList());
        //     break;
        // }
        // if (widget.title != "Artist") {
        //   songsViewController
        //       .changeBuildSongs(FutureBuilderSongs(futureSongs: futureSong));
        //   homeController.changeIndexPage(3);
        // }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QueryArtworkWidget(
              nullArtworkWidget: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  "assets/images/${widget.image}",
                  height: 150,
                  width: 150,
                  fit: BoxFit.cover,
                ),
              ),
              keepOldArtwork: true,
              artworkBorder: const BorderRadius.all(Radius.circular(20)),
              artworkWidth: 150,
              artworkHeight: 150,
              id: widget.id??0,
              type: ArtworkType.AUDIO),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: Fonts.sm.copyWith(
                      color: MyColors.white, fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.subTitle,
                  style: Fonts.xs.copyWith(
                      color: MyColors.subTitle, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
