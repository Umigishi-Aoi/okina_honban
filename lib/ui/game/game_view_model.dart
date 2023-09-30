import 'dart:math';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:okina_honban/ui/base/base.dart';
import 'package:okina_honban/ui/game/game_const.dart';
import 'package:okina_honban/ui/game/model/block.dart';
import 'package:okina_honban/ui/game/model/enum/mino_type.dart';
import 'package:okina_honban/ui/game/model/position.dart';

import 'model/enum/mino_direction.dart';

final gameViewModelProvider =
    ChangeNotifierProvider.autoDispose((ref) => GameViewModel(ref));

class GameViewModel extends BaseViewModel {
  GameViewModel(super.ref) {
    _init();
  }

  List<List<Block>> _placedBlockMat =
      List.generate(kHNum, (i) => List.generate(kWNum, (j) => Block()));
  List<List<Block>> get placedBlockMat => _placedBlockMat;

  List<Block> get blocks =>
      _mergedBlockMat.expand((element) => element).toList();

  List<List<Block>> get _mergedBlockMat {
    if (_currentPlacement == null) {
      return _placedBlockMat;
    }

    final mergedBlockMat = _placedBlockMat;

    for (int i = _currentMinoRightBottom!.y; i >= 0; i--) {
      for (int j = _currentMinoRightBottom!.x; j < kWNum; j++) {
        if (_currentPlacement!.reversed.toList()[i][j] == 1) {
          mergedBlockMat[i][j] =
              mergedBlockMat[i][j].copyWith(color: _currentMino!.color);
        }
      }
    }
    return mergedBlockMat;
  }

  late TetroMino _nextMino;
  TetroMino get nextMino => _nextMino;

  TetroMino? _currentMino;

  Position? _currentMinoRightBottom = Position(x: 3, y: 0);

  TetroMino createMino() {
    return TetroMino.values[Random().nextInt(TetroMino.values.length - 1)];
  }

  List<List<Position>>? get _placeablePositionMat {
    if (_currentPlacement == null) {
      return null;
    }
    final calculatePositionMat =
        _currentMino!.calculatePositionMat(_currentMinoDirection!);

    for (int i = 0; i < calculatePositionMat.length; i++) {
      for (int j = 0; j < calculatePositionMat[i].length; j++) {
        calculatePositionMat[i][j] += _currentMinoRightBottom!;
      }
    }
  }

  MinoDirection? _currentMinoDirection = MinoDirection.N;

  List<List<int>>? get _currentPlacement {
    if (_currentMino == null || _currentMinoRightBottom == null) {
      return null;
    }
    return _currentMino!.calculatePlacement(_currentMinoDirection!);
  }

  void _init() {
    _currentMino = createMino();
    _nextMino = createMino();
    notifyListeners();
  }

  void _setCurrentMino() {
    _currentMino = _nextMino;
    _nextMino = createMino();
    _currentMinoRightBottom = Position(x: Random().nextInt(kWNum - 1), y: 0);
    _currentMinoDirection = MinoDirection.N;
    notifyListeners();
  }
}
