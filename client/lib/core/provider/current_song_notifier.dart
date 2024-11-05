import 'package:client/features/home/models/song_model.dart';
import 'package:client/features/home/repositories/home_local_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:just_audio/just_audio.dart';

part 'current_song_notifier.g.dart';

@riverpod
class CurrentSongNotifier extends _$CurrentSongNotifier {
  late HomeLocalRepository _homeLocalRepository;

  AudioPlayer? audioPlayer;

  bool isPlaying = false;

  @override
  SongModel? build() {
    _homeLocalRepository = ref.watch(homeLocalRepositoryProvider);
    return null;
  }

  void updateSong(SongModel song) async {
    await audioPlayer?.stop();
    audioPlayer = AudioPlayer();

    final audioSource = AudioSource.uri(
      Uri.parse(song.song_url),
    );

    await audioPlayer!.setAudioSource(audioSource);

    audioPlayer!.playerStateStream.listen((value) {
      if (value.processingState == ProcessingState.completed) {
        audioPlayer!.seek(Duration.zero);
        audioPlayer!.pause();
        isPlaying = false;

        state = state?.copyWith(hex_code: state?.hex_code);
      }
    });

    _homeLocalRepository.uploadLocalSong(song);

    audioPlayer!.play();
    isPlaying = true;
    state = song;
  }

  void playPause() {
    if (isPlaying) {
      audioPlayer?.pause();
    } else {
      audioPlayer?.play();
    }
    isPlaying = !isPlaying;
    state = state?.copyWith(hex_code: state?.hex_code);
  }

  void seek(double val) {
    audioPlayer!.seek(Duration(
      milliseconds: (val * audioPlayer!.duration!.inMilliseconds).toInt(),
    ));
  }
}
