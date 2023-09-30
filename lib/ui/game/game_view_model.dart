import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:okina_honban/ui/base/base.dart';
import 'package:okina_honban/ui/game/game_const.dart';
import 'package:okina_honban/ui/game/model/t_box.dart';

import 'model/position.dart';

final gameViewModelProvider =
    ChangeNotifierProvider.autoDispose((ref) => GameViewModel(ref));

class GameViewModel extends BaseViewModel {
  GameViewModel(super.ref);

  List<List<TBox>> _tBoxes = List.generate(hNum,
      (i) => List.generate(wNum, (j) => TBox(position: Position(x: j, y: i))));
  List<List<TBox>> get tBoxes => _tBoxes;

  List<TBox> get tBoxesFlatten => _tBoxes.expand((element) => element).toList();
}
