// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:amir_music/core/resource/my_colors.dart';
// import 'package:amir_music/core/resource/typography.dart';
// import 'package:amir_music/core/widgets/container/secondary_Container.dart';
//
// import 'package:amir_music/futuer/home/repository/controller/home_controller.dart';
// import 'package:amir_music/view/songs_view/widget/controller/songs_view_controller.dart';
// import 'package:amir_music/view_model/songs_vm/receive_songs.dart';
//
// class SelectSong extends StatefulWidget {
//   const SelectSong({super.key});
//
//   @override
//   State<SelectSong> createState() => _SelectSongState();
// }
//
// class _SelectSongState extends State<SelectSong> {
//   final SongList songs = Get.find();
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
//                 "Select Song",
//                 style: Fonts.normal.copyWith(
//                     color: MyColors.white, fontWeight: FontWeight.bold),
//               ),
//               SecondaryContainer(
//                 onTap: () {
//                   Get.find<HomeController>().changeIndexPage(4);
//                   Get.find<HomeController>().
//                   toggelWidgetHomePage(Get.find<HomeController>().indexPage.value
//                   );
//                 },
//                 child: Text(
//                   "Add songs",
//                   style: Fonts.xs.copyWith(
//                       color: MyColors.white, fontWeight: FontWeight.bold),
//                 ),
//               )
//             ],
//           ),
//         ),
//         Expanded(
//           child: CustomScrollView( slivers: [
//             SliverList(
//                 delegate: SliverChildBuilderDelegate(
//                   childCount: 1,
//                       (context, index) {
//                     return Get.find<SongsViewController>().buildSongs.value;
//                   },
//                 ))
//           ]),
//         ),
//
//       ],
//     );
//   }
// }
