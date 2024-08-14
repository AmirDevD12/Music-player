import 'package:amir_music/core/resource/decoration.dart';
import 'package:amir_music/core/resource/typography.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../resource/my_colors.dart';

class ItemListviewGrouping extends StatelessWidget {
  final String image;
  final String title;
  final int subTitle;
  final int? id;
  final Function() onTap;

  const ItemListviewGrouping(
      {super.key,
      required this.image,
      required this.title,
      required this.subTitle,
      required this.id, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return Container(
       
        margin: const EdgeInsets.symmetric(horizontal: 15),
        decoration: DecorationContainer.groupingDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: onTap,
            child: QueryArtworkWidget(
                nullArtworkWidget: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    "assets/images/$image",
                    height: 150,
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                keepOldArtwork: true,
                artworkBorder: const BorderRadius.all(Radius.circular(20)),
                artworkWidth: 150,
                artworkHeight: 150,
                id: id??0,
                type: ArtworkType.AUDIO),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Fonts.sm.copyWith(
                      color: MyColors.white, fontWeight: FontWeight.bold),
                ),
                Text(
                  "number: ${subTitle.toString()}",
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
