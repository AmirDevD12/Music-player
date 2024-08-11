import 'package:amir_music/futuer/home/repository/page/home_view.dart';
import 'package:amir_music/view/splash/widget/massenger_helper.dart';
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

    Get.offAndToNamed(HomeViewWidget.routerHomeViewWidget);
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
