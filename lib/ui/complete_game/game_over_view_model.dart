import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:okina_honban/ui/base/base.dart';

final gameOverPageViewModelProvider =
    ChangeNotifierProvider.autoDispose((ref) => GameOverPageViewModel(ref));

class GameOverPageViewModel extends BaseViewModel {
  GameOverPageViewModel(super.ref);
}
