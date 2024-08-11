import 'package:get/get.dart';

class FavoriteController extends GetxController {
  var indexFavorite = -1.obs;
  RxBool openBoxFavorite=false.obs;
  // Assuming you're using Rx variable
RxMap<int,bool> disLike= const <int,bool>{}.obs ;
  void updateFavorite(bool stateBox) {
    openBoxFavorite= stateBox.obs;
    update();
  }
}
