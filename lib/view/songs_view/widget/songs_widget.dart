// import 'dart:math';
// import 'dart:ui';
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:amir_music/core/resource/my_colors.dart';
// import 'package:amir_music/core/resource/typography.dart';
// import 'package:amir_music/core/widgets/bottom_shit_arrange_widget.dart';
// import 'package:amir_music/core/widgets/container/bottom_shit_container.dart';
// import 'package:amir_music/core/widgets/container/secondary_Container.dart';
// import 'package:amir_music/core/widgets/future_songs.dart';
// import 'package:amir_music/futuer/home/repository/controller/home_controller.dart';
// import 'package:amir_music/view/songs_view/widget/controller/songs_view_controller.dart';
// import 'package:amir_music/view_model/favorite_controller/favorite_controller.dart';
// import 'package:amir_music/view_model/songs_vm/receive_songs.dart';
// import 'package:on_audio_query/on_audio_query.dart';
//
// class SongsWidget extends StatefulWidget {
//   const SongsWidget({super.key});
//
//   @override
//   State<SongsWidget> createState() => _SongsWidgetState();
// }
//
// class _SongsWidgetState extends State<SongsWidget> {
//   final HomeController homeController = Get.find();
//   final SongList songs = Get.find();
//   final FavoriteController favoriteController = Get.find();
//   final SongsViewController songsViewController = Get.find();
//   int id = 0;
//   Random random = Random();
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     id=random.nextInt(homeController.songs.value.length);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           Container(
//               width: double.infinity,
//               height: 270,
//               color: Colors.black.withOpacity(1),
//               alignment: Alignment.center,
//               child: Stack(
//                 fit: StackFit.expand,
//                 children: [
//                   // Original Image
//                   QueryArtworkWidget(
//                       artworkFit: BoxFit.cover,
//                       nullArtworkWidget: Container(
//                         alignment: Alignment.center,
//                         decoration: const BoxDecoration(
//                           image: DecorationImage(
//                             image: AssetImage("assets/images/songg.jpg"),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                       id: homeController.songs.value[id].id,
//                       type: ArtworkType.AUDIO),
//                   // Blurred Overlay
//                   Positioned.fill(
//                     child: BackdropFilter(
//                       filter: ImageFilter.blur(
//                           sigmaX: 15, sigmaY: 2, tileMode: TileMode.mirror),
//                       child: Container(
//
//                           // Adjust the opacity here
//                           ),
//                     ),
//                   ),
//                   Align(
//                     alignment: Alignment.topLeft,
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(
//                           vertical: 15, horizontal: 15),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           IconButton(
//                               onPressed: () {
//                                 favoriteController.updateFavorite(false);
//                                 homeController.changeIndexPage(2);
//                                 songsViewController
//                                     .changeBuildSongs(FutureBuilderSongs(futureSongs: songs.getSongs()));
//                                 homeController.toggelWidgetHomePage(homeController.indexPage.value);
//                                 homeController
//                                     .toggelWidgetHomePage(homeController.indexPage.value);
//                               },
//                               icon: Icon(
//                                 Icons.arrow_back,
//                                 color: MyColors.white,
//                                 size: 35,
//                               )),
//                           GestureDetector(
//                             onTap: () {
//                               Get.bottomSheet(BottomShitContainer(
//                                   child: BottomShitArrangeWidget()));
//                             },
//                             child:const SizedBox(),
//                             // SvgPicture.asset(
//                             //   'assets/icon/menu.svg',
//                             //   semanticsLabel: 'My SVG Image',
//                             //   height: 20,
//                             //   color: MyColors.white,
//                             // ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Align(
//                     alignment: Alignment.bottomLeft,
//                     child: Padding(
//                       padding: const EdgeInsets.only(left: 20, bottom: 30),
//                       child: Row(children: [
//                         QueryArtworkWidget(
//                             nullArtworkWidget: ClipRRect(
//                               borderRadius: BorderRadius.circular(15),
//                               child: Image.asset(
//                                 "assets/images/songg.jpg",
//                                 height: 150,
//                                 width: 150,
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                             keepOldArtwork: true,
//                             artworkBorder:
//                                 const BorderRadius.all(Radius.circular(20)),
//                             artworkWidth: 150,
//                             artworkHeight: 150,
//                             id: homeController.songs.value[id].id,
//                             type: ArtworkType.AUDIO),
//                         const SizedBox(
//                           width: 20,
//                         ),
//                         Column(
//                           mainAxisSize: MainAxisSize.min,
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             SizedBox(
//                               width: MediaQuery.of(context).size.width - 190,
//                               child: Text(
//                                 softWrap: true,
//                                 overflow: TextOverflow.ellipsis,
//                                 style: Fonts.sm.copyWith(
//                                     color: MyColors.white,
//                                     fontWeight: FontWeight.bold),
//                                 maxLines: 1,
//                                 homeController.songs.value[id].artist
//                                         .toString()
//                               ),
//                             ),
//                             SizedBox(
//                               width: MediaQuery.of(context).size.width - 190,
//                               child: Text(
//                                 overflow: TextOverflow.ellipsis,
//                                 style: Fonts.xs.copyWith(
//                                     color: MyColors.white,
//                                     fontWeight: FontWeight.bold),
//                                 homeController.songs.value[id].title.toString(),
//                                 maxLines: 1,
//                               ),
//                             ),
//                             Container(
//                               decoration: BoxDecoration(
//                                   border: Border.all(
//                                       color: MyColors.white, width: 1)),
//                               margin: const EdgeInsets.symmetric(vertical: 15),
//                               padding: const EdgeInsets.symmetric(
//                                   vertical: 10, horizontal: 40),
//                               child: Text(
//                                 "Play",
//                                 style: Fonts.xs.copyWith(
//                                     color: MyColors.white,
//                                     fontWeight: FontWeight.bold),
//                                 maxLines: 1,
//                               ),
//                             )
//                           ],
//                         )
//                       ]),
//                     ),
//                   )
//                 ],
//               )),
//           Padding(
//             padding: const EdgeInsets.fromLTRB(20, 20, 20, 15),
//             child: Column(
//               children: [
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     SizedBox(
//                       width: 100,
//                       child: Text(
//                         "Songs",
//                         style: Fonts.normal.copyWith(
//                             fontSize: 25,
//                             color: MyColors.white,
//                             fontWeight: FontWeight.bold),
//                         maxLines: 1,
//                       ),
//                     ),
//                     Row(
//                       children: [
//                         SecondaryContainer(
//                           onTap: () {
//                             // homeController.toggelWidgetHomePage(homeController.exploreArtist.value);
//                           },
//                           child: Row(
//                             children: [
//                               Image.asset(
//                                 'assets/icon/play-button-arrowhead.png',
//                                 height: 15,
//                                 color: Colors.white,
//                               ),
//                               const SizedBox(
//                                 width: 5,
//                               ),
//                               Text(
//                                 "play all",
//                                 style: Fonts.xs.copyWith(
//                                     color: MyColors.white,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//             GetBuilder<SongsViewController>(
//               builder: (SongsViewController controller) {
//                 return   controller.buildSongs.value;
//               },)
//               ]
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
