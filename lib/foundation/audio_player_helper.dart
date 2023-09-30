import 'package:audioplayers/audioplayers.dart';

class AudioPlayerHelper {
  static final AudioPlayerHelper _instance = AudioPlayerHelper._internal();
  factory AudioPlayerHelper() => _instance;
  AudioPlayerHelper._internal();

  static final _audioPlayer = AudioPlayer();

  Future<void> play(String path) async {
    await _audioPlayer.play(AssetSource(path));
  }
}
