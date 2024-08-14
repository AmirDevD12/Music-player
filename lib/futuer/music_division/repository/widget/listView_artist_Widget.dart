import 'package:amir_music/core/widgets/item_listview_artist.dart';
import 'package:amir_music/futuer/artist_songs/repository/controller/artist_song_controller.dart';
import 'package:amir_music/futuer/artist_songs/repository/page/artist_song_page.dart';
import 'package:amir_music/futuer/music_division/repository/controller/music_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListviewArtistWidget extends GetView<MusicDivisionController> {
  const ListviewArtistWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Row(
        children: [
          Obx(
            () => Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: controller.mapSongsArtist.length > 100
                    ? 10
                    : controller.mapSongsArtist.length ~/ 2,
                itemBuilder: (context, index) {
                  final singer = controller.mapSongsArtist.keys.toList()[index];
                  final songs = controller.mapSongsArtist[singer]!.first;
                  return GestureDetector(
                    onTap: () {
                      Get.put(ArtistSongController(
                          musicController:
                              Get.find<MusicDivisionController>()));

                      Get.to(const ArtistSongPage(), arguments: {
                        "listArtistSongs": controller.mapSongsArtist[singer]!
                      });
                    },
                    child: SizedBox(
                      height: 150,
                      child: ItemListviewArtist(
                          id: songs.id ?? -1,
                          nameArtist: songs.artist.toString()),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
