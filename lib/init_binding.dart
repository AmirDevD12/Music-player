import 'package:amir_music/view/splash/splash_page.dart';
import 'package:amir_music/view_model/audio_controller/audio_controller.dart';
import 'package:amir_music/view_model/songs_vm/controller/songs_controller.dart';
import 'package:amir_music/view_model/splash_view_model/splash_view_model.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/shardrefrense/shareprerefrens.dart';
import 'view_model/favorite_controller/favorite_controller.dart';

class InitBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    // Get.put(() async => await SharedPreferences.getInstance());
    // Get.put(SongList());
    Get.put(FavoriteController());
    Get.put(AudioPlayer());
    // Get.put(PlayingPageController());
    Get.put(AudioController());
    Get.put(SplashViewModel());
    Get.put(const SplashPage());


    Get.lazyPut(()=>SongsController());
    // Get.lazyPut(()=>SongsViewController());
  }
}
