import 'package:flutter/material.dart';

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
}
