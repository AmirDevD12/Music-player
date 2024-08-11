import 'package:amir_music/core/resource/my_colors.dart';
import 'package:amir_music/core/resource/typography.dart';
import 'package:amir_music/futuer/select_name_songs/repository/controller/select_name_songs_controller.dart';
import 'package:amir_music/futuer/select_name_songs/repository/widget/diolog_new_name_grouping.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArtistSelectionScreen extends StatelessWidget {
  static const routerArtistSelectionScreen = "/ArtistSelectionScreen";

  const ArtistSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SelectNameSongsController artistController = Get.put(SelectNameSongsController());

    return Scaffold(
      backgroundColor: MyColors.background,
      appBar: AppBar(
        title: const Text('Select Artists'),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              showNameInputDialog();


              // Get.find<MusicDivisionController>().listNameGrouping[]=[];
              print('Selected Artists: ${artistController.selectedArtists}');
            },
          ),
        ],
      ),
      body: Padding(

        padding: const EdgeInsets.fromLTRB(20, 20, 20, 15),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                style: TextStyle(color: MyColors.white),
                onChanged: (value) {
                  artistController.filterArtistNames(value);
                },
                decoration: InputDecoration(

                  labelText: 'Search Artists',
                  labelStyle: TextStyle(color: MyColors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  prefixIcon:  Icon(Icons.search,color: MyColors.white,),

                ),
              ),
            ),
            Expanded(
              child: Obx(() {
                return ListView.builder(
                  itemCount: artistController.artistNames.length,
                  itemBuilder: (context, index) {
                    final artistName = artistController.artistNames[index];
                    final isSelected = artistController.selectedArtists.contains(artistName);

                    return ListTile(
                      title: Text(artistName,
                        style: Fonts.sm.copyWith(
                            color: MyColors.white, fontWeight: FontWeight.bold),
                      ),
                      trailing: Icon(
                        color: MyColors.white,
                        isSelected ? Icons.check_box : Icons.check_box_outline_blank,
                      ),
                      onTap: () {
                        print("**********");
                        artistController.toggleArtistSelection(artistName);
                      },
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
