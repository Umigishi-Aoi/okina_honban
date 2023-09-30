import 'package:okina_honban/ui/game/model/block.dart';

import 'model/enum/mino_type.dart';

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
