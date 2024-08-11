import 'package:hive/hive.dart';
part "add_name_playlist.g.dart";
@HiveType(typeId: 0)
class SaveNamePlayList {
  SaveNamePlayList(this.namePlayList);

  @HiveField(0)
  String namePlayList;
}