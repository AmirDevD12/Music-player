import 'package:amir_music/futuer/artist_songs/repository/controller/artist_song_controller.dart';
import 'package:amir_music/futuer/music_division/repository/controller/music_controller.dart';
import 'package:get/get.dart';

class ArtistSongBinding extends Bindings {

  @override
  Future<void> dependencies() async {
    // // TODO: implement dependencies
    Get.put(ArtistSongController(musicController: Get.find<MusicDivisionController>()));
  }
}
