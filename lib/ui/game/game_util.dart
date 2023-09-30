import 'package:okina_honban/ui/game/model/block.dart';

import 'model/enum/mino_type.dart';
import 'model/position.dart';

List<List<Block>> create24BlockMat(TetroMino tetroMino) {
  return tetroMino.previewPlacement
      .map((column) => column
          .map(
              (row) => row == 1 ? Block(color: tetroMino.color) : const Block())
          .toList())
      .toList();
}

List<Block> create24Blocks(TetroMino tetroMino) {
  final List<List<Block>> blockMat = create24BlockMat(tetroMino);
  return blockMat.expand((element) => element).toList();
}

List<Position> createPositionsFromIntMat(List<List<int>> intMat) {
  final List<Position> positions = [];
  for (int i = 0; i < intMat.length; i++) {
    for (int j = 0; j < intMat[i].length; j++) {
      if (intMat[i][j] == 1) {
        positions.add(Position(x: j, y: i));
      }
    }
  }
  return positions;
}
