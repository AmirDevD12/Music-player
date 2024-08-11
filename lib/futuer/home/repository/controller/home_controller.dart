import 'package:amir_music/futuer/music_division/repository/page/music.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:on_audio_query/on_audio_query.dart';

class HomeController extends GetxController {


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  final txtSearch = TextEditingController().obs;
  var selectedIcon = Icons.home.obs;
  RxBool showSongs = false.obs;
  RxBool isFavorite = false.obs;
  RxBool loading = false.obs;
  RxInt indexPage=0.obs;
  List<SongModel> songModel=[];
  List<Widget> pageView = [
    const MusicDivision()
    // const HomeWidget(),
    // const ExploreArtist(),
    // const PlayListFolderView(),
    // const SongsWidget(),
    // const SelectSong(),
  ];

  Rx<Widget> scaffoldWidget = const MusicDivision().obs;
  Rx<ScrollController> scrollController = ScrollController().obs;
  List<SongModel> songsRandom = [];



 void changeIndexPage(int index){
   indexPage=index.obs;
   update();
 }
  Widget toggelWidgetHomePage(int index) {
    return pageView[index];
    // scaffoldWidget = widget.obs;
  }
  @override
  Future<void> onClose() async {
    // TODO: implement onClose
    super.onClose();
    /// delete all box
   await Hive.close();
  }
}


