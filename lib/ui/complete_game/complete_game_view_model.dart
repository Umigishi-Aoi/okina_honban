import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:okina_honban/ui/base/base.dart';
import 'package:okina_honban/data/model/model.dart';

final completeGameViewModelProvider = ChangeNotifierProvider.autoDispose((ref) => CompleteGameViewModel(ref));

class CompleteGameViewModel extends BaseViewModel {
  CompleteGameViewModel(super.ref);

}