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
          [1, 1],
          [1, 1]
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
          [1, 0, 0, 0],
          [1, 0, 0, 0],
          [1, 0, 0, 0],
          [1, 0, 0, 0],
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
        final N = defaultPlacement.length;
        final List<List<int>> result = [];
        for (int i = 0; i < N; i++) {
          final resultRow = <int>[];
          for (int j = 0; j < N; j++) {
            resultRow.add(defaultPlacement[N - 1 - j][i]);
          }
          result.add(resultRow);
        }
        return result;
      case MinoDirection.S:
        return defaultPlacement.reversed.toList();
      case MinoDirection.W:
        final reversed = defaultPlacement.reversed.toList();
        final N = reversed.length;
        final List<List<int>> result = [];
        for (int i = 0; i < N; i++) {
          final resultRow = <int>[];
          for (int j = 0; j < N; j++) {
            resultRow.add(reversed[N - 1 - j][i]);
          }
          result.add(resultRow);
        }
        return result;
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

  int getMinoSizeX(MinoDirection minoDirection) {
    switch (this) {
      case TetroMino.T:
        switch (minoDirection) {
          case MinoDirection.N:
            return 2;
          case MinoDirection.E:
            return 3;
          case MinoDirection.S:
            return 3;
          case MinoDirection.W:
            return 2;
        }
      case TetroMino.O:
        return 2;
      case TetroMino.S:
        switch (minoDirection) {
          case MinoDirection.N:
            return 2;
          case MinoDirection.E:
            return 3;
          case MinoDirection.S:
            return 3;
          case MinoDirection.W:
            return 3;
        }
      case TetroMino.Z:
        switch (minoDirection) {
          case MinoDirection.N:
            return 2;
          case MinoDirection.E:
            return 3;
          case MinoDirection.S:
            return 3;
          case MinoDirection.W:
            return 2;
        }
      case TetroMino.L:
        switch (minoDirection) {
          case MinoDirection.N:
            return 2;
          case MinoDirection.E:
            return 3;
          case MinoDirection.S:
            return 3;
          case MinoDirection.W:
            return 2;
        }
      case TetroMino.J:
        switch (minoDirection) {
          case MinoDirection.N:
            return 2;
          case MinoDirection.E:
            return 3;
          case MinoDirection.S:
            return 3;
          case MinoDirection.W:
            return 2;
        }
      case TetroMino.I:
        switch (minoDirection) {
          case MinoDirection.N:
            return 4;
          case MinoDirection.E:
            return 1;
          case MinoDirection.S:
            return 4;
          case MinoDirection.W:
            return 4;
        }
    }
  }

  int getMinoSizeY(MinoDirection minoDirection) {
    switch (this) {
      case TetroMino.T:
        switch (minoDirection) {
          case MinoDirection.N:
            return 3;
          case MinoDirection.E:
            return 3;
          case MinoDirection.S:
            return 3;
          case MinoDirection.W:
            return 2;
        }
      case TetroMino.O:
        return 2;
      case TetroMino.S:
        switch (minoDirection) {
          case MinoDirection.N:
            return 3;
          case MinoDirection.E:
            return 3;
          case MinoDirection.S:
            return 3;
          case MinoDirection.W:
            return 2;
        }
      case TetroMino.Z:
        switch (minoDirection) {
          case MinoDirection.N:
            return 3;
          case MinoDirection.E:
            return 3;
          case MinoDirection.S:
            return 3;
          case MinoDirection.W:
            return 2;
        }
      case TetroMino.L:
        switch (minoDirection) {
          case MinoDirection.N:
            return 3;
          case MinoDirection.E:
            return 3;
          case MinoDirection.S:
            return 3;
          case MinoDirection.W:
            return 2;
        }
      case TetroMino.J:
        switch (minoDirection) {
          case MinoDirection.N:
            return 3;
          case MinoDirection.E:
            return 3;
          case MinoDirection.S:
            return 3;
          case MinoDirection.W:
            return 2;
        }
      case TetroMino.I:
        switch (minoDirection) {
          case MinoDirection.N:
            return 1;
          case MinoDirection.E:
            return 4;
          case MinoDirection.S:
            return 4;
          case MinoDirection.W:
            return 4;
        }
    }
  }
}
