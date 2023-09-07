//https://medium.com/theotherdev-s/getting-to-know-flutter-simple-audioplayer-5cff6ac2b52f
import 'package:audioplayers/audioplayers.dart';

class AudioplayersHelper {
  static late AudioPlayer _audioPlayer;

  static AudioPlayer init() => _audioPlayer = AudioPlayer();

  static void play({required String path}) async {
    await _audioPlayer.stop();
    await _audioPlayer.play(AssetSource(path));
  }

  static void stop({required String path}) async {
    await _audioPlayer.stop();
  }
}
