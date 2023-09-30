import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../base/base.dart';

final rankingViewModelProvider =
    ChangeNotifierProvider.autoDispose(RankingViewModel.new);

class RankingViewModel extends BaseViewModel {
  RankingViewModel(super.ref);
}
