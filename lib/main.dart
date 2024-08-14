import 'package:amir_music/core/resource/routings.dart';
import 'package:amir_music/futuer/music_division/data/model_hive/music_group.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive_flutter/adapters.dart';

import 'core/config/theme_data.dart';
import 'futuer/music_division/data/model_all_songs/model_all_songs.dart';
import 'init_binding.dart';
import 'model/model/add_name_playlist/add_name_playlist.dart';
import 'model/model/save_song/save_song_index.dart';
import 'view/splash/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  print("object");
  await Hive.initFlutter();
  Hive.registerAdapter(SaveNamePlayListAdapter());
  Hive.registerAdapter(SaveSongAdapter());
  Hive.registerAdapter(MusicGroupAdapter());
  Hive.registerAdapter(ModelAllSongsAdapter());
  await Hive.openBox<SaveNamePlayList>("ListName");
  await Hive.openBox<SaveSong>("Favorite");
  await Hive.openBox<MusicGroup>("MusicGroup");
  await Hive.openBox<ModelAllSongs>("AllSongs");

  runApp(const MyApp());

}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeConfig.theme,

      initialBinding: InitBinding(),
      initialRoute: SplashPage.routeSplashPage,
      getPages: AppRouting().pages(),

    );
  }
}
