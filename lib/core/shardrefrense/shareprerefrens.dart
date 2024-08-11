import 'dart:async';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AppSharedPreferences {
  late SharedPreferences sharedPreferences;


  AppSharedPreferences() {
    sharedPreferences = Get.find<SharedPreferences>();
  }
  void saveUserData<T>(T save,String key) async {
    switch (T){
      case const (int):
        sharedPreferences.setInt(key, save as int);
        case const (String):
        sharedPreferences.setString(key, save as String);
        case const (bool):
        sharedPreferences.setBool(key, save as bool);
    }

  }

  T load<T>(String key) {
    if (T == int) {
      final getInt = sharedPreferences.getInt(key);
      return (getInt ?? 0) as T;
    } else if (T == String) {
      return (sharedPreferences.getString(key) ?? '') as T;
    } else if (T == bool) {
      final receiveBool = sharedPreferences.getBool(key);
      return (receiveBool ?? false) as T;
    } else {
      throw Exception("Unsupported type");
    }
  }


  Future<void> delete() async {
    sharedPreferences.clear();
  }

}
