// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:amir_music/core/resource/constants.dart';
// import 'package:amir_music/core/resource/my_colors.dart';
// import 'package:amir_music/core/resource/typography.dart';
// import 'package:amir_music/core/widgets/FutureBuilder_widget.dart';
// import 'package:amir_music/core/widgets/bottom_shit_arrange_widget.dart';
// import 'package:amir_music/core/widgets/container/bottom_shit_container.dart';
// import 'package:amir_music/core/widgets/container/gride_item_container.dart';
// import 'package:amir_music/core/widgets/container/secondary_Container.dart';
// import 'package:amir_music/core/widgets/future_songs.dart';
// import 'package:amir_music/core/widgets/item_listview_artist.dart';
// import 'package:amir_music/core/widgets/textfild_with_text.dart';
// import 'package:amir_music/view/songs_view/widget/controller/songs_view_controller.dart';
// import 'package:amir_music/view_model/songs_vm/controller/songs_controller.dart';
// import 'package:amir_music/view_model/songs_vm/receive_songs.dart';
// import 'package:on_audio_query/on_audio_query.dart';
//
// import '../../../futuer/home/repository/controller/home_controller.dart';
//
// class HomeWidget extends StatefulWidget {
//   const HomeWidget({super.key});
//
//   static const routeHomeWidget = 0;
//
//   @override
//   State<HomeWidget> createState() => _HomeWidgetState();
// }
//
// class _HomeWidgetState extends State<HomeWidget> {
//   // final SongList songs = Get.find();
//   final SongList songs = SongList();
//   final HomeController homeController = Get.find();
//   final SongsController songsController = Get.find();
//   final SongsViewController songsViewController= Get.find();
//   late Future<Map<String, List<SongModel>>> _futureSongsArtist;
//
//
//   final List<Future> listFuture = [];
//
//   @override
//   void initState() {
//     super.initState();
//     listFuture.add(songs.groupListSongs(Constants.namePop));
//     listFuture.add(songs.groupListSongs(Constants.nameClassic));
//     listFuture.add(songs.groupListSongs(Constants.nameRap));
//     listFuture.add(songs.groupListSongs(Constants.nameNostalgia));
//     songsController.futureSongs.value =
//         songs.getSongs(songSortType: songsController.songSortType.value);
//
//     _futureSongsArtist = songs.getArtists();
//
//     Future.delayed(const Duration(seconds: 3)).then((value) {
//       homeController.showSongs.value = true;
//     });
//
//   }
//
//   @override
//   void dispose() {
//     homeController.showSongs.value = false;
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(20, 20, 20, 15),
//       child: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(bottom: 15),
//             child: Row(
//               children: [
//                 GridSortContainer(
//                   onTap: () {
//                     Get.bottomSheet(
//                         BottomShitContainer(child: BottomShitArrangeWidget()));
//                   },
//                   child:
//                   SvgPicture.asset(
//                     'assets/icon/menu.svg',
//                     semanticsLabel: 'My SVG Image',
//                     height: 20,
//                     color: MyColors.backIcon,
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 20,
//                 ),
//                 const Expanded(
//                     child: TextFiledText(
//                   textInput: 'search',
//                 ))
//               ],
//             ),
//           ),
//           Expanded(
//             child: CustomScrollView(controller:homeController.scrollController.value, slivers: [
//               SliverToBoxAdapter(
//                   child: Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(bottom: 15, left: 5),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Grouping",
//                           style: Fonts.normal.copyWith(
//                               color: MyColors.white,
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 200,
//                     child: ListView.builder(
//                         shrinkWrap: true,
//                         scrollDirection: Axis.horizontal,
//                         itemCount: listFuture.length,
//                         itemBuilder: (context, index) => FutureBuilderWidget(
//                               index: index,
//                               future: listFuture[index],
//                             )),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(
//                         vertical: 15.0, horizontal: 5),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           "Artist",
//                           style: Fonts.normal.copyWith(
//                               color: MyColors.white,
//                               fontWeight: FontWeight.bold),
//                         ),
//                         SecondaryContainer(
//                           onTap: () {
//                             homeController.changeIndexPage(1);
//                             homeController.toggelWidgetHomePage(homeController.indexPage.value);
//                           },
//                           child: Text(
//                             "Explore more",
//                             style: Fonts.xs.copyWith(
//                                 color: MyColors.white,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                   FutureBuilder<Map<String, List<SongModel>>>(
//                     future: _futureSongsArtist,
//                     builder: (context, snapshot) {
//                       if (snapshot.connectionState == ConnectionState.waiting) {
//                         return const CircularProgressIndicator(); // Or any loading indicator you prefer
//                       } else if (snapshot.hasError) {
//                         return Text('Error: ${snapshot.error}');
//                       } else {
//                         final songsBySinger = snapshot.data!;
//                         return SizedBox(
//                           height: 150,
//                           child: ListView.builder(
//                             scrollDirection: Axis.horizontal,
//                             shrinkWrap: true,
//                             itemCount: songsBySinger.length>100?10:songsBySinger.length~/2,
//                             itemBuilder: (context, index) {
//                               final singer = songsBySinger.keys.toList()[index];
//                               final songs = songsBySinger[singer]!.first;
//                               return GestureDetector(
//                                 onTap: () {
//                                   // homeController.toggelWidgetHomePage(
//                                   //     SongsArtist(
//                                   //         songList: songsBySinger[singer]!, back: "HomeWidget",));
//                                 },
//                                 child: SizedBox(
//                                   height: 150,
//                                   child: ItemListviewArtist(
//                                       id: songs.id,
//                                       nameArtist: songs.artist.toString()),
//                                 ),
//                               );
//                             },
//                           ),
//                         );
//                       }
//                     },
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 5),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           "songs",
//                           style: Fonts.normal.copyWith(
//                               color: MyColors.white,
//                               fontWeight: FontWeight.bold),
//                         ),
//                         SecondaryContainer(
//                           onTap: () {
//                             SongSortType songSort=SongSortType.DATE_ADDED;
//                                 if(homeController.saveSorting.value=='Based on name'){
//                                   songSort=SongSortType.DISPLAY_NAME;
//                                 }else if(homeController.saveSorting.value=='Based on artist'){
//                                   songSort=SongSortType.ARTIST;
//                                 }
//                             songsViewController
//                                 .changeBuildSongs(
//                                 FutureBuilderSongs(
//                                     futureSongs: songs.getSongs(songSortType:songSort )));
//                             homeController.changeIndexPage(3);
//                           },
//                           child: Text(
//                             "Explore more",
//                             style: Fonts.xs.copyWith(
//                                 color: MyColors.white,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ],
//               )),
//               SliverList(
//                   delegate: SliverChildBuilderDelegate(
//                 childCount: 1,
//                 (context, index) {
//                   return GetBuilder<SongsViewController>(
//                     builder: (SongsViewController controller) {
//                          return   controller.buildSongs.value;
//                     },);
//                 },
//               ))
//             ]),
//           ),
//         ],
//       ),
//     );
//   }
// }
