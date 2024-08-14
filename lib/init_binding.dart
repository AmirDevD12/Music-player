import 'package:amir_music/view/splash/splash_page.dart';
import 'package:amir_music/view_model/splash_view_model/splash_view_model.dart';
import 'package:get/get.dart';

class InitBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    // Get.put(() async => await SharedPreferences.getInstance());
    // Get.put(SongList());
    // Get.put(FavoriteController());
    // Get.put(AudioPlayer());
    // Get.put(PlayingPageController());
    // Get.put(AudioController());
    Get.put(SplashViewModel());
    Get.put(const SplashPage());

    // Get.lazyPut(()=>ExploreArtistController(musicController: Get.find<MusicDivisionController>()));

    // Get.lazyPut(()=>SongsController());
    // Get.lazyPut(()=>SongsViewController());
  }
}
