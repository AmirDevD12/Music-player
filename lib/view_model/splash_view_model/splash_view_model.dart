import 'package:amir_music/futuer/home/repository/page/home_view.dart';
import 'package:amir_music/futuer/music_division/repository/controller/music_controller.dart';
import 'package:amir_music/futuer/music_division/repository/page/music.dart';
import 'package:amir_music/view/splash/widget/massenger_helper.dart';
import 'package:amir_music/view_model/songs_vm/receive_songs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';

class SplashViewModel extends GetxController {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  RxBool isOpenDrawer = false.obs;
  OnAudioQuery onAudioQuery = OnAudioQuery();

  var content = (const CircularProgressIndicator() as Widget).obs;

  // void loadView() async {
  //   await Future.delayed(const Duration(seconds: 3));
  //   Get.to(() => const HomeWidget());
  // }

  @override
  void onInit() {
    super.onInit();
    checkPermission();
  }

  void checkPermission() async {
    if (!await onAudioQuery.permissionsStatus()) {
      content.value = Messenger(
        msg: "Permission Denied",
        allowFunction: _openTabsScreen,
        closeAppFunction: _closeApp,
      );
    } else {
      _openTabsScreen();
    }
  }

  Future<void> _openTabsScreen() async {
    final status = await onAudioQuery.checkAndRequest();
    if (status) {
      // await Future.delayed(const Duration(seconds: 2));
    }
    await Get.putAsync<List<SongModel>>(() async => ReceiveSongs().getSongs());
    Get.lazyPut(()=>MusicDivisionController(receiveSongs: Get.find<List<SongModel>>()));
    Get.offAndToNamed(MusicDivision.routeMusicDivision);
  }

  void _closeApp() {
    SystemNavigator.pop();
  }

  void openDrawer() {
    scaffoldKey.currentState?.openDrawer();
    update();
  }

  void closeDrawer() {
    scaffoldKey.currentState?.closeDrawer();
  }
}
