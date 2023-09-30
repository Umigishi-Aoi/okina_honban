import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:okina_honban/ui/base/base.dart';

final rankingViewModelProvider =
    ChangeNotifierProvider.autoDispose((ref) => RankingViewModel(ref));

class RankingViewModel extends BaseViewModel {
  RankingViewModel(super.ref);
}
