import 'dart:math';

import 'package:flutter/material.dart';
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

  final List<List<Block>> _placedBlockMat =
      List.generate(kHNum, (i) => List.generate(kWNum, (j) => const Block()));
  List<List<Block>> get placedBlockMat => _placedBlockMat;

  List<Block> get blocks =>
      _mergedBlockMat!.expand((element) => element).toList();

  List<List<Block>>? _mergedBlockMat;

  List<List<Block>> get mergedBlockMat => _mergedBlockMat!;

  List<List<Block>>? _beforeBlockMat;

  List<List<Block>> get beforeBlockMat => _beforeBlockMat!;

  List<List<Block>> initMat() {
    if (_currentPlacement == null) {
      return placedBlockMat;
    }

    final mat =
        List.generate(kHNum, (i) => List.generate(kWNum, (j) => const Block()));
    for (int i = 0;
        i < _currentMino!.getMinoSizeX(_currentMinoDirection!);
        i++) {
      for (int j = 0;
          j < _currentMino!.getMinoSizeY(_currentMinoDirection!);
          j++) {
        final x = i + _currentPosition!.x;
        final y = j + _currentPosition!.y;
        if (_currentPlacement![i][j] == 1) {
          mat[x][y] = mat[x][y].copyWith(color: _currentMino!.color);
        }
      }
    }
    return mat;
  }

  late TetroMino _nextMino;
  TetroMino get nextMino => _nextMino;

  TetroMino? _currentMino;

  final Position _currentMinoLeftTop = const Position(x: 0, y: 0);

  Position? _currentPosition;

  TetroMino createMino() {
    return TetroMino.values[Random().nextInt(TetroMino.values.length)];
  }

  List<List<Position>>? get _placeablePositionMat {
    if (_currentPlacement == null) {
      return null;
    }
    final calculatePositionMat =
        _currentMino!.calculatePositionMat(_currentMinoDirection!);

    for (int i = 0; i < calculatePositionMat.length; i++) {
      for (int j = 0; j < calculatePositionMat[i].length; j++) {
        calculatePositionMat[i][j] += _currentMinoLeftTop;
      }
    }
    return null;
  }

  MinoDirection? _currentMinoDirection = MinoDirection.N;

  List<List<int>>? get _currentPlacement {
    if (_currentMino == null) {
      return null;
    }
    return _currentMino!.calculatePlacement(_currentMinoDirection!);
  }

  void _init() {
    _beforeBlockMat = initMat();
    _currentMino = createMino();
    _nextMino = createMino();
    _currentPosition = const Position(x: 0, y: kStartPositionY);
    _mergedBlockMat = initMat();
    notifyListeners();
  }

  void _setCurrentMino() {
    _currentMino = _nextMino;
    _nextMino = createMino();
    _currentPosition = const Position(x: 0, y: kStartPositionY);
    _currentMinoDirection = MinoDirection.N;
    clear();
    _beforeBlockMat = mergedBlockMat;
    notifyListeners();
  }

  void updateMat(List<List<Block>> mat) {
    for (int i = 0;
        i < _currentMino!.getMinoSizeX(_currentMinoDirection!);
        i++) {
      for (int j = 0;
          j < _currentMino!.getMinoSizeY(_currentMinoDirection!);
          j++) {
        final x = i + _currentPosition!.x;
        final y = j + _currentPosition!.y;
        if (_currentPlacement![i][j] == 1) {
          mat[x][y] = mat[x][y].copyWith(color: _currentMino!.color);
        }
      }
    }
    _mergedBlockMat = mat;
  }

  List<List<Block>> resetMat() {
    List<List<Block>> mat = beforeBlockMat;

    for (int i = 0;
        i < _currentMino!.getMinoSizeX(_currentMinoDirection!);
        i++) {
      for (int j = 0;
          j < _currentMino!.getMinoSizeY(_currentMinoDirection!);
          j++) {
        final x = i + _currentPosition!.x;
        final y = j + _currentPosition!.y;
        if (_currentPlacement![i][j] == 1) {
          mat[x][y] = mat[x][y].copyWith(color: Colors.black);
        }
      }
    }

    return mat;
  }

  bool checkMove(Position position) {
    List<List<Block>> mat = beforeBlockMat;
    for (int i = 0;
        i < _currentMino!.getMinoSizeX(_currentMinoDirection!);
        i++) {
      for (int j = 0;
          j < _currentMino!.getMinoSizeY(_currentMinoDirection!);
          j++) {
        final x = i + position.x;
        final y = j + position.y;
        if (_currentPlacement![i][j] == 1 && mat[x][y].color != Colors.black) {
          return false;
        }
      }
    }

    return true;
  }

  bool checkRotate(MinoDirection direction) {
    List<List<Block>> mat = beforeBlockMat;

    for (int i = 0; i < _currentMino!.getMinoSizeX(direction); i++) {
      for (int j = 0; j < _currentMino!.getMinoSizeY(direction); j++) {
        final x = i + _currentPosition!.x;
        final y = j + _currentPosition!.y;
        if (_currentPlacement![i][j] == 1 && mat[x][y].color != Colors.black) {
          return false;
        }
      }
    }

    return true;
  }

  void goLeft() {
    if (_currentPosition!.y - 1 < 0) {
      return;
    }

    final tempPosition = _currentPosition! + const Position(x: 0, y: -1);

    List<List<Block>> mat = resetMat();

    if (!checkMove(tempPosition)) {
      return;
    }

    _currentPosition = tempPosition;

    updateMat(mat);

    notifyListeners();
  }

  void goRight() {
    if (_currentPosition!.y +
            (_currentMino!.getMinoSizeY(_currentMinoDirection!) - 1) +
            1 >
        kWNum - 1) {
      return;
    }

    final tempPosition = _currentPosition! + const Position(x: 0, y: 1);

    List<List<Block>> mat = resetMat();

    if (!checkMove(tempPosition)) {
      return;
    }

    _currentPosition = tempPosition;

    updateMat(mat);

    notifyListeners();
  }

  void goDown() {
    if (!checkNext()) {
      _setCurrentMino();
      return;
    }

    final tempPosition = _currentPosition! + const Position(x: 1, y: 0);

    List<List<Block>> mat = resetMat();

    if (!checkMove(tempPosition)) {
      updateMat(mat);
      _setCurrentMino();
      return;
    }

    _currentPosition = tempPosition;

    updateMat(mat);
    notifyListeners();
  }

  void setMinoDirection() {
    final temp = _currentMinoDirection!.rotate();

//回転ではみ出たら更新しない
    if (_currentPosition!.y + (_currentMino!.getMinoSizeY(temp) - 1) + 1 >
            kWNum - 1 ||
        _currentPosition!.x + (_currentMino!.getMinoSizeX(temp) - 1) + 1 >
            kHNum - 1) {
      return;
    }

    List<List<Block>> mat = resetMat();

    if (checkRotate(temp)) {}

    _currentMinoDirection = temp;

    updateMat(mat);

    notifyListeners();
  }

  bool checkNext() {
    return _currentPosition!.x +
            (_currentMino!.getMinoSizeX(_currentMinoDirection!) - 1) <
        kHNum - 1;
  }

  int clear() {
    int result = 0;
    bool check = false;
    for (int i = 0; i < mergedBlockMat.length; i++) {
      for (int j = 0; j < mergedBlockMat[i].length; j++) {
        check = mergedBlockMat[i][j].color != Colors.black;
        if (!check) {
          break;
        }
      }
      if (check) {
        result++;
        _mergedBlockMat!.removeAt(i);
        _mergedBlockMat = [
          List.generate(kWNum, (index) => const Block()),
          ...mergedBlockMat
        ];
        check = false;
      }
    }
    return result;
  }
}
