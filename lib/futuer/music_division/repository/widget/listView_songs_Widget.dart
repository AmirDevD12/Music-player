import 'package:amir_music/core/widgets/item_listview_songs.dart';
import 'package:amir_music/futuer/music_division/data/model_all_songs/model_all_songs.dart';
import 'package:amir_music/futuer/music_division/repository/controller/music_controller.dart';
import 'package:amir_music/view_model/audio_controller/audio_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:shimmer/shimmer.dart';

class ListviewSongsWidget extends GetView<MusicDivisionController> {
  const ListviewSongsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (MusicDivisionController controller) {
        return controller.songsList.isNotEmpty
            ? ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.songsList.length > 10
                    ? controller.visibleItemCount.value
                    : controller.songsList.length,
                itemBuilder: (context, index) {
                  return GetBuilder<MusicDivisionController>(
                    id: 'song_$index', // استفاده از id یکتا برای هر آیتم
                    builder: (controller) {
                      final ModelAllSongs song = controller.songsList[index];

                      if (index < controller.visibleItemCount.value - 1 ||
                          controller.visibleItemCount.value ==
                              controller.songsList.length) {
                        return controller.showSongs.value == false
                            ? Shimmer.fromColors(
                                baseColor: Colors.grey[500]!,
                                highlightColor: Colors.white,
                                child: Container(
                                  alignment: Alignment.center,
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 5),
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
                                onTap: () async {},
                                changeFavorite: () async {
                                  try {
                                    ModelAllSongs updatedSong = song.copyWith(
                                        favorite: song.favorite ? false : true);

                                    controller.updateSong(index, updatedSong);
                                  } catch (e) {
                                    print("An error occurred: $e");
                                  }
                                },
                              );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  );
                },
              )
            : const SizedBox();
      },
    );
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
