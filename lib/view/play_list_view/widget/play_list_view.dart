import 'package:amir_music/core/resource/constants.dart';
import 'package:amir_music/core/resource/my_colors.dart';
import 'package:amir_music/core/resource/typography.dart';
import 'package:amir_music/core/widgets/item_listview_grouping_music.dart';
import 'package:amir_music/futuer/home/repository/controller/home_controller.dart';
import 'package:amir_music/model/model/add_name_playlist/add_name_playlist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class PlayListFolderView extends StatefulWidget {
  const PlayListFolderView({super.key});

  @override
  State<PlayListFolderView> createState() => _PlayListFolderviewtate();
}

class _PlayListFolderviewtate extends State<PlayListFolderView> {
  final HomeController homeController = Get.find();
  var boxNamePlayList =
      Hive.openBox<SaveNamePlayList>(Constants.boxSavePlayList);
  String namePlayList = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(children: [
          // const BackWidget(name: "Play List"),
          Expanded(
            child: CustomScrollView(slivers: [
              SliverList(
                  delegate: SliverChildBuilderDelegate(
                childCount: 1,
                (context, index) {
                  return GridView.builder(
                      itemCount: Constants.groupingMusic.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 10,
                              crossAxisCount: 2,
                              mainAxisExtent: 200),
                      itemBuilder: (BuildContext context, int index) {
                        return ItemListviewGrouping(
                            image: Constants
                                .groupingImageMusic[index < 7 ? index : 4],
                            title: Constants.groupingMusic[index],
                            subTitle: "2songs",
                            id: 0);
                      });
                },
              )),
              SliverList(
                  delegate: SliverChildBuilderDelegate(
                childCount: 1,
                (context, index) {
                  return FutureBuilder(
                      future: boxNamePlayList,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(
                              child: Text('Error: ${snapshot.error}'));
                        } else {
                          final listName = snapshot.data!;
                          return GridView.builder(
                              itemCount: listName.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisSpacing: 10,
                                      crossAxisCount: 2,
                                      mainAxisExtent: 200),
                              itemBuilder: (BuildContext context, int index) {
                                return ItemListviewGrouping(
                                    image: Constants.groupingImageMusic[
                                        index < 5 ? index : 4],
                                    title: listName.getAt(index)!.namePlayList,
                                    subTitle: "2songs",
                                    id: 0);
                              });
                        }
                      });
                },
              )),
            ]),
          ),
        ]),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              backgroundColor: MyColors.subTitle,
              onPressed: () {
                Get.dialog(
                  AlertDialog(
                    title: Text(
                      'New Playlist',
                      style: Fonts.normal,
                    ),
                    content: TextField(
                      onChanged: (value) {
                        namePlayList = value;
                      },
                      decoration: InputDecoration(
                          labelStyle: Fonts.sm,
                          labelText: "Name playlist",
                          border: const UnderlineInputBorder()),
                    ),
                    actions: [
                      ElevatedButton(
                        onPressed: () async {
                          var boxNamePlayList =
                              await Hive.openBox<SaveNamePlayList>("ListName");
                          await boxNamePlayList.clear();
                          Get.back();
                        },
                        child: const Text('CANCEL'),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          var boxNamePlayList =
                              await Hive.openBox<SaveNamePlayList>("ListName");
                          SaveNamePlayList saveName =
                              SaveNamePlayList(namePlayList);
                          await boxNamePlayList.add(saveName);
                          homeController.toggelWidgetHomePage(
                              homeController.indexPage.value);
                          Get.back();
                        },
                        child: const Text('ok'),
                      ),
                    ],
                  ),
                );
              },
              child: Icon(
                Icons.add,
                color: MyColors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}
