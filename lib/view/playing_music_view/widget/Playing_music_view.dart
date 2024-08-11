import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:amir_music/core/resource/my_colors.dart';
import 'package:amir_music/core/resource/typography.dart';
import 'package:amir_music/core/widgets/blur_button.dart';
import 'package:amir_music/core/widgets/icon_button_widget.dart';
import 'package:amir_music/view_model/audio_controller/audio_controller.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';

class PlayingMusicView extends StatefulWidget {
  final List<SongModel> songModel;

  const PlayingMusicView({super.key, required this.songModel});

  static const routePlayingMusicView = "/PlayingMusicView";

  @override
  State<PlayingMusicView> createState() => _PlayingMusicviewtate();
}

class _PlayingMusicviewtate extends State<PlayingMusicView> {
  final AudioPlayer audioPlayer = Get.find();
  final AudioController _audioController = Get.find<AudioController>();
  bool loopMode = true;

  @override
  Widget build(BuildContext context) {
    // var media=MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.center,
        color: MyColors.background,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              children: [
                ClipPath(
                  clipper: SemiCircleClipper(),
                  child: Container(
                    // height: 500,
                    padding: const EdgeInsets.only(bottom: 500),
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.deepOrange,
                          Colors.yellow,
                        ],
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ///app bar
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BlurButton(
                              onPressed: () {},
                              child: const Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Text(
                              "Now Playing",
                              maxLines: 1,
                              style: Fonts.normal.copyWith(
                                  color: MyColors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            BlurButton(
                              onPressed: () {},
                              child: const Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 70),

                  ///artImage
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          decoration: const BoxDecoration(
                              color: Colors.orange,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.deepOrange,
                                    blurRadius: 30,
                                    offset: Offset(0.0, 5.0))
                              ]),
                          child: GetBuilder<AudioController>(
                              init: AudioController(),
                              builder: (AudioController controller) {
                                return QueryArtworkWidget(
                                    nullArtworkWidget: Image.asset(
                                      "assets/icon/vinyl-record.png",
                                      width: 300,
                                    ),
                                    artworkWidth: 300,
                                    artworkHeight: 300,
                                    artworkFit: BoxFit.cover,
                                    artworkBorder: const BorderRadius.all(
                                        Radius.circular(150)),
                                    id: widget
                                        .songModel[audioPlayer.currentIndex!]
                                        .id,
                                    type: ArtworkType.AUDIO);
                              }),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                  right: 10, top: 12, bottom: 12),
                              decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.yellow,
                                      Colors.orange,
                                      Colors.deepOrange,
                                    ],
                                  ),
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(30),
                                      bottomRight: Radius.circular(30))),
                              child: Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(
                                        right: 10,
                                        left: 12,
                                        top: 10,
                                        bottom: 10),
                                    decoration: BoxDecoration(
                                        color: MyColors.background,
                                        borderRadius: const BorderRadius.only(
                                            topRight: Radius.circular(30),
                                            bottomRight: Radius.circular(30))),
                                    child: const Icon(
                                      Icons.heart_broken,
                                      color: Colors.orange,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Obx(
                                () => ListTile(
                                  title: Center(
                                      child: Text(
                                    widget
                                        .songModel[_audioController
                                            .currentIndexMusic
                                            .toInt()]
                                        .title,
                                    maxLines: 1,
                                    style: Fonts.normal.copyWith(
                                        color: MyColors.white,
                                        fontWeight: FontWeight.bold),
                                  )),
                                  subtitle: Center(
                                      child: Text(
                                    maxLines: 1,
                                    widget
                                        .songModel[_audioController
                                            .currentIndexMusic
                                            .toInt()]
                                        .displayName,
                                    style: Fonts.xs.copyWith(
                                        color: MyColors.subTitle, fontSize: 15),
                                  )),
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(
                                  right: 10, top: 12, bottom: 12),
                              decoration: BoxDecoration(
                                  color: MyColors.subTitle.withOpacity(0.2),
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      bottomLeft: Radius.circular(30))),
                              child: IconButtonWidget(
                                  icon: "assets/icon/more_btn.png",
                                  onTap: () {},
                                  color: MyColors.subTitle),
                            )
                          ],
                        ),
                        Obx(() {
                          final totalDuration = _audioController.duration.value;
                          final currentPosition =
                              _audioController.position.value;
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              totalDuration > const Duration(seconds: 0)
                                  ? Slider(
                                      activeColor: Colors.orangeAccent,
                                      value: currentPosition.inMilliseconds
                                          .toDouble(),
                                      min: 0,
                                      max: totalDuration.inMilliseconds
                                          .toDouble(),
                                      onChanged: (newPosition) {
                                        _audioController.audioPlayer.seek(
                                          Duration(
                                              milliseconds:
                                                  newPosition.toInt()),
                                        );
                                      },
                                    )
                                  : Slider(
                                      value: 0,
                                      onChanged: (on) {},
                                      activeColor: Colors.orangeAccent),
                              Text(
                                style: Fonts.sm.copyWith(color: MyColors.white),
                                "${currentPosition.toString().split('.').first} / ${totalDuration.toString().split('.').first}",
                              ),
                            ],
                          );
                        })
                      ],
                    ),
                  ),
                ),
              ],
            ),

            ///buttons music
            Container(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButtonWidget(
                      icon: "assets/icon/shuffle.png",
                      onTap: () {
                        if (audioPlayer.shuffleModeEnabled) {
                          audioPlayer.setShuffleModeEnabled(false);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('shuffle of'),
                            ),
                          );
                        } else {
                          audioPlayer.setShuffleModeEnabled(true);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('shuffle on'),
                            ),
                          );
                        }
                      },
                      color: MyColors.subTitle,
                    ),
                    IconButtonWidget(
                      icon: "assets/icon/b_player_previous.png",
                      onTap: () async {
                        await audioPlayer.seekToPrevious();
                        _audioController
                            .updateCurrentIndex(audioPlayer.currentIndex ?? 0);
                      },
                      color: MyColors.white,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.yellow,
                            Colors.orange,
                            Colors.deepOrange,
                          ],
                        ),
                      ),
                      child: Center(
                          child: IconButtonWidget(
                        icon: "assets/icon/play-button-arrowhead.png",
                        onTap: () {
                          if (audioPlayer.playing) {
                            audioPlayer.stop();
                          } else {
                            audioPlayer.play();
                          }
                        },
                        color: MyColors.white,
                      )),
                    ),
                    IconButtonWidget(
                      icon: "assets/icon/b_player_next.png",
                      onTap: () async {
                        await audioPlayer.seekToNext();
                        _audioController
                            .updateCurrentIndex(audioPlayer.currentIndex ?? 0);
                      },
                      color: MyColors.white,
                    ),
                    IconButtonWidget(
                      icon: "assets/icon/repeat.png",
                      onTap: () {
                        loopMode = !loopMode;
                        if (loopMode) {
                          audioPlayer.setLoopMode(LoopMode.off);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('loop off'),
                            ),
                          );
                        } else {
                          audioPlayer.setLoopMode(LoopMode.one);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('loop one'),
                            ),
                          );
                        }
                      },
                      color: MyColors.subTitle,
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

class SemiCircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height / 2);
    path.arcToPoint(
      Offset(size.width, size.height / 2),
      radius: Radius.circular(size.width),
      clockwise: true,
    );
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
