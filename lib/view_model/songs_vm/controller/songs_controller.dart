import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';

class SongsController extends GetxController {
  Rx<SongSortType> songSortType = SongSortType.DATE_ADDED.obs;
  late Rx<Future<List<SongModel>>> futureSongs = Future<List<SongModel>>.value([]).obs;
}
