import 'package:amir_music/core/shardrefrense/shareprerefrens.dart';
import 'package:amir_music/futuer/home/repository/controller/home_controller.dart';
import 'package:amir_music/futuer/music_division/repository/controller/music_controller.dart';
import 'package:amir_music/view_model/songs_vm/receive_songs.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeBinding extends Bindings{
  @override
  Future<void> dependencies() async {
    // // TODO: implement dependencies
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Get.put<SharedPreferences>(sharedPreferences);
    Get.put<AppSharedPreferences>(AppSharedPreferences());
    Get.lazyPut(()=>ReceiveSongs());
    Get.lazyPut(()=>MusicDivisionController(receiveSongs: Get.find()));
    Get.lazyPut(()=>HomeController());

  }

}