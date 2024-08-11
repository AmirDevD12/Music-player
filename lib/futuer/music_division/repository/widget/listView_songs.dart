import 'dart:async';

import 'package:amir_music/core/widgets/item_listview_songs.dart';
import 'package:amir_music/futuer/music_division/data/model_all_songs/model_all_songs.dart';
import 'package:amir_music/futuer/music_division/repository/controller/music_controller.dart';
import 'package:amir_music/view_model/audio_controller/audio_controller.dart';
import 'package:amir_music/view_model/songs_vm/controller/songs_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:shimmer/shimmer.dart';

class DivisionSongsList extends GetView<MusicDivisionController> {
  // final Future futureSongs;

  DivisionSongsList({
    super.key,
  });

  final SongsController songsController = Get.find();

  final AudioPlayer audioPlayer = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.songsList.isNotEmpty
        ? ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.songsList.length > 10
                ? controller.visibleItemCount.value
                : controller.songsList.length,
            itemBuilder: (context, index) {
              final ModelAllSongs song = controller.songsList[index];
              if (controller.songsRandom.length < 9) {
                controller.songsRandom.add(song);
              }
              if (index < controller.visibleItemCount.value - 1) {
                return Obx(
                  () => controller.showSongs.value == false
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
                          subTitle: song.displayName,
                          title: song.title,
                          id: song.id ?? -1,
                          index: index,
                          favorite: song.favorite,
                          onTap: () async {
                            // _onSongTap(index);

                            // if (homeController.pageView[5].toString() !=
                            //     "PlayingMusicView" ) {
                            //   homeController.pageView
                            //       .add(PlayingMusicView(songModel: controller.songsList));
                            // }
                            // Get.find<AudioController>().updateCurrentIndex(
                            //     Get.find<AudioPlayer>().currentIndex ?? 0);
                            // homeController.changeIndexPage(5);
                          },
                    changeFavorite: () async {
                            try {
                              ModelAllSongs updatedSong = song.copyWith(
                                  favorite: song.favorite ? false : true);

                              controller.updateSong(index, updatedSong);

                              // final boxNamePlayList =
                              //     await Hive.openBox<SaveNamePlayList>(
                              //         Constants.boxSavePlayList);
                              // final String playList =
                              //     boxNamePlayList.values.last.namePlayList;
                              // final boxSaveIndexSong =
                              //     await Hive.openBox<SaveSong>(playList);
                              // if (value) {
                              //   await boxSaveIndexSong.add(SaveSong(index));
                              // } else {
                              //   final indexToDelete = boxSaveIndexSong.values
                              //       .toList()
                              //       .indexWhere((element) =>
                              //           element.indexSongs == index);
                              //   if (indexToDelete != -1) {
                              //     await boxSaveIndexSong
                              //         .deleteAt(indexToDelete);
                              //   }
                              // }
                            } catch (e) {
                              print("An error occurred: $e");
                            }
                          },
                        ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          )
        : const SizedBox());
  }

  Future<void> _onSongTap(int index) async {
    try {
      final sources = controller.songsList.map((song) {
        return AudioSource.uri(Uri.parse(song.uri ?? ""));
      }).toList();
      final playlist = ConcatenatingAudioSource(children: sources);
      Get.find<AudioController>().setPlaylist(sources);
      Get.find<AudioController>().playSong(index, playlist);
      // await audioPlayer.play();
    } catch (e) {
      // // Log the error and display a user-friendly message
      // ScaffoldMessenger.of(context.f).showSnackBar(
      //   const SnackBar(
      //       content: Text('Playback error. Please try again later.')),
      // );
    }
  }
}
