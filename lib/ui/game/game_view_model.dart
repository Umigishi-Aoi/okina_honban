import 'dart:math';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:okina_honban/ui/base/base.dart';
import 'package:okina_honban/ui/game/game_const.dart';
import 'package:okina_honban/ui/game/model/block.dart';
import 'package:okina_honban/ui/game/model/enum/mino_type.dart';

final gameViewModelProvider =
    ChangeNotifierProvider.autoDispose((ref) => GameViewModel(ref));

class GameViewModel extends BaseViewModel {
  GameViewModel(super.ref) {
    setNextMino();
  }

  List<List<Block>> _blockMat =
      List.generate(hNum, (i) => List.generate(wNum, (j) => Block()));
  List<List<Block>> get blockMat => _blockMat;

  List<Block> get blocks => _blockMat.expand((element) => element).toList();

  late TetroMino _nextMino;
  TetroMino get nextMino => _nextMino;

  void setNextMino() {
    _nextMino = TetroMino.values[Random().nextInt(TetroMino.values.length - 1)];
  }
}
