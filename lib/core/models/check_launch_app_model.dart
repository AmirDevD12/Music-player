import 'package:amir_music/core/resource/constants.dart';
import 'package:amir_music/core/shardrefrense/shareprerefrens.dart';
import 'package:get/get.dart';

class CheckLaunchAppModel {
  late AppSharedPreferences _appSharedPreferences;
  bool _isFirstLaunch = false;
  bool get firstLaunch => _isFirstLaunch;

  // Private constructor
  CheckLaunchAppModel._internal() {
    _appSharedPreferences = Get.find<AppSharedPreferences>();
  }

  // Single instance
  static final CheckLaunchAppModel _instance = CheckLaunchAppModel._internal();

  // Factory constructor to return the singleton instance
  factory CheckLaunchAppModel() {
    return _instance;
  }

  // Method to check first launch
  void checkFirstLaunch() {
    final bool check = _appSharedPreferences.load(Constants.keyCheckFirstLaunch);

    if (check) {
      _isFirstLaunch = true;
    } else {
      _appSharedPreferences.saveUserData(true, Constants.keyCheckFirstLaunch);
    }
  }
}
