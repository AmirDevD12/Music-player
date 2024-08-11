import 'dart:math';
import 'package:amir_music/futuer/music_division/data/model_all_songs/model_all_songs.dart';
import 'package:flutter/material.dart';
import 'package:amir_music/core/resource/constants.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'item_listview_grouping_music.dart';

class ElementGrouping extends StatelessWidget {
  final List<ModelAllSongs> listSongModel;
  final int index;
  final String? title;
  final String? subTitle;
  const   ElementGrouping({super.key, required this.index, required this.listSongModel, required this.title, required this.subTitle,});

  @override
  Widget build(BuildContext context) {
    Random random = Random();
    int randomNumber=0;
    if(listSongModel.isNotEmpty){
      randomNumber = random.nextInt(listSongModel.length);
    }else{
      randomNumber=-1;
    }
    return SizedBox(
      height: 200,
      child: ItemListviewGrouping(
        image: Constants.groupingImageMusic[index],
        title: title!=null?title!:Constants.groupingMusic[index],
        subTitle:subTitle!=null?subTitle!: Constants.groupingMusic[index],
        id: listSongModel[randomNumber].id,
      ),
      ///change sized box !!!
    );
    // return FutureBuilder(
    //   future: future,
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return const Center(child: CircularProgressIndicator());
    //     } else if (snapshot.hasError) {
    //       return Center(child: Text('Error: ${snapshot.error}'));
    //     } else {
    //       Random random = Random();
    //       int randomNumber=0;
    //       final songs = snapshot.data!;
    //       if(songs.length>0){
    //          randomNumber = random.nextInt(songs.length);
    //       }else{
    //         randomNumber=-1;
    //       }
    //       return randomNumber!=-1?SizedBox(
    //         height: 200,
    //         child: ItemListviewGrouping(
    //           image: Constants.groupingImageMusic[index],
    //           title: Constants.groupingMusic[index],
    //           subTitle: Constants.groupingMusic[index],
    //           id: snapshot.data![randomNumber].id,
    //         ),
    //       ):const SizedBox();
    //     }
    //   },
    // );
  }
}
