// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:amir_music/futuer/home/repository/controller/home_controller.dart';
// import 'package:amir_music/view_model/songs_vm/receive_songs.dart';
// import 'package:on_audio_query/on_audio_query.dart';
// import 'package:shimmer/shimmer.dart';
// import 'package:amir_music/core/resource/my_colors.dart';
// import 'package:amir_music/core/resource/typography.dart';
// import 'package:amir_music/core/widgets/container/secondary_Container.dart';
// import 'package:amir_music/core/widgets/item_listview_songs.dart';
//
// class ExploreArtist extends StatefulWidget {
//   const ExploreArtist({super.key});
//
//   @override
//   State<ExploreArtist> createState() => _ExploreArtistState();
// }
//
// class _ExploreArtistState extends State<ExploreArtist> {
//   final SongList songs = Get.find();
//   final HomeController homeController = Get.find();
//
//   late Future<Map<String, List<SongModel>>> _futureSongsArtist;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _futureSongsArtist = songs.getArtists();
//     homeController.showSongs.value = false;
//     Future.delayed(const Duration(seconds: 5)).then((value) {
//       homeController.showSongs.value = true;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 "Artist",
//                 style: Fonts.normal.copyWith(
//                     color: MyColors.white, fontWeight: FontWeight.bold),
//               ),
//               SecondaryContainer(
//                 onTap: () {
//                   // homeController.toggelWidgetHomePage(homeController.home);
//                 },
//                 child: Text(
//                   "Back",
//                   style: Fonts.xs.copyWith(
//                       color: MyColors.white, fontWeight: FontWeight.bold),
//                 ),
//               )
//             ],
//           ),
//         ),
//         Expanded(
//           child: CustomScrollView(
//               slivers: [
//             SliverList(
//                 delegate: SliverChildBuilderDelegate(
//               childCount: 1,
//               (context, index) {
//                 return Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   child: FutureBuilder<Map<String, List<SongModel>>>(
//                     future: _futureSongsArtist,
//                     builder: (context, snapshot) {
//                       if (snapshot.connectionState == ConnectionState.waiting) {
//                         return Padding(
//                           padding: const EdgeInsets.all(40.0),
//                           child: Center(
//                               child: CircularProgressIndicator(
//                             color: MyColors.white,
//                             strokeAlign: 20,
//                           )),
//                         ); // Or any loading indicator you prefer
//                       } else if (snapshot.hasError) {
//                         return Text('Error: ${snapshot.error}');
//                       } else {
//                         final songsBySinger = snapshot.data!;
//                         return ListView.builder(
//                           physics: const NeverScrollableScrollPhysics(),
//                           shrinkWrap: true,
//                           itemCount: songsBySinger.length,
//                           itemBuilder: (context, index) {
//                             final singer = songsBySinger.keys.toList()[index];
//                             final songs = songsBySinger[singer]!.first;
//                             return Obx(
//                               () => homeController.showSongs.value == false
//                                   ? Shimmer.fromColors(
//                                       baseColor: Colors.grey[500]!,
//                                       highlightColor: Colors.white,
//                                       child: Container(
//                                         alignment: Alignment.center,
//                                         margin: const EdgeInsets.symmetric(
//                                             vertical: 5),
//                                         padding: const EdgeInsets.symmetric(
//                                           vertical: 30,
//                                         ),
//                                         color: Colors.green,
//                                         child: const SizedBox(),
//                                       ),
//                                     )
//                                   : ItemListviewSongs(
//                                       subTitle: songs.displayName,
//                                       title: songs.title,
//                                       id: songs.id,
//                                       onTap: () {
//                                         // homeController.toggelWidgetHomePage(SongsArtist(songList:songsBySinger[singer]!, back: "ExploreArtist",));
//                                       }, index: index, changeFavorite: () {  }, favorite: false,
//                                     ),
//                             );
//                           },
//                         );
//                       }
//                     },
//                   ),
//                 );
//               },
//             )
//             )
//           ]
//           ),
//         ),
//       ],
//     );
//   }
// }
//
