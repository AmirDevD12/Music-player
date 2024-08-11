
import 'package:amir_music/core/resource/home_binding.dart';
import 'package:amir_music/futuer/home/repository/page/home_view.dart';
import 'package:amir_music/futuer/select_name_songs/repository/page/select_name_page.dart';
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
      binding: HomeBinding()
    ),
        GetPage(
            name: HomeViewWidget.routerHomeViewWidget,
            page: () => const HomeViewWidget(),
        ),
    GetPage(
            name: ArtistSelectionScreen.routerArtistSelectionScreen,
            page: () =>  ArtistSelectionScreen(),
        ),
      ];
}
