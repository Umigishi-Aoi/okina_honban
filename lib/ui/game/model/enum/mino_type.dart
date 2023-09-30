import 'package:flutter/material.dart';
import 'package:okina_honban/ui/game/model/enum/mino_direction.dart';
import 'package:okina_honban/ui/game/model/position.dart';

enum TetroMino { T, O, S, Z, L, J, I }

extension MinoPlacements on TetroMino {
  List<List<int>> get defaultPlacement {
    switch (this) {
      case TetroMino.T:
        return [
          [0, 1, 0],
          [1, 1, 1],
          [0, 0, 0],
        ];
      case TetroMino.O:
        return [
          [0, 0, 0],
          [0, 1, 1],
          [0, 1, 1],
        ];
      case TetroMino.S:
        return [
          [0, 1, 1],
          [1, 1, 0],
          [0, 0, 0],
        ];
      case TetroMino.Z:
        return [
          [1, 1, 0],
          [0, 1, 1],
          [0, 0, 0],
        ];
      case TetroMino.L:
        return [
          [0, 0, 1],
          [1, 1, 1],
          [0, 0, 0],
        ];
      case TetroMino.J:
        return [
          [1, 0, 0],
          [1, 1, 1],
          [0, 0, 0],
        ];
      case TetroMino.I:
        return [
          [0, 0, 0, 0],
          [0, 0, 0, 0],
          [1, 1, 1, 1],
          [0, 0, 0, 0],
        ];
    }
  }

  List<List<int>> get previewPlacement {
    switch (this) {
      case TetroMino.T:
        return [
          [0, 1, 1, 1],
          [0, 0, 1, 0],
        ];
      case TetroMino.O:
        return [
          [0, 1, 1],
          [0, 1, 1],
        ];
      case TetroMino.S:
        return [
          [0, 0, 1, 1],
          [0, 1, 1, 0],
        ];
      case TetroMino.Z:
        return [
          [0, 1, 1, 0],
          [0, 0, 1, 1],
        ];
      case TetroMino.L:
        return [
          [0, 0, 0, 1],
          [0, 1, 1, 1],
        ];
      case TetroMino.J:
        return [
          [0, 1, 0, 0],
          [0, 1, 1, 1],
        ];
      case TetroMino.I:
        return [
          [1, 1, 1, 1],
          [0, 0, 0, 0],
        ];
    }
  }

  Color get color {
    switch (this) {
      case TetroMino.T:
        return Colors.purple;
      case TetroMino.O:
        return Colors.yellow;
      case TetroMino.S:
        return Colors.lightGreen;
      case TetroMino.Z:
        return Colors.red;
      case TetroMino.L:
        return Colors.orange;
      case TetroMino.J:
        return Colors.blue;
      case TetroMino.I:
        return Colors.cyan;
    }
  }

  List<List<int>> calculatePlacement(MinoDirection minoDirection) {
    switch (minoDirection) {
      case MinoDirection.N:
        return defaultPlacement;
      case MinoDirection.E:
        return defaultPlacement.map((row) => row.reversed.toList()).toList();
      case MinoDirection.S:
        return defaultPlacement.reversed.toList();
      case MinoDirection.W:
        return defaultPlacement
            .map((row) => row.reversed.toList())
            .toList()
            .reversed
            .toList();
    }
  }

  List<List<Position>> calculatePositionMat(MinoDirection minoDirection) {
    final List<List<int>> placement = calculatePlacement(minoDirection);
    final List<List<Position>> positionMat = [];
    for (int i = 0; i < placement.length; i++) {
      final List<Position> positions = [];
      for (int j = 0; j < placement[i].length; j++) {
        if (placement[i][j] == 1) {
          positions.add(Position(x: j, y: i));
        }
      }
      positionMat.add(positions);
    }
    return positionMat;
  }
}
