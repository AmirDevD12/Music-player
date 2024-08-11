// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:amir_music/core/resource/my_colors.dart';
// import 'package:amir_music/core/resource/typography.dart';
// import 'package:amir_music/core/widgets/container/secondary_Container.dart';
// import 'package:amir_music/core/widgets/future_songs.dart';
// import 'package:amir_music/futuer/home/repository/controller/home_controller.dart';
// import 'package:amir_music/view/songs_view/widget/controller/songs_view_controller.dart';
// import 'package:amir_music/view_model/songs_vm/receive_songs.dart';
//
// class BackWidget extends StatefulWidget {
//   final String name;
//   const BackWidget({super.key, required this.name});
//
//   @override
//   State<BackWidget> createState() => _BackWidgetState();
// }
//
// class _BackWidgetState extends State<BackWidget> {
//   final SongList songs = Get.find();
//   final SongsViewController songsViewController = Get.find();
//   final HomeController homeController = Get.find();
//   @override
//   Widget build(BuildContext context) {
//     return   Padding(
//       padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             widget.name,
//             style: Fonts.normal.copyWith(
//                 color: MyColors.white, fontWeight: FontWeight.bold),
//           ),
//           SecondaryContainer(
//             onTap: () async{
//               songsViewController
//                   .changeBuildSongs(FutureBuilderSongs(futureSongs: SongList().getSongs()));
//               homeController.changeIndexPage(0);
//               // homeController.toggelWidgetHomePage(homeController.indexPage.value);
//             },
//             child: Text(
//               "Back",
//               style: Fonts.xs.copyWith(
//                   color: MyColors.white, fontWeight: FontWeight.bold),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
