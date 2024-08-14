import 'package:amir_music/core/models/songs_method_model.dart';
import 'package:amir_music/core/shardrefrense/shareprerefrens.dart';
import 'package:amir_music/futuer/music_division/repository/controller/music_controller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeBinding extends Bindings{
  @override
  Future<void> dependencies() async {
    // // TODO: implement dependencies

    Get.put(SongsMethodModel());
    Get.lazyPut(()=>MusicDivisionController(songsMethodModel: Get.find<SongsMethodModel>()));
  }

}