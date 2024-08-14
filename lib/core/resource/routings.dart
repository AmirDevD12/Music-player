import 'package:amir_music/core/resource/Artist_song_binding.dart';
import 'package:amir_music/core/resource/explore_artist_binding.dart';
import 'package:amir_music/core/resource/home_binding.dart';
import 'package:amir_music/futuer/artist_songs/repository/page/artist_song_page.dart';
import 'package:amir_music/futuer/explore_artist/repository/page/artist_page.dart';
import 'package:amir_music/futuer/home/repository/page/home_view.dart';
import 'package:amir_music/futuer/music_division/repository/page/music.dart';
import 'package:amir_music/futuer/select_name_songs/repository/page/select_name_page.dart';
import 'package:amir_music/futuer/show_group_songs/presentation/page/music_group_page.dart';
import 'package:amir_music/view/splash/splash_page.dart';
import 'package:get/get.dart';

class AppRouting {
  static final AppRouting _singleton = AppRouting._internal();

  factory AppRouting() => _singleton;

  AppRouting._internal();

  List<GetPage> pages() => [
        GetPage(
            name: SplashPage.routeSplashPage,
            page: () => const SplashPage(),
          binding: HomeBinding(),

        ),
        GetPage(
          name: MusicDivision.routeMusicDivision,
          page: () => const MusicDivision(),
          // binding: ExploreArtistBinding()
        ),
        GetPage(
          name: ArtistSelectionScreen.routerArtistSelectionScreen,
          page: () => const ArtistSelectionScreen(),
        ),
        GetPage(
            name: ExploreArtist.routerExploreArtist,
            page: () => const ExploreArtist(),
            // binding: ArtistSongBinding()
  ),
        GetPage(
            name: ArtistSongPage.routerArtistSongPage,
            page: () => const ArtistSongPage(),
        ),
    GetPage(
      name: MusicGroupPage.routerMusicGroupPage,
      page: () => const MusicGroupPage(),
    ),
      ];
}
