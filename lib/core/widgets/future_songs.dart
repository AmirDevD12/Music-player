// import 'dart:async';
// import 'package:amir_music/view_model/songs_vm/receive_songs.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:hive/hive.dart';
// import 'package:amir_music/core/resource/constants.dart';
// import 'package:amir_music/core/widgets/item_listview_songs.dart';
// import 'package:amir_music/model/model/add_name_playlist/add_name_playlist.dart';
// import 'package:amir_music/model/model/save_song/save_song_index.dart';
// import 'package:amir_music/futuer/home/repository/controller/home_controller.dart';
// import 'package:amir_music/view/playing_music_view/widget/Playing_music_view.dart';
// import 'package:amir_music/view_model/audio_controller/audio_controller.dart';
// import 'package:amir_music/view_model/songs_vm/controller/songs_controller.dart';
// import 'package:just_audio/just_audio.dart';
// import 'package:on_audio_query/on_audio_query.dart';
// import 'package:shimmer/shimmer.dart';
//
// class FutureBuilderSongs extends StatefulWidget {
//   final Future futureSongs;
//
//   const FutureBuilderSongs({super.key, required this.futureSongs});
//
//   @override
//   State<FutureBuilderSongs> createState() => _FutureBuilderSongsState();
// }
//
// class _FutureBuilderSongsState extends State<FutureBuilderSongs> {
//   final HomeController homeController = Get.find();
//   final SongsController songsController = Get.find();
//   final AudioPlayer audioPlayer = Get.find();
//
//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(const Duration(seconds: 3)).then((value) {
//       homeController.showSongs.value = true;
//       homeController.scrollController.value.addListener(_scrollListener);
//     });
//   }
//
//   void _scrollListener() {
//     if (homeController.scrollController.value.offset >=
//             homeController.scrollController.value.position.maxScrollExtent &&
//         !homeController.scrollController.value.position.outOfRange &&
//         homeController.scaffoldWidget.value.toString() == "HomeWidget") {
//       // User reached the bottom of the list
//       if (!homeController.loading.value) {
//         setState(() {
//           homeController.loading.value = true;
//         });
//         // Simulate loading for 2 seconds
//         Future.delayed(const Duration(seconds: 2), () {
//           setState(() {
//             // Load 150 more items
//             homeController.visibleItemCount.value += 50;
//             homeController.loading.value = false;
//           });
//         });
//       }
//     }
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     homeController.scrollController.value.removeListener(_scrollListener);
//     homeController.showSongs.value = false;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//         future: SongList().getSongs(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(
//                 child: Text(
//               'Error: ${snapshot.error}',
//               style: const TextStyle(color: Colors.white),
//             ));
//           } else {
//             final songs = snapshot.data!;
//             return ListView.builder(
//
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               itemCount: homeController.indexPage.value == 0
//                   ? homeController.visibleItemCount.value
//                   : songs.length,
//               itemBuilder: (context, index) {
//                 final SongModel song = songs[index];
//                 if (homeController.indexPage.value == 0 &&
//                     homeController.songs.value.length < 9) {
//                   homeController.songs.value.add(song);
//                 }
//                 if (index < homeController.visibleItemCount.value - 1 ||
//                     homeController.indexPage.value != 0) {
//                   return Obx(
//                     () => homeController.showSongs.value == false
//                         ? Shimmer.fromColors(
//                             baseColor: Colors.grey[500]!,
//                             highlightColor: Colors.white,
//                             child: Container(
//                               alignment: Alignment.center,
//                               margin: const EdgeInsets.symmetric(vertical: 5),
//                               padding: const EdgeInsets.symmetric(
//                                 vertical: 30,
//                               ),
//                               color: Colors.green,
//                               child: const SizedBox(),
//                             ),
//                           )
//                         : ItemListviewSongs(
//                             subTitle: song.displayName,
//                             title: song.title,
//                             id: song.id,
//                             onTap: () async {
//                               _onSongTap(songs, index);
//                               if (homeController.pageView[5].toString() !=
//                                       "PlayingMusicView" ) {
//                                 homeController.pageView
//                                     .add(PlayingMusicView(songModel: songs));
//                               }
//                               Get.find<AudioController>().updateCurrentIndex(
//                                   Get.find<AudioPlayer>().currentIndex ?? 0);
//                               homeController.changeIndexPage(5);
//                             },
//                             select: (value) async {
//                               try {
//                                 final boxNamePlayList =
//                                     await Hive.openBox<SaveNamePlayList>(
//                                         Constants.boxSavePlayList);
//                                 final String playList =
//                                     boxNamePlayList.values.last.namePlayList;
//                                 final boxSaveIndexSong =
//                                     await Hive.openBox<SaveSong>(playList);
//                                 if (value) {
//                                   await boxSaveIndexSong.add(SaveSong(index));
//                                 } else {
//                                   final indexToDelete = boxSaveIndexSong.values
//                                       .toList()
//                                       .indexWhere((element) =>
//                                           element.indexSongs == index);
//                                   if (indexToDelete != -1) {
//                                     await boxSaveIndexSong
//                                         .deleteAt(indexToDelete);
//                                   }
//                                 }
//                               } catch (e) {
//                                 print("An error occurred: $e");
//                               }
//                             },
//                             index: index,
//                           ),
//                   );
//                 } else {
//                   if (homeController.loading.value) {
//                     return const Center(
//                       child: CircularProgressIndicator(),
//                     );
//                   } else {
//                     return const SizedBox();
//                   }
//                 }
//               },
//             );
//           }
//         });
//   }
//
//   Future<void> _onSongTap(List<SongModel> listSong, int index) async {
//     try {
//       final sources = listSong.map((song) {
//         return AudioSource.uri(Uri.parse(song.uri ?? ""));
//       }).toList();
//       final playlist = ConcatenatingAudioSource(children: sources);
//       Get.find<AudioController>().setPlaylist(sources);
//       Get.find<AudioController>().playSong(index, playlist);
//       // await audioPlayer.play();
//     } catch (e) {
//       // Log the error and display a user-friendly message
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//             content: Text('Playback error. Please try again later.')),
//       );
//     }
//   }
// }
