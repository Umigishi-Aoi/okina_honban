import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:okina_honban/data/model/model.dart';
import 'package:okina_honban/data/repository/repository.dart';

import '../base/base.dart';

final rankingViewModelProvider =
    ChangeNotifierProvider.autoDispose(RankingViewModel.new);

class RankingViewModel extends BaseViewModel {
  RankingViewModel(super.ref) {
    init();
    notifyListeners();
  }
  List<TetoeicUser>? users;

  Future<void> init() async {
    final usersResult = await callFuture<List<TetoeicUser>>(
        () async => ref.read(supabaseRepositoryProvider).getScores());

    users = usersResult.data;
    notifyListeners();
  }
}
