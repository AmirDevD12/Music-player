import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:amir_music/core/resource/my_colors.dart';
import 'package:amir_music/core/resource/typography.dart';

class ItemListviewArtist extends StatelessWidget {
  final int id;
  final String nameArtist;
  const ItemListviewArtist({super.key, required this.id, required this.nameArtist});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: QueryArtworkWidget(
                nullArtworkWidget: const CircleAvatar(
                  radius: 50,
                  backgroundImage:AssetImage("assets/images/songg.jpg") ,
                ),
                keepOldArtwork: true,
                artworkBorder: const BorderRadius.all(
                    Radius.circular(120)),
                artworkWidth: 100,
                artworkHeight: 100,
                id: id,
                type: ArtworkType.AUDIO),
          ),
          const SizedBox(height: 5,),
          SizedBox(
            width: 100,
            child: Text(
              nameArtist,
              maxLines: 1,
              textAlign: TextAlign.center,
              style: Fonts.xs.copyWith(
                  color: MyColors.white,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
