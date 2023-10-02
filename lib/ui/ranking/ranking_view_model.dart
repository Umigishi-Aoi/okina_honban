import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:okina_honban/data/model/model.dart';
import 'package:okina_honban/data/repository/repository.dart';

import '../base/base.dart';

final rankingViewModelProvider =
    ChangeNotifierProvider((ref) => RankingViewModel(ref));

class RankingViewModel extends BaseViewModel {
  RankingViewModel(super.ref);

  Result<List<TetoeicUser>>? _usersResult;

  Result<List<TetoeicUser>>? get usersResult => _usersResult;

  List<TetoeicUser>? get users => _usersResult?.data;

  Future<void> setTetoeicUsersResult() async {
    _usersResult = await callFuture<List<TetoeicUser>>(
        () async => ref.read(supabaseRepositoryProvider).getScores());
    notifyListeners();
  }
}
