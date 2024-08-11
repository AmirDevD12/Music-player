import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class AudioController extends GetxController {
  RxInt currentIndexMusic = 0.obs;
  updateCurrentIndex(int newIndex){
    currentIndexMusic.value=newIndex;
    update();
  }
  final AudioPlayer audioPlayer = Get.find<AudioPlayer>();
  final Rx<Duration> duration = Duration.zero.obs;  // Total duration of the song
  final Rx<Duration> position = Duration.zero.obs;  // Current position within the song
  final RxBool isSongCompleted = false.obs;
  final RxList<AudioSource> originalPlaylist = <AudioSource>[].obs; // Original playlist
  final RxList<AudioSource> shuffledPlaylist = <AudioSource>[].obs;
  final RxBool isShuffled = false.obs;
  final RxBool loopMode=true.obs;
  /// Indicates if a song has finished
  AudioController() {
    // Update the position as the song plays
    audioPlayer.positionStream.listen((newPosition) {
      position.value = newPosition;
      if(currentIndexMusic.value!=audioPlayer.currentIndex&&audioPlayer.currentIndex!=null){
        updateCurrentIndex(audioPlayer.currentIndex!.toInt());
      }
    });

    // Update the duration when a new song is set
    audioPlayer.durationStream.listen((newDuration) {
      duration.value = newDuration ?? Duration.zero;
    });
    // Listen for changes in player state


  }
  Future<void> setPlaylist(List<AudioSource> sources) async {
    originalPlaylist.assignAll(sources);
    shuffledPlaylist.assignAll(sources); // Initially, same as original
    await setAudioSource(shuffledPlaylist);
  }

  Future<void> setAudioSource(List<AudioSource> sources) async {
    try {
      final concatenatingAudioSources = ConcatenatingAudioSource(children: sources,shuffleOrder: DefaultShuffleOrder());
      await audioPlayer.setAudioSource(concatenatingAudioSources);
    } catch (e) {
      print('Error setting audio source: $e');
    }
  }

  Future<void> playSong(int index, ConcatenatingAudioSource concatenatingAudioSources) async {
    try {

      await audioPlayer.setAudioSource(
        concatenatingAudioSources,
        initialIndex: index,
        initialPosition: Duration.zero,
      );
      await audioPlayer.play();
    } catch (e) {
      print(e);
    }
  }

  @override
  void onClose() {
    audioPlayer.dispose();  // Clean up resources
    super.onClose();
  }
}
