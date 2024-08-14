import 'package:amir_music/futuer/explore_artist/repository/controller/artist_controller.dart';
import 'package:amir_music/futuer/music_division/repository/controller/music_controller.dart';
import 'package:get/get.dart';

class ExploreArtistBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    // // TODO: implement dependencies
    Get.put(ExploreArtistController(musicController: Get.find<MusicDivisionController>()));
  }
}
