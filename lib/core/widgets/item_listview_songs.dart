import 'package:amir_music/core/resource/my_colors.dart';
import 'package:amir_music/core/resource/typography.dart';
import 'package:amir_music/futuer/explore_artist/repository/page/artist_page.dart';
import 'package:amir_music/futuer/home/repository/controller/home_controller.dart';
import 'package:amir_music/futuer/home/repository/page/home_view.dart';
import 'package:amir_music/futuer/music_division/repository/page/music.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:shimmer/main.dart';

class ItemListviewSongs extends StatefulWidget {
  final String subTitle;
  final String title;
  final int id;
  final bool favorite;
  final Function() onTap;

  final Function() changeFavorite;
  final int index;

  const ItemListviewSongs({
    super.key,
    required this.subTitle,
    required this.title,
    required this.id,
    required this.onTap,
    required this.changeFavorite,
    required this.index,
    required this.favorite,
  });

  @override
  State<ItemListviewSongs> createState() => _ItemListviewSongsState();
}

class _ItemListviewSongsState extends State<ItemListviewSongs> {


  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: widget.onTap,
      trailing:Get.routing.current==MusicDivision.routeMusicDivision? GestureDetector(
        onTap:widget.changeFavorite,
        child: Image.asset(
          "assets/icon/${widget.favorite ? "heart.png" : "like.png"}",
          width: 30,
          color: Colors.red,
        ),
      ):const SizedBox(),
      title: Text(
        style: Fonts.sm
            .copyWith(color: MyColors.white, fontWeight: FontWeight.bold),
        maxLines: 1,
        widget.title,
      ),
      subtitle: Text(
        style: Fonts.xs
            .copyWith(color: MyColors.subTitle, fontWeight: FontWeight.bold),
        maxLines: 1,
        widget.subTitle,
      ),
      leading: QueryArtworkWidget(
          nullArtworkWidget: Image.asset("assets/icon/vinyl-record.png"),
          artworkWidth: 60,
          artworkHeight: 60,
          artworkFit: BoxFit.cover,
          artworkBorder: const BorderRadius.all(Radius.circular(5)),
          id: widget.id,
          type: ArtworkType.AUDIO),
    );
  }
}
