import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/repository/repository.dart';
import '../base/base.dart';

import 'package:audioplayers/audioplayers.dart';

final homeViewModelProvider =
    ChangeNotifierProvider.autoDispose(HomeViewModel.new);

class HomeViewModel extends BaseViewModel {
  HomeViewModel(super.ref)
      : _supabaseRepository =
            ref.watch<SupabaseRepository>(supabaseRepositoryProvider);

  final SupabaseRepository _supabaseRepository;

  Future<void> signOut() async => callFuture<void>(
        () async => _supabaseRepository.signOut(),
      );
}

  AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;

  Future<void> playMusic() async {
    //音楽を再生させるクラス
    await audioPlayer.play(AssetSource('generate-a-rhythmic.mp3'));//新