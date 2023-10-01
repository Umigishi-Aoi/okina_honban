import 'package:audioplayers/audioplayers.dart';

class AudioPlayerHelper {
  static final AudioPlayerHelper _instance = AudioPlayerHelper._internal();
  factory AudioPlayerHelper() => _instance;
  AudioPlayerHelper._internal();

  static final _audioPlayer = AudioPlayer();

  Future<void> play(String path) async {
    await _audioPlayer.play(AssetSource(path), mode: PlayerMode.mediaPlayer);
  }

  Future<void> pause() async {
    await _audioPlayer.pause();
  }
}

enum Bgm {
  opening(name: 'sounds/add-complex-rhythm.mp3'),
  palying(name: 'sounds/compose-a-fast.mp3'),
  pushButton(name: ''),
  gameOver(name: ''),
  none(name: 'none');

  const Bgm({required this.name});

  final String name;
}
