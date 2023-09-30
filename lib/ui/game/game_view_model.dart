import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:okina_honban/ui/base/base.dart';
import 'package:okina_honban/ui/game/game_const.dart';
import 'package:okina_honban/ui/game/model/block.dart';

import 'model/position.dart';

final gameViewModelProvider =
    ChangeNotifierProvider.autoDispose((ref) => GameViewModel(ref));

class GameViewModel extends BaseViewModel {
  GameViewModel(super.ref);

  List<List<Block>> _tBoxes = List.generate(hNum,
      (i) => List.generate(wNum, (j) => Block(position: Position(x: j, y: i))));
  List<List<Block>> get tBoxes => _tBoxes;

  List<Block> get tBoxesFlatten =>
      _tBoxes.expand((element) => element).toList();
}
