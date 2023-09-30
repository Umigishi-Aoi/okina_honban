import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:okina_honban/ui/game/component/block_widget.dart';

import '../game_util.dart';
import '../model/enum/mino_type.dart';

class PreviewMino extends HookConsumerWidget {
  const PreviewMino({super.key, required this.tetroMino, required this.length});

  final TetroMino tetroMino;
  final double length;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GridView.count(
      crossAxisCount: 4,
      children: create24Blocks(tetroMino)
          .map((block) => BlockWidget(
                block: block,
                length: length,
              ))
          .toList(),
    );
  }
}
