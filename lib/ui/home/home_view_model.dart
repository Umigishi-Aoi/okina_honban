import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:okina_honban/ui/base/base.dart';

final homeViewModelProvider = ChangeNotifierProvider.autoDispose((ref) => HomeViewModel(ref));

class HomeViewModel extends BaseViewModel {
  HomeViewModel(super._ref);
}