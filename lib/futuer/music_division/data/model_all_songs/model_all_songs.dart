import 'package:hive/hive.dart';

part 'model_all_songs.g.dart';

@HiveType(typeId: 4)
class ModelAllSongs {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String displayName;
  @HiveField(2)
  final String artist;
  @HiveField(3)
  final String data;
  @HiveField(4)
  final int? duration;
  @HiveField(5)
  final int? dateAdded;
  @HiveField(6)
  final String? uri;
  @HiveField(7)
  final int? id;
  @HiveField(8)
  final bool favorite;

  ModelAllSongs({
    required this.title,
    required this.displayName,
    required this.artist,
    required this.data,
    required this.duration,
    required this.dateAdded,
    required this.uri,
    required this.id,
    required this.favorite,
  });
  ModelAllSongs copyWith({bool? favorite}) {
    return ModelAllSongs(
      title: title,
      displayName: displayName,
      artist: artist,
      data: data,
      duration: duration,
      dateAdded: dateAdded,
      uri: uri,
      id: id,
      favorite: favorite ?? this.favorite,
    );
  }


}
