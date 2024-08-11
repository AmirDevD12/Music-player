import 'package:hive/hive.dart';

part 'music_group.g.dart';

@HiveType(typeId: 3)
class MusicGroup {
  @HiveField(0)
  String keyName;

  @HiveField(1)
  List<String> namesArtists;

  MusicGroup({required this.keyName, required this.namesArtists});
}
